import axios from 'axios'
import { ApiResponse, UserDataResponse } from '../types/api'
import { removeDataOnLogout } from '../utils/utils'

const API_URL = 'https://localhost/api/'
const ACCOUNT_URL = `${API_URL}accounts/`
const AUTH_URL = `${API_URL}auth/`

const api = {
    ACCOUNT: {
        REGISTER: `${ACCOUNT_URL}register/`,
        DELETE: `${ACCOUNT_URL}delete/`,
        DATA: `${ACCOUNT_URL}data/`,
    },
    AUTH: {
        ISAUTH: `${AUTH_URL}is_authenticated/`,
        LOGIN: `${AUTH_URL}token/`,
        LOGOUT: `${AUTH_URL}logout/`,
        REFRESH: `${AUTH_URL}token/refresh/`,
    },
}

async function refreshToken() {
    try {
        const refreshTokenResponse = await axios.post(api.AUTH.REFRESH, {}, { withCredentials: true })
        console.log('Token refreshed:', refreshTokenResponse.data)
        return refreshTokenResponse.data
    } catch (error) {
        console.error('Erreur lors du rafraîchissement du token', error)
        return null
    }
}

async function requestWithTokenRefresh<T>(func: () => Promise<T>): Promise<T | { success: false, error: string }> {
    try {
        return await func()
    } catch (error: any) {
        if (error.response?.status === 401) {
            console.log('401 Unauthorized detected, attempting to refresh token...')
            const tokenData: ApiResponse = await refreshToken()
            if (tokenData.success) {
                console.log('Retrying original request with new token...')
                try {
                    return await func()
                } catch (retryError: any) {
                    console.error('Retry failed:', retryError)
                    return { success: false, error: retryError.message || 'Retry failed' }
                }
            } else {
                console.error('Token refresh failed, logging out...')
                await removeDataOnLogout()
                await logout()
                return { success: false, error: 'Token refresh failed, user logged out' }
            }
        }
        console.error(error.response?.data?.error || error.message || 'Unknown error')
        return { success: false, error: error.message || 'Unknown error' }
    }
}

// Authentification
export const isAuthenticated = async (): Promise<ApiResponse> => {
    return await requestWithTokenRefresh<ApiResponse>(() =>
        axios.post(api.AUTH.ISAUTH, {}, { withCredentials: true }).then(res => res.data)
    )
}

// Enregistrement d'utilisateur
export const register = async (username: string, email: string | null, password: string): Promise<ApiResponse> => {
    const payload = email ? { username, email, password } : { username, password }
    return await requestWithTokenRefresh<ApiResponse>(() =>
        axios.post(api.ACCOUNT.REGISTER, payload, { withCredentials: true }).then(res => res.data)
    )
}

// Connexion
export const login = async (username: string, password: string): Promise<ApiResponse> => {
    const payload = { username, password }
    return await requestWithTokenRefresh<ApiResponse>(() =>
        axios.post(api.AUTH.LOGIN, payload, { withCredentials: true }).then(res => res.data)
    )
}

// Déconnexion
export const logout = async (): Promise<ApiResponse> => {
    return await requestWithTokenRefresh<ApiResponse>(() =>
        axios.post(api.AUTH.LOGOUT, {}, { withCredentials: true }).then(res => res.data)
    )
}

// Supprimer un utilisateur
export const deleteUser = async (): Promise<ApiResponse> => {
    return await requestWithTokenRefresh<ApiResponse>(() =>
        axios.delete(api.ACCOUNT.DELETE, { withCredentials: true }).then(res => res.data)
    )
}

// Récupérer les données utilisateur
export const getUserData = async (): Promise<UserDataResponse> => {
    return await requestWithTokenRefresh<UserDataResponse>(() =>
        axios.get(api.ACCOUNT.DATA, { withCredentials: true }).then(res => res.data)
    )
}

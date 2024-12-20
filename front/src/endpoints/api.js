import axios from 'axios'
import { removeDataOnLogout } from '../utils/utils'

const API_URL = 'https://localhost/api/'
const ACCOUNT_URL = `${API_URL}accounts/`
const AUTH_URL = `${API_URL}auth/`
const FRIENDS_URL = `${API_URL}friends/`
const DFA_URL = `${API_URL}dfa/`

const api =
{
    ACCOUNT:
    {
        REGISTER: `${ACCOUNT_URL}register/`,
        DELETE: `${ACCOUNT_URL}delete/`,
        DATA: `${ACCOUNT_URL}data/`,
        PROFILE: `${ACCOUNT_URL}profile/`,
        UPLOAD_PHOTO: `${ACCOUNT_URL}upload_profile_photo/`,
        EDIT: `${ACCOUNT_URL}edit/`
    },
    AUTH:
    {
        ISAUTH: `${AUTH_URL}is_authenticated/`,
        LOGIN: `${AUTH_URL}token/`,
        LOGOUT: `${AUTH_URL}logout/`,
        REFRESH: `${AUTH_URL}token/refresh/`
    },
    FRIENDS:
    {
        ACTION: `${FRIENDS_URL}`,
        LIST: `${FRIENDS_URL}list/`,
        SEARCH: `${FRIENDS_URL}search/`,
        REQUESTS: `${FRIENDS_URL}requests/`
    },
    DFA:
    {
        SEND_EMAIL: `${DFA_URL}send_email/`,
        ACTIVATE: `${DFA_URL}activate/`
    }
}

async function refreshToken()
{
    try
    {
        const refreshTokenResponse = await axios.post(api.AUTH.REFRESH, {}, { withCredentials: true })
        return refreshTokenResponse.data
    }
    catch (error)
    {
        console.error('Erreur lors du rafraîchissement du token', error)
        return null
    }
}

async function requestWithTokenRefresh(func)
{
    try
    {
        return await func()
    }
    catch (error)
    {
        if (error.response.status === 401)
        {
            const tokenData = await refreshToken()
            if (tokenData && tokenData.success)
            {
                try
                {
                    return await func()
                }
                catch (retryError)
                {
                    console.error('Retry failed:', retryError)
                    return { success: false, error: retryError.message || 'Retry failed' }
                }
            }
            else
            {
                console.error('Token refresh failed, logging out...')
                await removeDataOnLogout()
                await logout()
                return { success: false, error: 'Token refresh failed, user logged out' }
            }
        }
        console.error(error.response.data.error || error.message || 'Unknown error')
        return { success: false, error: error.message || 'Unknown error' }
    }
}

export const isAuthenticated = async () =>
{
    return await requestWithTokenRefresh(() =>
        axios.post(api.AUTH.ISAUTH, {}, { withCredentials: true }).then(res => res.data)
    )
}

export const register = async (username, email, password) =>
{
    const payload = email ? { username, email, password } : { username, password }
    return await requestWithTokenRefresh(() =>
        axios.post(api.ACCOUNT.REGISTER, payload, { withCredentials: true }).then(res => res.data)
    )
}

export const login = async (username, password) =>
{
    const payload = { username, password }
    return await requestWithTokenRefresh(() =>
        axios.post(api.AUTH.LOGIN, payload, { withCredentials: true }).then(res => res.data)
    )
}

export const logout = async () =>
{
    return await requestWithTokenRefresh(() =>
        axios.post(api.AUTH.LOGOUT, {}, { withCredentials: true }).then(res => res.data)
    )
}

export const deleteUser = async () =>
{
    return await requestWithTokenRefresh(() =>
        axios.delete(api.ACCOUNT.DELETE, { withCredentials: true }).then(res => res.data)
    )
}

export const getUserData = async () =>
{
    return await requestWithTokenRefresh(() =>
        axios.get(api.ACCOUNT.DATA, { withCredentials: true }).then(res => res.data)
    )
}

export const getProfile = async (username) =>
{
    return await requestWithTokenRefresh(() =>
        axios.get(`${api.ACCOUNT.PROFILE}${username}/`, { withCredentials: true }).then(res => res.data)
    )
}

export const sendFriendAction = async (id, action) =>
{
    return await requestWithTokenRefresh(() =>
        axios.post(`${api.FRIENDS.ACTION}${id}/${action}/`, {}, { withCredentials: true }).then(res => res.data)
    )
}

export const getFriends = async () =>
{
    return await requestWithTokenRefresh(() =>
        axios.get(api.FRIENDS.LIST, { withCredentials: true }).then(res => res.data)
    )
}

export const searchUsers = async (query) =>
{
    return await requestWithTokenRefresh(() =>
        axios.get(`${api.FRIENDS.SEARCH}?query=${query}`, { withCredentials: true }).then(res => res.data)
    )
}

export const getFriendRequests = async () =>
{
    return await requestWithTokenRefresh(() =>
        axios.get(api.FRIENDS.REQUESTS, { withCredentials: true }).then(res => res.data)
    )
}

export const uploadProfilePhoto = async (data) =>
{
    return await requestWithTokenRefresh(() =>
        axios.put(api.ACCOUNT.UPLOAD_PHOTO, data, { withCredentials: true }).then(res => res.data)
    )
}

export const editProfile = async (username) =>
{
    return await requestWithTokenRefresh(() =>
        axios.put(api.ACCOUNT.EDIT, { username }, { withCredentials: true }).then(res => res.data)
    )
}

export const sendEmail2fa = async () =>
{
    return await requestWithTokenRefresh(() =>
        axios.post(api.DFA.SEND_EMAIL, {}, { withCredentials: true }).then(res => res.data)
    )
}

export const activate2fa = async (code) =>
{
    return await requestWithTokenRefresh(() =>
        axios.post(api.DFA.ACTIVATE, { code }, { withCredentials: true }).then(res => res.data)
    )
}
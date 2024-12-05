import { defineStore } from 'pinia'
import { isAuthenticated, login, logout, register } from '../endpoints/api'
import { useRouter } from 'vue-router'
import { getDataOnLogin } from '../utils/utils'

export const useAuthStore = defineStore('auth',
    {
        state: () =>
        ({
            is_authenticated: false
        }),
        actions:
        {
            async verifyAuth()
            {
                const response = await isAuthenticated()
                if (response)
                    this.is_authenticated = response.success
            },
            async login_user(username, password, router)
            {
                const response = await login(username, password)
                if (response.success)
                {
                    this.is_authenticated = true
                    await getDataOnLogin()
                }
                return response
            },
            async register_user(username, email, password)
            {
                const response = await register(username, email, password)
                if (response.success)
                {
                    const response2 = await this.login_user(username, password)
                    return response2
                }
                return response
            },
            async logout()
            {
                this.is_authenticated = false
                await logout()
            }
        }
    }
)
import { defineStore } from 'pinia'
import { isAuthenticated } from '../endpoints/api'

export const useAuthStore = defineStore('auth',
    {
        state: () =>
        ({
            is_authenticated: false as boolean,
        }),
        actions:
        {
            async verifyAuth()
            {
                const response = await isAuthenticated()
                if (response)
                    this.is_authenticated = response.success
            },
            logout()
            {
                this.is_authenticated = false
            }
        }
    }
)
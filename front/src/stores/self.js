import { defineStore } from 'pinia'
import { getUserData } from '../endpoints/api'
import { useAuthStore } from './auth'

export const useSelfStore = defineStore('self',
    {
        state: () =>
        ({
            user_data: undefined
        }),
        actions:
        {
            async get_user_data()
            {
                const authStore = useAuthStore()
                
                if (!authStore.is_authenticated)
                    return
                const response = await getUserData()
                if (response.success)
                    this.user_data = response.data
            },
            clear()
            {
                this.user_data = undefined
            }
        }
    }
)
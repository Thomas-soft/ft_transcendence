import { defineStore } from 'pinia'
import { getUserData } from '../endpoints/api'
import { useAuthStore } from './auth'
import { UserData } from '../types/UserData'

// Définir le type de l'état
interface SelfState
{
    user_data: UserData | null
}

export const useSelfStore = defineStore('self',
    {
        state: () =>
        ({
            user_data: null as UserData | null
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
                this.user_data = null
                console.log('cleared self store')
                console.log(this.user_data)
            }
        }
    }
)
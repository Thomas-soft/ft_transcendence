import { defineStore } from 'pinia'
import { getUserData, uploadProfilePhoto } from '../endpoints/api'
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
            async edit_photo(data)
            {
                const response = await uploadProfilePhoto(data)
                if (!response?.success)
                    return response
                this.user_data.photo = response.data.photo
                return response
            },
            clear()
            {
                this.user_data = undefined
            }
        }
    }
)
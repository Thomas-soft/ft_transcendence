import { defineStore } from 'pinia'
import { activate2fa, editProfile, getUserData, sendEmail2fa, uploadProfilePhoto } from '../endpoints/api'
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
            async edit_profile(username)
            {
                const response = await editProfile(username)
                if (!response?.success)
                    return response
                this.user_data.username = username
                return response
            },
            async send_email_2fa()
            {
                const response = await sendEmail2fa()
                return response
            },
            async activate_2fa()
            {
                const response = await activate2fa()
                if (response?.success)
                    this.user_data.two_factor_auth = true
                return response
            },
            clear()
            {
                this.user_data = undefined
            }
        }
    }
)
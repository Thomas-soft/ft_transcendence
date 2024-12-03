import { useAuthStore } from "../store/auth"
import { useSelfStore } from "../store/self"

export const getDataOnLogin = async () =>
{
    const authStore = useAuthStore()
    const selfStore = useSelfStore()

    await authStore.verifyAuth()
    if (!selfStore.user_data)
        await selfStore.get_user_data()
}

export const removeDataOnLogout = async () =>
{
    const authStore = useAuthStore()
    const selfStore = useSelfStore()

    await authStore.logout()
    selfStore.clear()
}
import { useAuthStore } from "../stores/auth"
import { useSelfStore } from "../stores/self"
import { useAccountsStore } from "../stores/accounts"

export const getDataOnLogin = async () =>
{
    const authStore = useAuthStore()
    const selfStore = useSelfStore()

    await authStore.verifyAuth()
    if (!selfStore.user_data)
        await selfStore.get_user_data()
}

export const removeDataOnLogout = async (disconnect = true) =>
{
    const authStore = useAuthStore()
    const selfStore = useSelfStore()
    const accountsStore = useAccountsStore()

    selfStore.clear()
    accountsStore.clear()
    if (disconnect)
        await authStore.logout()
}
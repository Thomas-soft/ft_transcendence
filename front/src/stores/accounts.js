import { defineStore } from 'pinia'
import { getFriendRequests, getFriends, getProfile, sendFriendAction } from '../endpoints/api'

export const useAccountsStore = defineStore('accounts',
    {
        state: () =>
        ({
            accounts: []
        }),
        actions:
        {
            async get_profile(username)
            {
                if (this.accounts.find(account => account.username === username))
                    return
                const response = await getProfile(username)
                if (response?.success)
                    this.accounts.push({
                        ...response.data,
                        photo: response.data.photo ? `https://localhost/api/accounts${response.data.photo}` : null
                    })
            },
            async send_friend_action(id, action)
            {
                const response = await sendFriendAction(id, action)
                console.log(response.success)
                if (!response?.success)
                    return
                    const userIndex = this.accounts.findIndex(account => account.id === id)
                if (userIndex === -1)
                    return
                const user = this.accounts[userIndex]
                switch (action)
                {
                    case 'add':
                        user.is_friend = false
                        user.is_pending = true
                        user.pending_by = false
                        user.is_blocked = false
                        break
                    case 'cancel':
                        user.is_pending = false
                        break
                    case 'accept':
                        user.is_friend = true
                        user.is_pending = false
                        user.pending_by = false
                        break
                    case 'reject':
                        user.is_pending = false
                        user.pending_by = false
                        break
                    case 'delete':
                        user.is_friend = false
                        break
                    case 'block':
                        user.is_blocked = true
                        user.is_friend = false
                        user.is_pending = false
                        user.pending_by = false
                        break
                    case 'unblock':
                        user.is_blocked = false
                        break
                }
                this.accounts[userIndex] = { ...user }
            },
            async get_friends()
            {
                const response = await getFriends()
                if (response?.success)
                {
                    const newAccounts = response.data.filter(account =>
                        !this.accounts.some(existingAccount => existingAccount.id === account.id)
                    ).map(account => ({
                        ...account,
                        photo: account.photo ? `https://localhost/api/accounts${account.photo}` : null
                    }))
                    this.accounts.push(...newAccounts)
                }
            },
            async get_requests()
            {
                const response = await getFriendRequests()
                if (response?.success)
                {
                    const newAccounts = response.data?.received.filter(account =>
                        !this.accounts.some(existingAccount => existingAccount.id === account.id)
                    ).map(account => ({
                        ...account,
                        photo: account.photo ? `https://localhost/api/accounts${account.photo}` : null
                    }))
                    this.accounts.push(...newAccounts)
                }
            },
            clear()
            {
                this.accounts = []
            },
        }
    }
)
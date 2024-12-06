<script setup>
import { computed, onMounted } from 'vue';
import { useAccountsStore } from '../stores/accounts'
import { useRouter } from 'vue-router';

const accountsStore = useAccountsStore()
const router = useRouter()

onMounted(async () =>
{
    await accountsStore.get_requests()
})

const requests = computed(() =>
{
    return accountsStore.accounts.filter(account => account.pending_by)
    .map(account =>
    {
        return {
            id: account.id,
            username: account.username,
            photo: account.photo,
            is_friend: account.is_friend,
            is_pending: account.is_pending,
            pending_by: account.pending_by,
            is_blocked: account.is_blocked,
            blocked_by: account.blocked_by,
        }
    })
})

const handleViewProfile = (user) =>
{
    router.push(`/profile/${user}`)
}

const handleSendFriendAction = async (id, action) =>
{
    await accountsStore.send_friend_action(id, action)
}

</script>

<template>
<div class="requests-friend">
    <table>
        <thead>
            <tr>
                <th>Profile photo</th>
                <th>Username</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <tr v-for="account in requests" :key="account.id" @click="handleViewProfile(user.username)">
                <td class="img-container">
                    <div class="img-contain">
                        <img :src="account.photo" alt="">
                    </div>
                </td>
                <td>{{ account.username }}</td>
                <td>
                    <button @click="handleSendFriendAction(account.id, 'accept')">Accept</button>
                    <button @click="handleSendFriendAction(account.id, 'reject')">Reject</button>
                    <button @click="handleSendFriendAction(account.id, 'block')">Block</button>
                </td>
            </tr>
        </tbody>
    </table>
</div>
</template>

<style scoped lang="scss">
@use "../style.scss" as *;

.requests-friend
{
    width: 100%;
    text-align: center;
    thead, tbody, table
    {
        margin: 10px 0;
        width: 100%;
        tr
        {
            .img-container
            {
                justify-items: center;
                .img-contain
                {
                    width: 50px;
                    height: 50px;
                    border-radius: 50px;
                    img
                    {
                        width: 100%;
                        height: 100%;
                        border-radius: 50%;
                        object-fit: cover;
                        object-position: center;
                    }
                }
            }
            th, td
            {
                padding: 5px 10px;
                border: 2px solid $black;
                border-radius: 5px;
                button
                {
                    @include btn2(inline-block);
                    margin: 5px;
                }
            }
        }
    }
}
@media screen and (max-width: 700px)
{
    .requests-friend
    {
        thead, tbody, table
        {
            tr
            {
                th, td
                {
                    padding: 2px;
                    button
                    {
                        margin: 2px;
                        padding: 10px;
                    }
                }
            }
        }
    }
}
</style>
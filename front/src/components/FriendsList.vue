<script setup>
import { computed, onMounted } from 'vue';
import { useAccountsStore } from '../stores/accounts'
import { useRouter } from 'vue-router';

const accountsStore = useAccountsStore()
const router = useRouter()

onMounted(async () =>
{
    await accountsStore.get_friends()
})

const friends = computed(() =>
{
    return accountsStore.accounts.filter(account => account.is_friend)
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
<div class="friends-list">
    <table>
        <thead>
            <tr>
                <th>Profile photo</th>
                <th>Username</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <tr v-for="friend in friends" :key="friend.id" @click="handleViewProfile(user.username)">
                <td class="img-container">
                    <div class="img-contain">
                        <img :src="friend.photo" alt="">
                    </div>
                </td>
                <td>{{ friend.username }}</td>
                <td>
                    <button @click="handleSendFriendAction(friend.id, 'delete')">Remove</button>
                    <button @click="handleSendFriendAction(friend.id, 'block')">Block</button>
                </td>
            </tr>
        </tbody>
    </table>
</div>
</template>

<style scoped lang="scss">
@use "../style.scss" as *;

.friends-list
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
            }
        }
    }
}
@media screen and (max-width: 700px)
{
    .friends-list
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
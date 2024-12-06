<script setup>
import { ref } from 'vue'
import { searchUsers } from '../endpoints/api';
import { useAccountsStore } from '../stores/accounts';
import { useRouter } from 'vue-router';

const query = ref('')
const users = ref()
const accountsStore = useAccountsStore()
const router = useRouter()
const handleInput = async () =>
{
    if (query.value.length < 3)
        return
    const response = await searchUsers(query.value)
    if (!response?.data)
        return
    users.value = response.data.map(user => ({
        ...user,
        photo: user.photo ? `https://localhost/api/accounts${user.photo}` : null
    }))

}

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
<div class="search-user">
    <form>
        <input type="text" placeholder="Search user" v-model="query" @input="handleInput">
    </form>
    <table>
        <thead>
            <tr>
                <th>Profile photo</th>
                <th>Username</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <tr v-for="user in users" :key="user.id" @click="handleViewProfile(user.username)">
                <td class="img-container">
                    <div class="img-contain">
                        <img :src="user.photo" alt="">
                    </div>
                </td>
                <td>{{ user.username }}</td>
                <td v-if="user.is_pending">
                    <button @click="handleSendFriendAction(user.id, 'cancel')">Cancel</button>
                    <button @click="handleSendFriendAction(user.id, 'block')">Block</button>
                </td>
                <td v-else-if="user.pending_by">
                    <button @click="handleSendFriendAction(user.id, 'accpet')">Accept</button>
                    <button @click="handleSendFriendAction(user.id, 'reject')">Reject</button>
                    <button @click="handleSendFriendAction(user.id, 'block')">Block</button>
                </td>
                <td v-else>
                    <button @click="handleSendFriendAction(user.id, 'add')">Add</button>
                    <button @click="handleSendFriendAction(user.id, 'block')">Block</button>
                </td>
            </tr>
        </tbody>
    </table>
</div>
</template>

<style scoped lang="scss">
@use "../style.scss" as *;

.search-user
{
    width: 100%;
    text-align: center;
    form
    {
        margin: 10px 0;
        input
        {
            background-color: $black;
        }
    }
    thead, tbody, table
    {
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
    tbody tr
    {
        cursor: pointer;
    }
}
@media screen and (max-width: 700px)
{
    .search-user
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
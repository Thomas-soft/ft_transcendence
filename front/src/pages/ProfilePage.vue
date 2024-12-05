<script setup>
import { onMounted, computed } from 'vue'
import { useRoute, useRouter } from 'vue-router'
import { deleteUser, logout } from '../endpoints/api'
import { removeDataOnLogout } from '../utils/utils'
import { useSelfStore } from '../stores/self'
import { useAccountsStore } from '../stores/accounts'
import { useAuthStore } from '../stores/auth'

const route = useRoute()
const router = useRouter()
const param = route.params.username
const selfStore = useSelfStore()
const accountsStore = useAccountsStore()
const authStore = useAuthStore()

// URL de la photo pour l'utilisateur connecté
const myPhotoUrl = computed(() =>
{
    return selfStore.user_data?.photo
        ? `https://localhost/api/accounts${selfStore.user_data.photo}`
        : null
})

// Trouver l'utilisateur correspondant au paramètre `username`
const user = computed(() =>
{
    return accountsStore.accounts.find(account => account.username === param)
})

// Charger les données de profil à la montée
onMounted(async () =>
{
    await accountsStore.get_profile(param)
})

// Gérer la déconnexion
const handleLogout = async () =>
{
    await removeDataOnLogout()
    await logout()
    router.push("/")
}

// Gérer la suppression de compte
const handleDelete = async () =>
{
    await removeDataOnLogout(false)
    authStore.is_authenticated = false
    await deleteUser()
    router.push("/")
}

const handleSendFriendAction = async (id, action) =>
{
    await accountsStore.send_friend_action(id, action)
}
</script>

<template>
<section class="profile">
    <div class="left">
        <div class="img">
            <img v-if="selfStore.user_data?.username == param && myPhotoUrl" :src="myPhotoUrl" alt="Profile photo" loading="lazy">
            <img v-else-if="user?.photo" :src="user?.photo" alt="User photo" loading="lazy">
        </div>
        <div v-if="selfStore.user_data?.username == param" class="infos">
            <h3>Profile</h3>
            <p>{{ selfStore.user_data?.username }}</p>
            <p>{{ selfStore.user_data?.email }}</p>
            <div class="buttons">
                <button @click="handleLogout">Logout</button>
                <button @click="handleDelete">Delete</button>
            </div>
        </div>
        <div v-else-if="user" class="infos">
            <h3>Profile</h3>
            <p>{{ user?.username }}</p>
            <p>{{ user?.email }}</p>
            <div v-if="user?.is_blocked" class="buttons">
                <p>This user is blocked. Actions are not available.</p>
                <button @click="handleSendFriendAction(user?.id, 'unblock')">Unblock</button>
            </div>
            <div v-else-if="user?.is_friend" class="buttons">
                <button @click="handleSendFriendAction(user?.id, 'delete')">Unfriend</button>
                <button @click="handleSendFriendAction(user?.id, 'block')">Block</button>
            </div>
            <div v-else-if="user?.is_pending" class="buttons">
                <button @click="handleSendFriendAction(user?.id, 'cancel')">Cancel</button>
                <button @click="handleSendFriendAction(user?.id, 'block')">Block</button>
            </div>
            <div v-else-if="user?.pending_by" class="buttons">
                <button @click="handleSendFriendAction(user?.id, 'accept')">Accept</button>
                <button @click="handleSendFriendAction(user?.id, 'reject')">Reject</button>
                <button @click="handleSendFriendAction(user?.id, 'block')">Block</button>
            </div>
            <div v-else class="buttons">
                <button @click="handleSendFriendAction(user?.id, 'add')">Add friend</button>
                <button @click="handleSendFriendAction(user?.id, 'block')">Block</button>
            </div>
        </div>
    </div>
    <div class="mid"></div>
    <div class="right">
        <div class="infos">
            <p>Total games : 9999</p>
            <p>Win's streak : 9999</p>
            <p>Rank : 9999</p>
            <p>League : 9999</p>
        </div>
    </div>
</section>
</template>

<style scoped lang="scss">
@use '../style.scss' as *;

.profile
{
    @include flex;
    align-items: flex-start;
    background-color: $grey;
    padding: 40px;
    border-radius: 50px;
    .left
    {
        .img
        {
            width: 100px;
            height: 100px;
            border-radius: 50%;
            img
            {
                width: 100%;
                height: 100%;
                object-fit: cover;
                object-position: center;
                border-radius: 50%;
            }
        }
        .infos
        {
            margin: 10px 0;
        }
        .buttons
        {
            margin-top: 10px;
            button
            {
                margin-left: 10px;
            }
        }
    }
    .mid
    {
        margin: 20px;
    }
    .right
    {
        p
        {
            line-height: 1.8em;
        }
    }
}

@media screen and (max-width: 700px)
{
    .profile
    {
        flex-direction: column;
    }
}
</style>
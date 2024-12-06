<script setup>
import { onMounted, computed, ref } from 'vue'
import { useRoute, useRouter } from 'vue-router'
import { deleteUser, logout } from '../endpoints/api'
import { removeDataOnLogout } from '../utils/utils'
import { useSelfStore } from '../stores/self'
import { useAccountsStore } from '../stores/accounts'
import { useAuthStore } from '../stores/auth'
import { config } from '../config/config.json'

const route = useRoute()
const router = useRouter()
const param = route.params.username
const selfStore = useSelfStore()
const accountsStore = useAccountsStore()
const authStore = useAuthStore()
const edit = ref(false)
const username = ref("")
const email = ref("")
let file = null
const isGood = ref(false)

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

const handleEdit = (e) =>
{
    e.preventDefault()
    edit.value = !edit.value
    console.log(username.value, email.value)
}

const handleChange = (e, id, element, pattern) =>
{
    const error = document.getElementById(id)
    const target = e.target

    element.value = target.value
    if (!error)
        return
    if (!target.value.match(pattern) && target.value.length > 0)
    {
        error.style.opacity = '1'
        isGood.value = false
    }
    else
    {
        error.style.opacity = '0'
        isGood.value = true
    }
}

const handleUsername = (e) =>
{
    handleChange(e, 'username-error', username, config.regex.username.pattern)
}

const handleEmail = (e) =>
{
    handleChange(e, 'email-error', email, config.regex.email.pattern)
}

const handleFileChange = async (event) =>
{
    file = event.target.files[0]
    if (!file) return;
    const formData = new FormData();

    formData.append("profile_photo", file)
    const response = await selfStore.edit_photo(formData)
    if (response.success === false)
        console.error('Error uploading image:', response.error)
    // else
    //     await selfStore.get_user_data(param); // Recharge les données du profil
}

const handleImageUpload = async () =>
{
    // console.log(file)
    // if (!file) return;
    // console.log('Uploading image...')
    // console.log(file)
    // const formData = new FormData();

    // formData.append("profile_photo", file)
    // const response = await accountsStore.edit_photo(formData)
    // if (response.success === false)
    //     console.error('Error uploading image:', response.error)
}

</script>

<template>
<section class="profile">
    <div class="left">
        <div class="img">
            <img v-if="selfStore.user_data?.username == param && myPhotoUrl" :src="myPhotoUrl" alt="Profile photo" loading="lazy">
            <img v-else-if="user?.photo" :src="user?.photo" alt="User photo" loading="lazy">
            <form className='pp-form' @submit="handleImageUpload">
                <input type="file" @change="handleFileChange" />
                <button type="submit">Upload</button>
            </form>
        </div>
        <div v-if="selfStore.user_data?.username == param" class="infos">
            <h3>Profile</h3>
            <div v-if="!edit">
                <p>{{ selfStore.user_data?.username }}</p>
                <p>{{ selfStore.user_data?.email }}</p>
                <div class="buttons">
                    <button @click="edit = !edit">Edit</button>
                    <button @click="handleLogout">Logout</button>
                    <button @click="handleDelete">Delete</button>
                </div>
            </div>
            <div v-else>
                <form @submit="handleEdit">
                    <label for="username">Username</label>
                    <input type="text" name="username" id="username" @change="handleUsername" autocomplete="username">
                    <p class="form-error" id="username-error">{{ config.regex.username.description }}</p>
                    <label for="email">Email</label>
                    <input type="email" name="email" id="email" @change="handleEmail" autocomplete="email">
                    <p class="form-error" id="email-error">{{ config.regex.email.description }}</p>
                    <div class="buttons">
                        <button type="button" @click="edit = !edit">Cancel</button>
                        <button type="submit">Save</button>
                    </div>
                </form>
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
        .pp-form
        {
            z-index: 42;
            opacity: 0;
            position: absolute;
            top: 0;
            left: 0;
            cursor: pointer;
            input
            {
                width: 100px;
                height: 100px;
                border-radius: 50%;
                background-color: transparent;
                cursor: pointer;
            }
        }
        .img
        {
            position: relative;
            width: 100px;
            height: 100px;
            border-radius: 50%;
            background-color: $black;
            img
            {
                width: 100px;
                height: 100px;
                width: 100%;
                object-fit: cover;
                object-position: center;
                overflow: hidden;
                border-radius: 50%;
                transition: 0.2s ease-out;
            }
            &:hover
            {
                cursor: pointer;
                img
                {
                    filter: opacity(0.42);
                }
                &::after
                {
                    scale: (1);
                    opacity: 1;
                }
            }
        }
        .img::after
        {
            z-index: 1;
            position: absolute;
            text-align: center;
            content: "Change profile picture";
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            color: $white;
            font-size: 1rem;
            opacity: 0;
            scale: (0.95);
            transition: 0.2s ease-out;
        }
        // .img
        // {
        //     width: 100px;
        //     height: 100px;
        //     border-radius: 50%;
        //     img
        //     {
        //         width: 100%;
        //         height: 100%;
        //         object-fit: cover;
        //         object-position: center;
        //         border-radius: 50%;
        //     }
        // }
        .infos
        {
            margin: 10px 0;
            .buttons
            {
                margin-top: 10px;
                button
                {
                    margin-left: 10px;
                }
            }
            input
            {
                background-color: $black;
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
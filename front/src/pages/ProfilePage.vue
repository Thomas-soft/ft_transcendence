<script setup lang="ts">
import { onMounted } from 'vue';
import { useRoute, useRouter } from 'vue-router';
import { deleteUser, logout } from '../endpoints/api';
import { removeDataOnLogout } from '../utils/utils';

const route = useRoute()
const router = useRouter()

onMounted(() =>
{
    console.log('ProfilePage mounted')
    console.log(route.params)
})

const handleLogout = async () =>
{
    await removeDataOnLogout()
    await logout()
    router.push("/")
}
const handleDelete = async () =>
{
    await removeDataOnLogout()
    await deleteUser()
    router.push("/")
}
</script>

<template>
    <section class="profile">
        <div class="left">
            <div class="img">
                <img src="" alt="">
            </div>
            <div class="infos">
                <h3>Profile</h3>
                <p>Username</p>
                <p>Email</p>
            </div>
            <div class="buttons">
                <button @click="handleLogout">Logout</button>
                <button @click="handleDelete">Delete</button>
            </div>
        </div>
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

</style>
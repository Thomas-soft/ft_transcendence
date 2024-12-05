<script setup>
import { ref } from 'vue';
import { login } from '../endpoints/api';
import { useRouter } from 'vue-router';
import { getDataOnLogin } from '../utils/utils';

const showPassword = ref(false)
const router = useRouter()

const togglePassword = () =>
{
    showPassword.value = !showPassword.value
    const password = document.getElementById('password')
    if (password)
        password.type = showPassword.value ? 'text' : 'password'
}

const handleLogin = async (e) =>
{
    e.preventDefault()
    const form = e.target
    const data = new FormData(form)
    const username = data.get("username")
    const password = data.get("password")
    const error = document.getElementById('login-error')

    const response = await login(username, password)
    if (response.success)
    {
        await getDataOnLogin()
        router.push("/")
    }
    else
    {
        if (!error)
            return
        error.style.opacity = '1'
    }
}
</script>

<template>
<form @submit="handleLogin">
    <div class="form-info">
        <label for="username">Username</label>
        <input type="text" id="username" name="username" autocomplete="username" required />
    </div>
    <div class="form-info">
        <label for="password">Password</label>
        <div class="field">
            <input type="password" id="password" name="password" autocomplete="new-password" required />
            <button class="fa-solid fa-eye" type="button" @click="togglePassword"></button>
        </div>
        <p class="form-error" id="login-error">Wrong username or password.</p>
    </div>
    <button type="submit">Submit</button>
</form>
</template>

<style scoped lang="scss">
@use "../style.scss" as *;

.fa-solid.fa-eye
{
    color: $white;
}
form
{
    width: 100%;
    max-width: 500px;
    .form-info
    {
        .field
        {
            position: relative;
            .fa-solid.fa-eye
            {
                @include flex();
                @include btn4();
                color: $white;
                height: 100%;
                position: absolute;
                right: 0;
                top: 0;
                margin: 0;
                padding: 5px 10px;
            }
        }
    }
}
</style>
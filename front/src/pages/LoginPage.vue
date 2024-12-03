<script setup lang="ts">
import { ref } from 'vue';
import { login } from '../endpoints/api';
import { useRouter } from 'vue-router';
import { ApiResponse } from '../types/api';
import { getDataOnLogin } from '../utils/utils';

const showPassword = ref<boolean>(false)
const router = useRouter()

const togglePassword = () => {
    showPassword.value = !showPassword.value
    const password: HTMLElement | null = document.getElementById('password')
    if (password instanceof HTMLInputElement)
        password.type = showPassword.value ? 'text' : 'password'
}

const handleLogin = async (event: Event) =>
{
    event.preventDefault()
    const form = event.target as HTMLFormElement
    const data = new FormData(form)
    const username: string = data.get("username") as string
    const password: string = data.get("password") as string
    const error: HTMLElement | null = document.getElementById('login-error')

    const response: ApiResponse = await login(username, password)
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
            <label for="username">Username / Email</label>
            <input type="text" id="username" name="username" required />
        </div>
        <div class="form-info">
            <label for="password">Password</label>
            <div class="field">
                <input type="password" id="password" name="password" required />
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
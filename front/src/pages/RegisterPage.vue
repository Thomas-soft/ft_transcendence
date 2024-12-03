<script setup lang="ts">
import { Ref, ref } from 'vue'
import { config } from "../config/config.json"
import { register } from '../endpoints/api'
import { ApiResponse } from '../types/api'

const showPassword = ref(false)
const showConfirmPassword = ref(false)
const username = ref<string>('')
const email = ref<string>('')
const password = ref<string>('')
const confirmPassword = ref<string>('')
const isGood = ref<boolean>(false)
const registerError = ref<string | undefined>('')

const togglePassword = () => {
    showPassword.value = !showPassword.value
    const password: HTMLElement | null = document.getElementById('password')
    if (password instanceof HTMLInputElement)
        password.type = showPassword.value ? 'text' : 'password'
}

const toggleConfirmPassword = () => {
    showConfirmPassword.value = !showConfirmPassword.value
    const confirmPassword: HTMLElement | null = document.getElementById('confirmPassword')
    if (confirmPassword instanceof HTMLInputElement)
        confirmPassword.type = showConfirmPassword.value ? 'text' : 'password'
}

const handleChange = (event: Event, id: string, element: Ref<string>, pattern: string) =>
{
    const error: HTMLElement | null = document.getElementById(id)
    const target = event.target as HTMLInputElement
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

const handleUsername = (event: Event) =>
{
    handleChange(event, 'username-error', username, config.regex.username.pattern)

}

const handleEmail = (event: Event) =>
{
    handleChange(event, 'email-error', email, config.regex.email.pattern)
}

const handlePassword = (event: Event) =>
{
    handleChange(event, 'password-error', password, config.regex.password.pattern)
}

const handleConfirmPassword = (event: Event) =>
{
    const error: HTMLElement | null = document.getElementById('confirm-password-error')
    const target = event.target as HTMLInputElement
    confirmPassword.value = target.value
    if (!error)
        return
    if (target.value !== password.value && target.value.length > 0)
        error.style.opacity = '1'
    else
        error.style.opacity = '0'
}

const handle_register = async (e: Event) =>
{
    e.preventDefault()
    // if (!isGood.value)
        // return
    let response: ApiResponse
    const error: HTMLElement | null = document.getElementById('register-error')

    if (email.value.length === 0)
        response = await register(username.value, null, password.value)
    else
        response = await register(username.value, email.value, password.value)
    if (!error)
        return
    if (response.success === false)
    {
        registerError.value = response.error
        error.style.opacity = '1'
    }
    else
    {
        registerError.value = undefined
        error.style.opacity = '0'
    }
}

</script>

<template>
    <form v-on:submit="handle_register">
        <div class="form-info">
            <label for="username">Username</label>
            <input type="text" id="username" name="username" required @change="handleUsername" />
            <p class="form-error" id="username-error">{{ config.regex.username.description }}</p>
        </div>
        <div class="form-info">
            <label for="email">Email (optional)</label>
            <input type="email" id="email" name="email" @change="handleEmail" />
            <p class="form-error" id="email-error">{{ config.regex.email.description }}</p>
        </div>
        <div class="form-info">
            <label for="password">Password</label>
            <div class="field">
                <input type="password" id="password" name="password" required @change="handlePassword"/>
                <button class="fa-solid fa-eye" type="button" @click="togglePassword"></button>
            </div>
            <p class="form-error" id="password-error">{{ config.regex.password.description }}</p>
        </div>
        <div class="form-info">
            <label for="confirmPassword">Confirm password</label>
            <div class="field">
                <input type="password" id="confirmPassword" name="confirmPassword" required @change="handleConfirmPassword" />
                <button class="fa-solid fa-eye" type="button" @click="toggleConfirmPassword"></button>
            </div>
            <p class="form-error" id="confirm-password-error">Passwords do not match.</p>
        </div>
        <p class="form-error" id="register-error">{{ registerError }}</p>
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
<script setup>
import { ref } from 'vue'
import { config } from "../config/config.json"
import { register } from '../endpoints/api'
import { useAuthStore } from '../stores/auth';
import { useRouter } from 'vue-router';

const showPassword = ref(false)
const showConfirmPassword = ref(false)
const username = ref('')
const email = ref('')
const password = ref('')
const confirmPassword = ref('')
const isGood = ref(false)
const registerError = ref('')
const authStore = useAuthStore()
const router = useRouter()

const togglePassword = () =>
{
    showPassword.value = !showPassword.value
    const password = document.getElementById('password')
    if (password)
        password.type = showPassword.value ? 'text' : 'password'
}

const toggleConfirmPassword = () =>
{
    showConfirmPassword.value = !showConfirmPassword.value
    const confirmPassword = document.getElementById('confirmPassword')
    if (confirmPassword)
        confirmPassword.type = showConfirmPassword.value ? 'text' : 'password'
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

const handlePassword = (e) =>
{
    handleChange(e, 'password-error', password, config.regex.password.pattern)
}

const handleConfirmPassword = (e) =>
{
    const error = document.getElementById('confirm-password-error')
    const target = e.target
    confirmPassword.value = target.value
    if (!error)
        return
    if (target.value !== password.value && target.value.length > 0)
        error.style.opacity = '1'
    else
        error.style.opacity = '0'
}

const handle_register = async (e) =>
{
    e.preventDefault()
    // if (!isGood.value)
        // return
    let response
    const error = document.getElementById('register-error')

    if (email.value.length === 0)
        response = await authStore.register_user(username.value, undefined, password.value)
    else
        response = await authStore.register_user(username.value, email.value, password.value)
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
        router.push("/")
    }
}

</script>

<template>
<form @submit="handle_register">
    <div class="form-info">
        <label for="username">Username</label>
        <input type="text" id="username" name="username" autocomplete="username" required @change="handleUsername" />
        <p class="form-error" id="username-error">{{ config.regex.username.description }}</p>
    </div>
    <!-- <div class="form-info">
        <label for="email">Email (optional)</label>
        <input type="email" id="email" name="email" @change="handleEmail" />
        <p class="form-error" id="email-error">{{ config.regex.email.description }}</p>
    </div> -->
    <div class="form-info">
        <label for="password">Password</label>
        <div class="field">
            <input type="password" id="password" name="password" autocomplete="new-password" required @change="handlePassword"/>
            <button class="fa-solid fa-eye" type="button" @click="togglePassword" tabindex="-1"></button>
        </div>
        <p class="form-error" id="password-error">{{ config.regex.password.description }}</p>
    </div>
    <div class="form-info">
        <label for="confirmPassword">Confirm password</label>
        <div class="field">
            <input type="password" id="confirmPassword" name="confirmPassword" autocomplete="new-password" required @change="handleConfirmPassword" />
            <button class="fa-solid fa-eye" type="button" @click="toggleConfirmPassword" tabindex="-1"></button>
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
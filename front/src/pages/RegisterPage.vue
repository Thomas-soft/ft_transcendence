<script setup lang="ts">
import { ref } from 'vue';

const showPassword = ref(false);
const showConfirmPassword = ref(false);

const togglePassword = () => {
    showPassword.value = !showPassword.value
    const password = document.getElementById('password')
    if (password)
        password.type = showPassword.value ? 'text' : 'password'
}

const toggleConfirmPassword = () => {
    showConfirmPassword.value = !showConfirmPassword.value
    const confirmPassword = document.getElementById('confirmPassword')
    if (confirmPassword)
    confirmPassword.type = showConfirmPassword.value ? 'text' : 'password'
}
</script>

<template>
    <form>
        <div class="form-info">
            <label for="username">Username</label>
            <input type="text" id="username" name="username" required />
            <p class="form-error">error</p>
        </div>
        <div class="form-info">
            <label for="email">Email (optional)</label>
            <input type="email" id="email" name="email" />
            <p class="form-error">error</p>
        </div>
        <div class="form-info">
            <label for="password">Password</label>
            <div class="field">
                <input type="password" id="password" name="password" required autocomplete="current-password"/>
                <button class="fa-solid fa-eye" type="button" @click="togglePassword"></button>
            </div>
            <p class="form-error">error</p>
        </div>
        <div class="form-info">
            <label for="confirmPassword">Confirm password</label>
            <div class="field">
                <input type="password" id="confirmPassword" name="confirmPassword" required />
                <button class="fa-solid fa-eye" type="button" @click="toggleConfirmPassword"></button>
            </div>
            <p class="form-error" >Passwords do not match.</p>
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
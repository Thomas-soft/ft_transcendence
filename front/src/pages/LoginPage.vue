<script setup lang="ts">
import { ref } from 'vue';

const showPassword = ref(false);

const togglePassword = () => {
    showPassword.value = !showPassword.value;
    const password = document.getElementById('password');
    if (password)
        password.type = showPassword.value ? 'text' : 'password';
};
</script>

<template>
    <form>
        <div class="form-info">
            <label for="username">Username / Email</label>
            <input type="text" id="username" name="username" required />
            <p class="form-error">error</p>
        </div>
        <div class="form-info">
            <label for="password">Password</label>
            <div class="field">
                <input type="password" id="password" name="password" required />
                <button class="fa-solid fa-eye" type="button" @click="togglePassword"></button>
            </div>
            <p class="form-error">error</p>
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
<script setup lang="ts">

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
            <input type="password" id="password" name="password" required />
            <p class="form-error">error</p>
        </div>
        <div class="form-info">
            <label for="confirmPassword">Confirm password</label>
            <input type="password" id="confirmPassword" name="confirmPassword" required />
            <p class="form-error" >Passwords do not match.</p>
        </div>
        <button type="submit">Submit</button>
    </form>
</template>

<style scoped lang="scss">

</style>
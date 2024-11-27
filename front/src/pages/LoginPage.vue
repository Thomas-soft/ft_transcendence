<script setup lang="ts">

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
            <input type="password" id="password" name="password" required />
            <p class="form-error">error</p>
        </div>
        <button type="submit">Submit</button>
    </form>
</template>

<style scoped lang="scss">

</style>
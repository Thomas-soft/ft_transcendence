<script setup>
import { ref } from 'vue'
import { useSelfStore } from '../stores/self';

const selfStore = useSelfStore()
const edit = ref(false)
const sent = ref(false)
const code = ref('')
const handle_send_email_2fa = async (e) =>
{
    e.preventDefault()
    edit.value = false
    const response = await selfStore.send_email_2fa()
    if (response?.success)
        sent.value = true
}
const handle_activate_2fa = async (e) =>
{
    e.preventDefault()
    sent.value = false
    const response = await selfStore.activate_2fa(code.value)
    if (response?.success)
        edit.value = false
}

</script>

<template>
    <div class="settings">
        <h3>Settings</h3>
        <div class="box">
            <button @click="edit = true" v-if="!edit && !sent">Activate 2fa</button>
        </div>
        <div class="box" v-if="edit">
            <form @submit="handle_send_email_2fa">
                <label for="email">Email</label>
                <input type="email" name="email" id="email">
                <button type="button" @click="edit = false">Cancel</button>
                <button type="submit">Send</button>
            </form>
        </div>
        <div class="box" v-if="sent">
            <p style="color: chartreuse;">Email sent!</p>
            <form @submit="handle_activate_2fa">
                <label for="code">Code</label>
                <input type="text" name="code" id="code" v-model="code" placeholder="Enter your code">
                <button type="button" @click="sent = false">Cancel</button>
                <button type="submit">Activate</button>
            </form>
        </div>
    </div>
</template>

<style>
@use "../style.scss" as *;

</style>
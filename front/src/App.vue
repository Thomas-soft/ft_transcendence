<script setup lang="ts">
import { onMounted } from 'vue';
import Navigation from './components/Navigation.vue'
import { RouterView } from 'vue-router'
import { useAuthStore } from './store/auth'
import { useSelfStore } from './store/self'
import Chat from './components/Chat.vue';

const authStore = useAuthStore()
const selfStore = useSelfStore()

onMounted(async () =>
{
  await authStore.verifyAuth()
  if (!selfStore.user_data)
    await selfStore.get_user_data()
})

</script>

<template>
  <Navigation />
  <!-- <Chat /> -->
  <div class="container">
    <div class="contain">
      <RouterView />
    </div>
  </div>
</template>

<style scoped lang="scss">

</style>

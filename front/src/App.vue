<script setup lang="ts">
import Navigation from './components/Navigation.vue'
import { RouterView } from 'vue-router'
</script>

<template>
  <Navigation />
  <div class="container">
    <div class="contain">
      <RouterView />
    </div>
  </div>
</template>

<style scoped lang="scss">

</style>

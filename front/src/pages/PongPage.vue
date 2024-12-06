<script setup>
import { onMounted, onUnmounted } from 'vue'
import GameState from '../pong/GameState'

const Game = new GameState()

onMounted(() =>
{
    Game.init()
})
onUnmounted(() =>
{
    Game.dispose()
})
</script>

<template>
    <div class="pong">

    </div>
</template>

<style scoped lang="scss">
@use '../style.scss' as *;

.pong
{
    @include flex();
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100vh;
}
</style>
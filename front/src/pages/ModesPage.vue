<script setup>
</script>

<template>
<nav>
    <ul>
        <li>
            <router-link to="/modes/pong">Play 1v1</router-link>
        </li>
    </ul>
</nav>
</template>

<style scoped lang="scss">
@use '../style.scss' as *;
nav
{
    ul
    {
        a
        {
            @include btn2(block);
        }
        li:not(:last-child)
        {
            a
            {
                margin-bottom: 10px;
            }
        }
    }
}
</style>

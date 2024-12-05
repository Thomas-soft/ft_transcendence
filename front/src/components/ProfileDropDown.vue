<script setup lang="ts">
import { ref, onMounted, onUnmounted, computed } from 'vue';
import { useSelfStore } from '../stores/self';
import { removeDataOnLogout } from '../utils/utils';

const isOpen = ref(false)
const selfStore = useSelfStore()
const photoUrl = computed(() =>
{
  return selfStore.user_data?.photo
    ? `https://localhost/api/accounts${selfStore.user_data.photo}`
    : null;
})
const username = computed(() =>
{
    return selfStore.user_data?.username
    ? `/profile/${selfStore.user_data?.username}`
    : null
})

// Fermer le menu lorsqu'on clique à l'extérieur
const closeOnClickOutside = (e) =>
{
    const dropdown = document.querySelector('.dropdown-menu')
    const button = document.querySelector('.profile-button')
    if (
        dropdown &&
        button &&
        !dropdown.contains(e.target) &&
        !button.contains(e.target)
    )
    {
        isOpen.value = false
    }
};

onMounted(() =>
{
  document.addEventListener('click', closeOnClickOutside)
})

onUnmounted(() =>
{
  document.removeEventListener('click', closeOnClickOutside)
})

const toggleMenu = () =>
{
  isOpen.value = !isOpen.value
}

const handleLogout = async () =>
{
    await removeDataOnLogout()
}
</script>

<template>
<button @click="toggleMenu" class="profile-button">
    <img v-if="selfStore.user_data?.photo" :src="photoUrl" alt="Profile photo" loading="lazy">
</button>
<div v-if="isOpen" class="dropdown-menu">
    <h3>{{ selfStore.user_data?.username }}</h3>
    <nav aria-label="Pagnigation">
        <ul>
            <li>
                <RouterLink :to="username">My profile</RouterLink>
            </li>
            <li>
                <RouterLink to="/settings">Settings</RouterLink>
            </li>
            <li>
                <RouterLink to="/friends">Friends</RouterLink>
            </li>
            <li>
                <button @click="handleLogout">Logout</button>
            </li>
        </ul>
    </nav>    
</div>
</template>

<style scoped lang="scss">
@use '../style.scss' as *;

.profile-button
{
    @include btn3(inline-block);
    padding: 0;
    width: 50px;
    height: 50px;
    border-radius: 50%;
    &:hover
    {
        box-shadow: none;
        transform: scale(1.042);
    }
    img
    {
        width: 100%;
        border-radius: 50%;
        object-fit: cover;
        object-position: center;
    }
}
.dropdown-menu
{
    z-index: 1;
    position: absolute;
    top: 0px;
    right: 0;
    width: 200px;
    height: 100vh;
    background-color: $grey;
    text-align: left;
    padding: 20px;
    nav
    {
        ul
        {
            li:not(:last-child)
            {
                a
                {
                    display: block;
                    margin: 20px 0px;
                }
            }
            li:last-child
            {
                text-align: end;
            }
        }
    }
}
</style>
<script setup lang="ts">
import { ref, onMounted, onUnmounted, computed } from 'vue';
import { useSelfStore } from '../store/self';

// État d'ouverture/fermeture du menu
const isOpen = ref<boolean>(false)
const selfStore = useSelfStore()
// const photo = selfStore.user_data ? selfStore.user_data.photo : ''
const photoUrl = computed(() => `https://localhost/api/accounts${selfStore.user_data?.photo}`); // Utilisation de la propriété calculée

// Fermer le menu lorsqu'on clique à l'extérieur
const closeOnClickOutside = (event: MouseEvent) =>
{
    const dropdown: HTMLElement | null = document.querySelector('.dropdown-menu')
    const button: HTMLElement | null = document.querySelector('.profile-button') // Sélection du bouton
    if (
        dropdown &&
        button &&
        !dropdown.contains(event.target as Node) &&
        !button.contains(event.target as Node) // Vérifie aussi le bouton
    )
    {
        isOpen.value = false
    }
};

// Ajouter l'écouteur global
onMounted(() => {
  document.addEventListener('click', closeOnClickOutside)
})

// Retirer l'écouteur au démontage
onUnmounted(() => {
  document.removeEventListener('click', closeOnClickOutside)
})

// Basculer l'état du menu
const toggleMenu = () => {
  isOpen.value = !isOpen.value
}
</script>

<template>
    <button @click="toggleMenu" class="profile-button">
        <img v-if="selfStore.user_data?.photo" :src="photoUrl" alt="Profile photo" loading="lazy">
    </button>
    <div v-if="isOpen" class="dropdown-menu">
        <h3>Tom's</h3>
        <nav aria-label="Pagnigation">
            <ul>
                <li>
                    <RouterLink to="/profile">My profile</RouterLink>
                </li>
                <li>
                    <RouterLink to="/settings">Settings</RouterLink>
                </li>
                <li>
                    <RouterLink to="/friends">Friends</RouterLink>
                </li>
                <li>
                    <RouterLink to="/logout">Log out</RouterLink>
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
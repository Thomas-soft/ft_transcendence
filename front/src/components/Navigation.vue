<script setup lang="ts">
import { RouterLink } from 'vue-router'
import ProfileDropDown from './ProfileDropDown.vue'
import { ref } from 'vue'
import { onMounted, onUnmounted } from 'vue'
import { useAuthStore } from '../store/auth';

const isOpen = ref<boolean>(false)
const authStore = useAuthStore()

function toggleMenu(): void {
  isOpen.value = !isOpen.value
}

// Fermer le menu lorsqu'on clique à l'extérieur
const closeOnClickOutside = (event: MouseEvent) =>
{
  const dropdown = document.querySelector('.vertical-navigation')
  const button = document.querySelector('.menu-buerger-button')
  if
  (
    dropdown &&
    button &&
    !dropdown.contains(event.target as Node) &&
    !button.contains(event.target as Node) // Vérifie aussi le bouton
  )
  {
    isOpen.value = false
  }
}

// Ajouter l'écouteur global
onMounted(() => {
  document.addEventListener('click', closeOnClickOutside);
})

// Retirer l'écouteur au démontage
onUnmounted(() => {
  document.removeEventListener('click', closeOnClickOutside);
})
</script>

<template>
  <nav class="navigation">
    <div class="menu-burger">
      <button @click="toggleMenu" class="menu-buerger-button">
        <span></span>
        <span></span>
        <span></span>
      </button>
    </div>
    <div class="title">
      <h1>ft_transcendence</h1>
    </div>
    <ul class="ul-nav">
      <li>
        <RouterLink to="/" activeClass="active-link">Home</RouterLink>
      </li>
      <li>
        <RouterLink to="/credits" activeClass="active-link">Credits</RouterLink>
      </li>
    </ul>
    <div v-if="authStore.is_authenticated" class="profile">
      <ProfileDropDown />
    </div>
    <div v-else class="forms">
      <ul>
          <li>
            <RouterLink to="/login" activeClass="active-link">Log in</RouterLink>
          </li>
          <p>/</p>
          <li>
            <RouterLink to="/register" activeClass="active-link">Sign up</RouterLink>
          </li>
        </ul>
    </div>
  </nav>
  <nav v-if="isOpen" class="vertical-navigation">
    <h1>ft_transcendence</h1>
    <ul>
      <li>
        <RouterLink to="/" activeClass="active-link">Home</RouterLink>
      </li>
      <li>
        <RouterLink to="/credits" activeClass="active-link">Credits</RouterLink>
      </li>
    </ul>
  </nav>
</template>

<style scoped lang="scss">
  @use '../style.scss' as *;
  .navigation
  {
    z-index: 1;
    @include flex(space-between, center);
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    .menu-burger, .title, .ul-nav, .profile, .forms
    {
      margin-top: 5px;
    }
    .menu-burger
    {
      display: none;
    }
    .title
    {
      margin-left: 12px;
      text-align: left;
      h1
      {
        font-size: 1em;
      }
      flex: 1;
    }
    .ul-nav
    {
      @include flex(space-between, center);
      li
      {
        a
        {
          display: block;
        }
        li:not(:last-child)
        {
          a
          {
            margin-right: 10px;
          }
        }
      }
    }
    .profile
    {
      margin-top: 12px;
      margin-right: 12px;
      flex: 1;
      text-align: right;
      ul
      {
        @include flex();
        li
        {
          a
          {
            display: block;
          }
        }
      }
    }
    .forms
    {
      margin-right: 12px;
      flex: 1;
      @include flex();
      justify-content: end;
      ul
      {
        @include flex();
        margin-right: 12px;
        p
        {
          margin: 0 5px;
        }
        li
        {
          a
          {
            display: block;
            margin: 0;
            padding: 5px;
          }
        }
      }
    }
  }
  .vertical-navigation
  {
    z-index: 1;
  }

  /* Responsive */
  @media screen and (max-width: 700px)
  {
    .navigation
    {
      .menu-burger
      {
        text-align: left;
        margin-left: 12px;
        .menu-buerger-button
        {
          @include btn3(flex);
          flex-direction: column;
          span
          {
            background-color: $red;
            width: 30px;
            height: 3px;
            margin: 3px 0;
          }
        }
      }
      .menu-burger, .profile, .forms
      {
        flex: 1;
      }
      .title
      {
        text-align: center;
        margin-left: 0;
      }
      .menu-burger
      {
        display: block;
      }
      .title, .ul-nav
      {
        display: none;
      }
    }
  }
  .vertical-navigation
  {
    position: absolute;
    top: 0;
    left: 0;
    width: 200px;
    height: 100vh;
    background-color: $grey;
    text-align: left;
    padding: 20px;
    h1
    {
      font-size: 1em;
    }
    ul
    {
      li
      {
        a
        {
          display: block;
          margin: 20px 0px;
        }
      }
    }
  }
</style>

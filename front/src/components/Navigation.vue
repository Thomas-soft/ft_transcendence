<script setup lang="ts">
import { RouterLink } from 'vue-router'
import ProfileDropDown from './ProfileDropDown.vue'
import { ref } from 'vue';
import { onMounted, onUnmounted } from 'vue';

const isOpen = ref(false);

const toggleMenu = () => {
  isOpen.value = !isOpen.value
}

// Fermer le menu lorsqu'on clique à l'extérieur
const closeOnClickOutside = (event: MouseEvent) =>
{
  const dropdown = document.querySelector('.vertical-navigation');
  const button = document.querySelector('.menu-buerger-button'); // Sélection du bouton
  if (
    dropdown &&
    button &&
    !dropdown.contains(event.target as Node) &&
    !button.contains(event.target as Node) // Vérifie aussi le bouton
  )
  {
    isOpen.value = false;
  }
};

// Ajouter l'écouteur global
onMounted(() => {
  document.addEventListener('click', closeOnClickOutside);
});

// Retirer l'écouteur au démontage
onUnmounted(() => {
  document.removeEventListener('click', closeOnClickOutside);
});
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
    <ul>
      <li>
        <RouterLink to="/" activeClass="active-link">Home</RouterLink>
      </li>
      <li>
        <RouterLink to="/credits" activeClass="active-link">Credits</RouterLink>
      </li>
    </ul>
    <div class="profile">
      <ProfileDropDown />
    </div>
  </nav>
  <nav v-if="isOpen" class="vertical-navigation">
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
    ul
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
      .menu-burger, .profile
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
      ul
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

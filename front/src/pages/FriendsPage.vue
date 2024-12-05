<script setup>
import FriendsList from '../components/FriendsList.vue'
import SearchUser from '../components/SearchUser.vue'
import RequestsFriend from '../components/RequestsFriend.vue'
import { ref } from 'vue';

const friends = ref(true)
const search = ref(false)
const requests = ref(false)
const title = ref('My friends')

const handleOpenList = () =>
{
    title.value = 'My friends'
    friends.value = true
    search.value = false
    requests.value = false
}
const handleOpenSearch = () =>
{
    title.value = 'Search user'
    search.value = true
    friends.value = false
    requests.value = false
}
const handleOpenRequests = () =>
{
    title.value = 'Friend requests'
    requests.value = true
    friends.value = false
    search.value = false
}
</script>

<template>
<section class="friends">
    <h3>{{ title }}</h3>
    <!-- <p>Here you can see all your friends</p> -->
    <div class="box">
        <ul class="nav">
            <li>
                <button @click="handleOpenList">My friends</button>
            </li>
            <li>
                <button @click="handleOpenSearch">Search</button>
            </li>
            <li>
                <button @click="handleOpenRequests">Requests</button>
            </li>
        </ul>
    </div>
    <div v-if="friends">
        <FriendsList />
    </div>
    <div v-else-if="search">
        <SearchUser />
    </div>
    <div v-else>
        <RequestsFriend />
    </div>
</section>
</template>

<style scoped lang="scss">
@use "../style.scss" as *;

.friends
{
    background-color: $grey;
    padding: 40px;
    border-radius: 50px;
    width: 100%;
    max-width: 800px;
    .box
    {
        width: 100%;
        background-color: $black;
        .nav
        {
            @include flex();
        }
    }
}
@media screen and (max-width: 700px)
{
    .friends
    {
        padding: 5px;
        border-radius: 5px;
        .nav
        {
            button
            {
                padding: 5px;
            }
        }
    }
}
</style>
<script setup lang="ts">
import { ref, onMounted, onUnmounted } from 'vue';

// Références et état
const message = ref<string>('');

// Configuration WebSocket
let chatSocket: WebSocket | null = null;

// Fonction pour initialiser le WebSocket
const setupWebSocket = () => {
    const url = `wss://${window.location.host}/ws/socket-server/`;
    chatSocket = new WebSocket(url);
    

    chatSocket.onopen = () => {
        console.log('WebSocket connected.');
    };
    chatSocket.onerror = (e) => {
        console.error('WebSocket error:', e);
    };
    chatSocket.onmessage = (e) => {
        const data = JSON.parse(e.data);
        console.log(data);

        if (data.type === 'message_received') {
            const messages = document.getElementById('messages');
            if (messages) {
                messages.insertAdjacentHTML(
                    'beforeend',
                    `<div><p>${data.message}</p></div>`
                );
            }
        }
    };

    chatSocket.onclose = () => {
        console.warn('WebSocket closed unexpectedly.');
    };
};

// Fonction pour envoyer un message
const handleSendMessage = (event: Event) => {
    event.preventDefault();

    if (chatSocket && message.value.trim()) {
        chatSocket.send(
            JSON.stringify({
                message: message.value.trim(),
            })
        );
        message.value = ''; // Réinitialiser l'input après envoi
    }
};

// Initialisation et nettoyage du WebSocket
onMounted(() => {
    setupWebSocket();
});

onUnmounted(() => {
    if (chatSocket) {
        chatSocket.close();
    }
});
</script>

<template>
    <div class="chat">
        <h3>Live Chat</h3>
        <section class="chat-box">
            <article class="message" id="messages">
                <!-- Messages insérés ici -->
            </article>
        </section>
        <form id="liveChat" @submit="handleSendMessage">
            <input 
                type="text" 
                name="message" 
                id="message" 
                placeholder="Message" 
                aria-label="Entrez votre message ici"
                v-model="message"
            />
            <div class="submit-container">
                <button type="submit" id="submit">Send</button>
            </div>
        </form>
    </div>
</template>

<style scoped lang="scss">
@use "../style.scss" as *;
.chat
{
    position: fixed;
    bottom: 0;
    // bottom: -320px;
    right: 0;
    background-color: $grey;
    width: 300px;
    height: 300px;
    margin: 12px;
    border-radius: 12px;
    padding: 20px;
    display: flex;
    flex-direction: column;
    transition: 0.3s ease-out;
    .chat-box
    {
        margin: 10px 0;
        flex-grow: 1;
        overflow-y: scroll;
        // box-shadow: 1px 3px 10px $black;
        border-radius: 5px;
        .message
        {
            margin: 10px 0;
        }
        // scrollbar width
        &::-webkit-scrollbar
        {
            background-color: $black;
            width: 5px;
        }
        &::-webkit-scrollbar-thumb
        {
            background-color: $white;
            border-radius: 10px;
        }
    }
    #liveChat
    {
        @include flex(center);
        input
        {
            width: 100%;
            padding: 5px;
            margin: 10px 0 5px 0;
            border-radius: 5px;
            color: $white;
            background-color: $black;
            font-size: 0.8rem;
            transition: 0.3s ease-out;
            border: none;
            outline: 1px solid transparent;
            &:focus
            {
                outline: 1px solid $red;
                border-radius: 7px;
            }
        }
        .submit-container
        {
            margin: 5px;
            button
            {
                text-align: center;
                font-weight: 700;
                padding: 2px 12px;
                background-color: transparent;
                border: none;
                outline: none;
                // border: 1px solid $red;
                border-radius: 10px;
                color: $red;
                box-shadow: 1px 1px 5px $black;
                transition: 0.3s ease-out;
                &:hover
                {
                    background-color: $red;
                    color: $white;
                    box-shadow: 1px 1px 1px $white;
                    cursor: pointer;
                }
            }
        }
    }
}
.chat.open
{
    bottom: 0;
}

.button-open-chat
{
    position: fixed;
    bottom: 0;
    right: 0;
    opacity: 1;
    text-align: center;
    font-weight: 700;
    padding: 10px;
    margin: 15px;
    background-color: transparent;
    border: none;
    outline: none;
    border: 1px solid $red;
    border-radius: 10px;
    color: $red;
    box-shadow: 1px 1px 5px $grey;
    transition: 0.3s ease-out;
    &:hover
    {
        background-color: $red;
        color: $white;
        box-shadow: 1px 1px 1px $white;
        cursor: pointer;
    }
}
</style>
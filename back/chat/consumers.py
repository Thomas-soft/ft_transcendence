import json
from channels.generic.websocket import AsyncWebsocketConsumer
from asgiref.sync import sync_to_async

class ChatConsumer(AsyncWebsocketConsumer):
    async def connect(self):
        user = self.scope["user"].username
        self.room_group_name = 'test'

        await self.accept()

        await self.channel_layer.group_add(
            self.room_group_name,
            self.channel_name
        )
        await self.send(text_data=json.dumps({
            'type': 'connected',
            'message': f'Welcome {user}!'
        }))


    async def disconnect(self, close_code):
        await self.channel_layer.group_discard(
            self.room_group_name,
            self.channel_name
        )

    async def receive(self, text_data):
        try:
            from .models import Message
            text_data_json = json.loads(text_data)
            message_content = text_data_json['message']
            user = text_data_json['username']

            message = await sync_to_async(Message.objects.create)(message=message_content, username=user)

            await self.channel_layer.group_send(
                self.room_group_name,
                {
                    'type': 'chat_message',
                    'message': message.message,
                    'username': user
                }
            )
        except Exception as e:
            print(f"Error in receive: {e}")
            await self.close()

    async def chat_message(self, event):
        username = event['username']
        message = event['message']

        await self.send(text_data=json.dumps({
            'type': 'message_received',
            'message': message,
            'username': username
        }))
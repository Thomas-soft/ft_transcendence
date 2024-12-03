import json
from channels.generic.websocket import AsyncWebsocketConsumer
from asgiref.sync import sync_to_async

class ChatConsumer(AsyncWebsocketConsumer):
    async def connect(self):
        print('connected')
        self.room_group_name = 'test'

        await self.accept()
        
        await self.channel_layer.group_add(
            self.room_group_name,
            self.channel_name
        )
        await self.send(text_data=json.dumps({
            'type': 'connected',
            'message': 'connected!!!'
        }))


    async def disconnect(self, close_code):
        await self.channel_layer.group_discard(
            self.room_group_name,
            self.channel_name
        )

    async def receive(self, text_data):
        from .models import Message
        text_data_json = json.loads(text_data)
        message_content = text_data_json['message']

        message = await sync_to_async(Message.objects.create)(message=message_content)

        await self.channel_layer.group_send(
            self.room_group_name,
            {
                'type': 'chat_message',
                'message': message.message
            }
        )

    async def chat_message(self, event):
        message = event['message']

        await self.send(text_data=json.dumps({
            'type': 'message_received',
            'message': message
        }))
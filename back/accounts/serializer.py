from rest_framework import serializers
from .models import User

class UserSerializer(serializers.ModelSerializer):
    password = serializers.CharField(write_only=True)
    email = serializers.EmailField(required=False)
    is_active = serializers.BooleanField(default=True, read_only=False)

    class Meta:
        model = User
        fields = '__all__'

    def create(self, validated_data):
        # get email from validated_data if it exists
        email = validated_data.get('email', None)
        user = User(
            username=validated_data['username'],
            email=email,
        )
        user.set_password(validated_data['password'])
        user.save()
        return user
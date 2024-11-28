from django.shortcuts import render
from rest_framework.decorators import api_view, permission_classes
from rest_framework.permissions import IsAuthenticated, AllowAny
from rest_framework.response import Response
from rest_framework import status
from django.contrib.auth import get_user_model
from .serializer import UserSerializer

User = get_user_model()

@api_view(['POST'])
@permission_classes([AllowAny])
def register(request):
    serializer = UserSerializer(data=request.data)
    if serializer.is_valid():
        serializer.save()
        return Response({
            "success": True,
        })
    else:
        user = User.objects.filter(username=request.data.get('username')).first()
        if user and user.is_active:
            return Response({
                "success": False,
                "error": "User registration failed. Username already exists."
            })
    return Response({"success": False, "error": serializer.errors})

@api_view(['DELETE'])
@permission_classes([IsAuthenticated])
def delete(request):
    user = request.user
    user.delete()
    return Response({"success": True})
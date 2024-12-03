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
    username = request.data.get('username')
    email = request.data.get('email')

    validation_checks = {
        "Username already exists.": User.objects.filter(username=username).exists(),
        "Email already exists.": User.objects.filter(email=email).exists() and email != "",
    }
    for error_message, condition in validation_checks.items():
        if condition:
            return Response({"success": False, "error": error_message})

    serializer = UserSerializer(data=request.data)
    if serializer.is_valid():
        serializer.save()
        return Response({
            "success": True,
        })
    return Response({"success": False, "error": "Unknown error."})

@api_view(['DELETE'])
@permission_classes([IsAuthenticated])
def delete(request):
    user = request.user
    user.delete()
    return Response({"success": True})

@api_view(['GET'])
@permission_classes([IsAuthenticated])
def get_data(request):
    me = request.user
    res = {
        "success": True,
        "data":
        {
            "photo": me.photo.url,
            "username": me.username,
            "email": me.email,
        }
    }
    return Response(res)

@api_view(['GET'])
@permission_classes([IsAuthenticated])
def get_profile(request, username):
    user = User.objects.get(username=username)
    me = request.user
    res = {
        "success": True,
        "data":
        {
            "photo": user.photo.url,
            "username": user.username,
            "email": user.email if user == me else None,
        }
    }
    return Response(res)
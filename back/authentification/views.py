from django.shortcuts import render
from django.contrib.auth.models import User
from rest_framework.decorators import api_view, permission_classes
from rest_framework.permissions import IsAuthenticated, AllowAny
from rest_framework.response import Response
from rest_framework import status
from django.contrib.auth import get_user_model
from rest_framework_simplejwt.tokens import RefreshToken
from rest_framework_simplejwt.views import (
    TokenObtainPairView,
    TokenRefreshView
)

User = get_user_model()

class CustomTokenObtainPairView(TokenObtainPairView):
    def post(self, request, *args, **kwargs):
        try:
            serializer = self.get_serializer(data=request.data)
            serializer.is_valid(raise_exception=True)

            response = super().post(request, *args, **kwargs)
            tokens = response.data
            access_token = tokens['access']
            refresh_token = tokens['refresh']

            res = Response({
                "success": True,
            })
            res.set_cookie(
                key="access_token",
                value=access_token,
                httponly=True,
                secure=True,
                samesite='None',
                path='/'
            )
            res.set_cookie(
                key="refresh_token",
                value=refresh_token,
                httponly=True,
                secure=True,
                samesite='None',
                path='/'
            )
            return res
        except Exception as e:
            return Response({"success": False, "error": str(e)})

class CustomTokenRefreshView(TokenRefreshView):
    def post(self, request, *args, **kwargs):
        try:
            # Vérifier la présence du refresh token dans les cookies
            refresh_token = request.COOKIES.get('refresh_token')
            if not refresh_token:
                return Response({"refreshed": False, "error": "No refresh token provided."})

            print(f"Refresh token received: {refresh_token}")
            
            # Injecter le refresh token dans les données de la requête
            request.data['refresh'] = refresh_token

            # Appeler la méthode parent pour rafraîchir le token
            try:
                response = super().post(request, *args, **kwargs)
                print(f"Super post response: {response.data}")
            except Exception as e:
                print(f"Error during token refresh: {str(e)}")
                return Response({"success": False, "error": "Token refresh failed."})

            # Vérifier si la réponse contient un access token
            tokens = response.data
            if 'access' not in tokens:
                return Response({"success": False, "error": "Access token not found in response."})

            access_token = tokens['access']

            # Configurer la réponse et ajouter le cookie
            res = Response({"success": True})
            res.set_cookie(
                key="access_token",
                value=access_token,
                httponly=True,
                secure=True,
                samesite='None',
                path='/'
            )
            return res

        except Exception as e:
            print(f"Unexpected error: {str(e)}")
            return Response({"success": False, "error": str(e)})

@api_view(['POST'])
@permission_classes([AllowAny])
def is_authenticated(request):
    if not request.user.is_authenticated:
        return Response({"success": False})
    return Response({"success": True})

@api_view(['POST'])
def logout(request):
    try:
        res = Response()
        res.data = { "success": True }
        res.delete_cookie('access_token', path='/', samesite='None')
        res.delete_cookie('refresh_token', path='/', samesite='None')
        return res
    except Exception as e:
        return Response({ "success": False, "error": str(e) })
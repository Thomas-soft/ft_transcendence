from django.urls import path
from .views import CustomTokenObtainPairView, CustomTokenRefreshView, logout, is_authenticated
from rest_framework_simplejwt.views import (
    TokenObtainPairView,
    TokenRefreshView
)

urlpatterns = [
    path('token/', CustomTokenObtainPairView.as_view(), name='token_obtain_pair'),
    path('token/refresh/', CustomTokenRefreshView.as_view(), name='token_refresh'),
    path('logout/', logout),
    path('is_authenticated/', is_authenticated),
]
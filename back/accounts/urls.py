from django.urls import path
from django.conf import settings
from django.conf.urls.static import static
from .views import delete, register, get_data, get_profile, upload_profile_photo

urlpatterns = [
    path('register/', register),
    path('delete/', delete),
    path('data/', get_data),
    path('profile/<str:username>/', get_profile),
    path('upload_profile_photo/', upload_profile_photo),
] + static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
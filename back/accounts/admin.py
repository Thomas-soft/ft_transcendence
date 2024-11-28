from django.contrib import admin
from .models import User

# Register your models here.
@admin.register(User)
class CustomUserAdmin(admin.ModelAdmin):
    list_display = ('id', 'username', 'email', 'photo_tag', 'photo_url', 'is_active')  # Personnalisez si nécessaire
    search_fields = ('username', 'email')
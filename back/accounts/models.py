from django.contrib.auth.models import AbstractUser
from django.db import models
from django.db.models.fields.related import ManyToManyField
from django.utils.html import format_html
from django.utils.timezone import now
from django.core.validators import RegexValidator
import os

def unique_image_path(instance, filename):
    ext = filename.split('.')[-1]
    timestamp = now().strftime('%Y-%m-%d-%H-%M-%S')  # Format : AAAAMMJJHHMMSS
    # Ajouter l'ID de l'utilisateur si disponible (ex : instance.id)
    unique_filename = f"user_{instance.id}_{timestamp}.{ext}"
    return os.path.join("profile_images", unique_filename)

class User(AbstractUser):
    is_active = models.BooleanField(default=True)
    photo = models.ImageField(
        upload_to=unique_image_path,
        default="profile_images/default.png"
    )
    username = models.CharField(
        unique=True,
        blank=False,
        max_length=20,
        # validators=[
        #     RegexValidator(
        #         regex=r'^[a-zA-Z0-9_\\-]{3,20}$',
        #         message='Username must be 3-20 characters long and can only contain letters, numbers, underscores, and hyphens.',
        #         code='invalid_username'
        #     )
        # ]
    )
    email = models.EmailField(
        unique=True,
        blank=True,
        null=True,
        max_length=255,
        # validators=[
        #     RegexValidator(
        #         regex=r"[A-Za-z0-9\._%+\-]+@[A-Za-z0-9\.\-]+\.[A-Za-z]{2,}",
        #         message='Invalid email format.',
        #         code='invalid_email'
        #     )
        # ]
    )
    password = models.CharField(
        blank=False,
        max_length=128,
        # validators= [
        #     RegexValidator(
        #         regex=r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$',
        #         message='Password must be at least 8 characters long, one letter, one number and one special character.',
        #         code='invalid_password'
        #     )
        # ]
    ),
    two_factor_auth = models.BooleanField(default=False)
    friends = ManyToManyField(
        'self',
        symmetrical=True,
        blank=True)
    sent_friend_requests = ManyToManyField('self',
        symmetrical=False,
        related_name='requests_received',
        blank=True)
    received_friend_requests = ManyToManyField('self',
        symmetrical=False,
        related_name='requests_sent',
        blank=True)
    blocked_users = ManyToManyField('self',
        symmetrical=False,
        related_name='blocked_by',
        blank=True)

    def photo_url(self):
        if self.photo:
            return f'/api/accounts{self.photo.url}'
        return None

    def photo_tag(self):
        if self.photo:
            return format_html('<a href="{}"><img src="{}" style="max-height: 50px; max-width: 50px" /></a>', self.photo_url(), self.photo_url())
        return None

    photo_tag.short_description = 'Profile Photo'

    def __str__(self):
        return self.username

from django.db import models

class Message(models.Model):
    username = models.CharField(max_length=150)
    message = models.CharField(max_length=999)
    created_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f"{self.message} ({self.created_at})"
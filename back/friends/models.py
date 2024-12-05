from django.db import models
from accounts.models import User

# Create your models here.
class FriendRequest(models.Model):
    from_user = models.ForeignKey(User, on_delete=models.CASCADE, related_name='friend_requests_sent')
    to_user = models.ForeignKey(User, on_delete=models.CASCADE, related_name='friend_requests_received')
    status = models.CharField(max_length=10, default='pending',
    choices=[
        ('pending', 'Pending'),
        ('accepted', 'Accepted'),
        ('canceled', 'Canceled'),
        ('rejected', 'Rejected'),
        ('deleted', 'Deleted'),
        ('blocked', 'Blocked'),
        ('unblocked', 'Unblocked')
    ])
    created_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
         return f"{self.from_user.username} -> {self.to_user.username} ({self.status})"
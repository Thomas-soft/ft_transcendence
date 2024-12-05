from django.urls import path
from .views import FriendList, FriendRequests, FriendActions, searchUsers

urlpatterns = [
    path('list/', FriendList),
    path('requests/', FriendRequests),
    path('<int:id>/<str:action>/', FriendActions),
    path('search/', searchUsers),
]

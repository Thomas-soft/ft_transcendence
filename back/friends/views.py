from django.shortcuts import render
from rest_framework.decorators import api_view, permission_classes
from rest_framework.permissions import IsAuthenticated
from rest_framework.response import Response
from rest_framework import status
from django.contrib.auth import get_user_model
from .models import FriendRequest
from django.shortcuts import get_object_or_404

User = get_user_model()

@api_view(['GET'])
@permission_classes([IsAuthenticated])
def FriendList(request):
    me = request.user
    friends = me.friends.all()
    res = {
        "success": True,
        "data":
        [
            {
                "id": friend.id,
                "photo": friend.photo.url if friend.photo else None,
                "username": friend.username,
                "is_friend": friend in me.friends.all(),
                "is_pending": friend in me.sent_friend_requests.all(),
                "pending_by": me in friend.sent_friend_requests.all(),
                "is_blocked": friend in me.blocked_users.all(),
                "blocked_by": me in friend.blocked_by.all(),

            }
            for friend in friends
        ]
    }
    return Response(res)

@api_view(['GET'])
@permission_classes([IsAuthenticated])
def FriendRequests(request):
    me = request.user
    sent_requests = me.sent_friend_requests.all()
    received_requests = me.received_friend_requests.all()
    res = {
        "success": True,
        "data":
        {
            "sent":
            [
                {
                    "id": friend.id,
                    "photo": friend.photo.url if friend.photo else None,
                    "username": friend.username,
                    "is_friend": friend in me.friends.all(),
                    "is_pending": friend in me.sent_friend_requests.all(),
                    "pending_by": me in friend.sent_friend_requests.all(),
                    "is_blocked": friend in me.blocked_users.all(),
                    "blocked_by": me in friend.blocked_by.all(),
                }
                for friend in sent_requests
            ],
            "received":
            [
                {
                    "id": friend.id,
                    "photo": friend.photo.url if friend.photo else None,
                    "username": friend.username,
                    "is_friend": friend in me.friends.all(),
                    "is_pending": friend in me.sent_friend_requests.all(),
                    "pending_by": me in friend.sent_friend_requests.all(),
                    "is_blocked": friend in me.blocked_users.all(),
                    "blocked_by": me in friend.blocked_by.all(),
                }
                for friend in received_requests
            ]
        }
    }
    return Response(res)

@api_view(['POST'])
@permission_classes([IsAuthenticated])
def FriendActions(request, id, action):
    me = request.user
    user = get_object_or_404(User, id=id)
    error = None

    def base_error(me, user):
        if (me.blocked_users.filter(id=user.id).exists()):
            return "User is blocked."
        if (user.blocked_users.filter(id=me.id).exists()):
            return "You are blocked."
        if (me.friends.filter(id=user.id).exists()):
            return "User is already your friend."
        return None

    def utils_bd(me, user):
        if (me.sent_friend_requests.filter(id=user.id).exists()):
            me.sent_friend_requests.remove(user)
        if (me.received_friend_requests.filter(id=user.id).exists()):
            me.received_friend_requests.remove(user)
        if (user.sent_friend_requests.filter(id=me.id).exists()):
            user.sent_friend_requests.remove(me)
        if (user.received_friend_requests.filter(id=me.id).exists()):
            user.received_friend_requests.remove(me)
        if (me.friends.filter(id=user.id).exists()):
            me.friends.remove(user)
            user.friends.remove(me)

    if (me == user):
        return Response({"error": "You cannot perform this action on yourself."})
    if (action == 'add'):
        if (me.sent_friend_requests.filter(id=user.id).exists()):
            return Response({"error": "Friend request already sent."})
        if (me.received_friend_requests.filter(id=user.id).exists()):
            return Response({"error": "Friend request already received."})
        error = base_error(me, user)
        if (error):
            return Response({"error": error})
        me.sent_friend_requests.add(user)
        user.received_friend_requests.add(me)
        FriendRequest.objects.create(from_user=me, to_user=user, status="pending")
        return Response({"success": True})
    elif (action == 'cancel'):
        if (me.sent_friend_requests.filter(id=user.id).exists() == False or user.received_friend_requests.filter(id=me.id).exists() == False):
            return Response({"error": "No friend request found."})
        me.sent_friend_requests.remove(user)
        user.received_friend_requests.remove(me)
        FriendRequest.objects.create(from_user=me, to_user=user, status="canceled")
        return Response({"success": True})
    elif (action == 'accept'):
        if (me.received_friend_requests.filter(id=user.id).exists() == False or user.sent_friend_requests.filter(id=me.id).exists() == False):
            return Response({"error": "No friend request found."})
        error = base_error(me, user)
        if (error):
            return Response({"error": error})
        me.friends.add(user)
        user.friends.add(me)
        me.received_friend_requests.remove(user)
        user.sent_friend_requests.remove(me)
        FriendRequest.objects.create(from_user=me, to_user=user, status="accepted")
        return Response({"success": True})
    elif (action == 'reject'):
        if (me.received_friend_requests.filter(id=user.id).exists() == False or user.sent_friend_requests.filter(id=me.id).exists() == False):
            return Response({"error": "No friend request found."})
        error = base_error(me, user)
        if (error):
            return Response({"error": error})
        me.received_friend_requests.remove(user)
        user.sent_friend_requests.remove(me)
        FriendRequest.objects.create(from_user=me, to_user=user, status="rejected")
        return Response({"success": True})
    elif (action == 'delete'):
        if (me.friends.filter(id=user.id).exists() == False):
            return Response({"error": "User is not your friend."})
        if (me.blocked_users.filter(id=user.id).exists()):
            return Response({"error": "User is blocked."})
        if (user.blocked_users.filter(id=me.id).exists()):
            return Response({"error": "You are blocked."})
        utils_bd(me, user)
        FriendRequest.objects.create(from_user=me, to_user=user, status="deleted")
        return Response({"success": True})
    elif (action == 'block'):
        if (me.blocked_users.filter(id=user.id).exists()):
            return Response({"error": "User is already blocked."})
        utils_bd(me, user)
        me.blocked_users.add(user)
        FriendRequest.objects.create(from_user=me, to_user=user, status="blocked")
        return Response({"success": True})
    elif (action == 'unblock'):
        if (me.blocked_users.filter(id=user.id).exists() == False):
            return Response({"error": "User is not blocked."})
        utils_bd(me, user)
        me.blocked_users.remove(user)
        FriendRequest.objects.create(from_user=me, to_user=user, status="unblocked")
        return Response({"success": True})
    else:
        return Response({"error": "Invalid action"}, status=400)

@api_view(['GET'])
@permission_classes([IsAuthenticated])
def searchUsers(request):
    query = request.query_params.get('query', '')
    limit = int(request.query_params.get('limit', 10))
    if query:
        users = User.objects.filter(username__icontains=query)[:limit]
        me = request.user
        data = []
        for user in users:
            if (user == request.user):
                continue
            if (user.blocked_users.filter(id=me.id).exists() or me.blocked_users.filter(id=user.id).exists()):
                continue
            else:
                data.append({
                    "id": user.id,
                    "photo": user.photo.url if user.photo else None,
                    "username": user.username,
                    "is_friend": user in me.friends.all(),
                    "is_pending": user in me.sent_friend_requests.all(),
                    "pending_by": me in user.sent_friend_requests.all(),
                    "is_blocked": user in me.blocked_users.all(),
                    "blocked_by": me in user.blocked_by.all(),
                })
        return Response({"success": True, "data": data})

    return Response({"success": False, "error": "No query provided"})
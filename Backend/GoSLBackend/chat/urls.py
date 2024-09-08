from django.urls import path
from .views import send_message, list_messages,test_message

urlpatterns = [
    path('send', send_message, name='send_message'),
    path('', list_messages, name='list_messages'),
    path('test', test_message, name='test_message')
]
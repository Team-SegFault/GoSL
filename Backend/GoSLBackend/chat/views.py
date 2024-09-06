from django.shortcuts import render

# Create your views here.
from django.shortcuts import redirect, render
from django.conf import settings
from .models import ChatMessage
from django.http import JsonResponse
import google.generativeai as genai

def send_message(request):
    if request.method == 'GET':

        genai.configure(api_key=settings.GEMINI_API_KEY)
        model = genai.GenerativeModel("gemini-pro")

        user_message = request.GET.get('message')
        bot_response = model.generate_content(user_message)
        return JsonResponse({ 'bot_response': bot_response.text })

        # ChatMessage.objects.create(user_message=user_message, bot_response=bot_response.text)

    # return redirect('list_messages')

def list_messages(request):
    messages = ChatMessage.objects.all()
    return render(request, 'chatbot/list_messages.html', { 'messages': messages })

def test_message(request):
    return JsonResponse({ 'message': "Hello World" })
from django.db import models

# Create your models here.
class ChatMessage(models.Model):
    user_id = models.ForeignKey('auth.User', on_delete=models.CASCADE)
    user_message = models.TextField()
    bot_response = models.TextField()
    created_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f"ID:{self.user_id} User: {self.user_message}, Bot: {self.bot_response}"
    

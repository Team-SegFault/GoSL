from django.core.mail import send_mail

def send_mail(email):
    # Set the email details
    subject = 'Visa Application Approved'
    from_email = 'ravinduhiran26@gmail.com'
    recipient_list = [email]
    
    # Compose the email message
    email_message = f"Congradulations! Your visa application has been approved."
    
    # Send the email
    send_mail(subject, email_message, from_email, recipient_list)
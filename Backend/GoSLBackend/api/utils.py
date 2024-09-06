from django.core.mail import send_mail
from datetime import datetime
from django.core.mail import send_mail,EmailMultiAlternatives
from django.template.loader import render_to_string
from django.utils.html import strip_tags
from django.conf import settings
from django.http import HttpResponse

def confirm_visa_application(request):
    recipient_name = "Lakindu Kariyawasam"
    visa_type = "Tourist Visa"
    approval_date = datetime.now()
    expiration_date = approval_date
    travel_dates = datetime.now()
    your_full_name = "Ravindu Hiran"
    context = {
    "recipient_name":"Lakindu Kariyawasam",
    "visa_type":"Tourist Visa",
    "approval_date":datetime.now(),
    "expiration_date":approval_date,
    "travel_dates":datetime.now(),
    "your_full_name":"Ravindu Hiran"}
    convert_to_html_content =  render_to_string(template_name='email_templates.html',context=context)
    plain_message = strip_tags(convert_to_html_content)
    message = EmailMultiAlternatives(
        subject="Visa Application Confirmation",
        body=plain_message,
        from_email= "ravinduhiran26@gmail.com",
        to=["lakindu.21@cse.mrt.ac.lk"])
    message.attach_alternative(convert_to_html_content,"text/html")
    message.send()
    # responce = send_mail("Visa Application Confirmation",plain_message,"ravinduhiran26@gmail.com",["lakindu.21@cse.mrt.ac.lk"])
    return HttpResponse("Email sent successfully")

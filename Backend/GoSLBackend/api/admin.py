from django.contrib import admin

# Register your models here.
from .models import VisaApplication, VisaType

admin.site.register(VisaApplication)
admin.site.register(VisaType)

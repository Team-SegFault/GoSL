from django.contrib import admin

# Register your models here.
from .models import VisaApplication, VisaType, Person

admin.site.register(VisaApplication)
admin.site.register(VisaType)
admin.site.register(Person)
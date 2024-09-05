import os,django
from GoSLBackend.settings import INSTALLED_APPS,DATABASES
os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'GoSLBackend.settings')
django.setup()

from api.models import VisaType, VisaApplication


def populate_database():
    try:
        visa_type = VisaType.objects.create(visa_type='Tourist Visa', visa_type_description='Tourist Visa', visa_type_duration=30)
    except VisaType.Exist:
        print('Tourist Visa already exists')

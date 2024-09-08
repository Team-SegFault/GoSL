import os,django
from GoSLBackend.settings import INSTALLED_APPS,DATABASES
os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'GoSLBackend.settings')
django.setup()

from api.models import VisaType, VisaApplication, Destination, Animals, Food, Events


def populate_database():
    try:
        visa_type = VisaType.objects.create(visa_type='Tourist Visa', visa_type_description='Tourist Visa', visa_type_duration=30)

        for i in range(5):
            visa_application = VisaApplication.objects.create(name=f'Name {i}', address=f'Address {i}', phone=f'Phone {i}', email=f'Email {i}', passport_number=f'Passport Number {i}', passport_issue_date='2021-01-01', passport_expiry_date='2021-12-31', visa_type_reference=visa_type, visa_start_date='2021-01-01')
    except VisaType.Exist:
        print('Tourist Visa already exists')


        # Create 5 destinations
        for i in range(5):
            destination = Destination.objects.create(name=f'Destination {i}', compact_description=f'Compact Description {i}', description=f'Description {i}', image=f'Image {i}')


if __name__ == '__main__':
    populate_database()
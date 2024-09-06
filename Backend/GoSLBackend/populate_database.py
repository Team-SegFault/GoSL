import os,django
from GoSLBackend.settings import INSTALLED_APPS,DATABASES


os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'GoSLBackend.settings')
django.setup()


from api.models import VisaType, VisaApplication


def populate_database()->None:
    try:
        visa_type = VisaType.objects.get(visa_type='Tourist Visa')
        if visa_type.exists():
            raise Exception('Tourist Visa already exists')
        visa_type = VisaType.objects.create(visa_type='Tourist Visa', visa_type_description='Tourist Visa', visa_type_duration=30)
        for i in range(5):
            visa_application = VisaApplication.objects.get(name=f"Name {i}")
            if visa_type.exists():
                raise Exception('VisaAppilcation Exists')
            visa_application = VisaApplication.objects.create(name=f'Name {i}', address=f'Address {i}', phone=f'Phone {i}', email=f'Email {i}', passport_number=f'Passport Number {i}', passport_issue_date='2021-01-01', passport_expiry_date='2021-12-31', visa_type_reference=visa_type, visa_start_date='2021-01-01')
    except Exception as e:
        print(e)


if __name__ == '__main__':
    populate_database()

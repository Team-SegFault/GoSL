from rest_framework import serializers
from .models import VisaApplication
from .models import VisaType

# Serialize for VisaType
class VisaTypeSerializer(serializers.ModelSerializer):
    class Meta:
        model = VisaType
        fields = ['id', 'visa_type', 'visa_type_description', 'visa_type_duration']


# Serialize for VisaApplication
class VisaApplicationSerializer(serializers.ModelSerializer):
    class Meta:
        model = VisaApplication
        fields = ['id', 'form_created', 'name', 'email', 'phone', 'address', 'passport_number', 'passport_issue_date', 'passport_expiry_date', 'passport_photo', 'visa_type_reference', 'visa_start_date']
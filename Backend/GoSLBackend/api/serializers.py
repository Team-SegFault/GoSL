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
        fields = "__all__"

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        read_only_fields = [
            'isApproved', 'isRejected', 'isProccessing', 
            'isPending', 'form_created', 'id'
        ]
        for field in read_only_fields:
            if field in self.fields:
                self.fields[field].read_only = True
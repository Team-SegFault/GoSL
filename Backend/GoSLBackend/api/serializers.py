from rest_framework import serializers
from .models import VisaApplication
from .models import VisaType
from .models import Person

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


# Common Surf Serializer
class CommonSurfSerializer(serializers.Serializer):
    name = serializers.CharField()
    compact_description = serializers.CharField()
    description = serializers.CharField()
    image = serializers.CharField()


class LoginSerializer(serializers.Serializer):
    username = serializers.CharField()
    password = serializers.CharField()
    name = serializers.CharField(read_only=True)


class UserRegistrationSerializer(serializers.ModelSerializer):
    password = serializers.CharField(write_only=True)
    admin = serializers.BooleanField(write_only=True, default=False)

    class Meta:
        model = Person
        fields = ['username', 'name', 'password', 'admin']

    def create(self, validated_data):
        password = validated_data.pop('password', None)
        admin = validated_data.pop('admin', False)
        user = super().create(validated_data)
        if password:
            user.set_password(password)
            user.is_staff = admin
            user.is_superuser = admin
            user.save()
        return user


class PersonDetailSerializer(serializers.ModelSerializer):
    class Meta:
        model = Person
        fields = ['name', 'username']


class PersonUpdateSerializer(serializers.ModelSerializer):
    class Meta:
        model = Person
        fields = ['name']


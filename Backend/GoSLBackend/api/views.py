# Create your views here.
from rest_framework import generics
from .models import  VisaApplication, VisaType
from .serializers import VisaApplicationSerializer, VisaTypeSerializer
from .permissions import KeyCloakOfficerPermission

class VisaTypeListCreate(generics.ListCreateAPIView):
    queryset = VisaType.objects.all()
    serializer_class = VisaTypeSerializer


class VisaTypeDetail(generics.RetrieveUpdateDestroyAPIView):
    queryset = VisaType.objects.all()
    serializer_class = VisaTypeSerializer


class VisaApplicationListCreate(generics.ListCreateAPIView):
    queryset = VisaApplication.objects.all()
    serializer_class = VisaApplicationSerializer
    permission_classes = [KeyCloakOfficerPermission]


class VisaApplicationDetail(generics.RetrieveUpdateDestroyAPIView):
    queryset = VisaApplication.objects.all()
    serializer_class = VisaApplicationSerializer
from django.shortcuts import render
from rest_framework import generics
from .models import  VisaApplication, VisaType
from .serializers import VisaApplicationSerializer, VisaTypeSerializer
from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
import requests
from fake_useragent import UserAgent
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



class InterpolNoticeView(APIView):
    def get(self, request, firstname, lastname):
        ua = UserAgent()
        url = "https://ws-public.interpol.int/notices/v1/red"
        params = {
            'name': firstname,
            'forename': lastname
        }
        headers = {
            "accept": "application/json",
            "accept-encoding": "gzip, deflate, br, zstd",
            "accept-language": "en-US,en;q=0.9",
            "origin": "https://interpol.api.bund.dev",
            "priority": "u=1, i",
            "referer": "https://interpol.api.bund.dev/",
            "sec-ch-ua": '"Chromium";v="128", "Not;A=Brand";v="24", "Google Chrome";v="128"',
            "sec-ch-ua-mobile": "?0",
            "sec-ch-ua-platform": '"Windows"',
            "sec-fetch-dest": "empty",
            "sec-fetch-mode": "cors",
            "sec-fetch-site": "cross-site",
            "user-agent": str(ua.chrome)
        }

        with requests.Session() as session:
            session.headers.update(headers)
            response = session.get(url, params=params)
            if response.status_code == 200:
                data = response.json()
                if data.get('total', 0) >= 1:
                    return Response({"notice_found": True}, status=status.HTTP_200_OK)
                else:
                    return Response({"notice_found": False}, status=status.HTTP_200_OK)
            else:
                return Response({"error": "Failed to retrieve data from Interpol"}, status=status.HTTP_500_INTERNAL_SERVER_ERROR)

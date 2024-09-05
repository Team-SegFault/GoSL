from django.urls import path
from .views import VisaTypeListCreate, VisaTypeDetail, VisaApplicationListCreate, VisaApplicationDetail

urlpatterns = [
    path('visa-types/', VisaTypeListCreate.as_view(), name='visa-type-list-create'),
    path('visa-types/<int:pk>/', VisaTypeDetail.as_view(), name='visa-type-detail'),
    path('visa-applications/', VisaApplicationListCreate.as_view(), name='visa-application-list-create'),
    path('visa-applications/<int:pk>/', VisaApplicationDetail.as_view(), name='visa-application-detail'),
]

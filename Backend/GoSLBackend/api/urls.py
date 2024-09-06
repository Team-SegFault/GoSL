from django.urls import path

from .views import VisaTypeListCreate, VisaTypeDetail, VisaApplicationListCreate, VisaApplicationDetail,InterpolNoticeView
from .utils import confirm_visa_application
urlpatterns = [
    path('visa-types/', VisaTypeListCreate.as_view(), name='visa-type-list-create'),
    path('visa-types/<int:pk>/', VisaTypeDetail.as_view(), name='visa-type-detail'),
    path('visa-applications/', VisaApplicationListCreate.as_view(), name='visa-application-list-create'),
    path('visa-applications/<int:pk>/', VisaApplicationDetail.as_view(), name='visa-application-detail'),
    path('interpol-notice/<str:firstname>/<str:lastname>/', InterpolNoticeView.as_view(), name='interpol-notice'),
    path('confirm-visa-application/', confirm_visa_application, name='confirm-visa-application')
]

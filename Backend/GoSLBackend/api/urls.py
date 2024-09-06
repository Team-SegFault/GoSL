from django.urls import path

from .views import VisaTypeListCreate, VisaTypeDetail, VisaApplicationListCreate, VisaApplicationDetail,InterpolNoticeView
from .views import CustomLoginView, CustomLogoutView, SignUpView, PersonRetrieveView, PersonUpdateView

from .utils import confirm_visa_application
urlpatterns = [
    path('visa-types/', VisaTypeListCreate.as_view(), name='visa-type-list-create'),
    path('visa-types/<int:pk>/', VisaTypeDetail.as_view(), name='visa-type-detail'),
    path('visa-applications/', VisaApplicationListCreate.as_view(), name='visa-application-list-create'),
    path('visa-applications/<int:pk>/', VisaApplicationDetail.as_view(), name='visa-application-detail'),
    path('interpol-notice/<str:firstname>/<str:lastname>/', InterpolNoticeView.as_view(), name='interpol-notice'),
    path('login', CustomLoginView.as_view(), name='login-view'),
    path('logout', CustomLogoutView.as_view(), name='logout-view'),
    path('signup', SignUpView.as_view(), name='signup-view'),
    # path('get-token', CustomObtainAuthToken.as_view(), name='get-token-view'),
    path('account/<slug:pk>', PersonRetrieveView.as_view(), name='person-retrieve-view'),
    path('account-update/<slug:pk>', PersonUpdateView.as_view(), name='account-update-view'),
    path('confirm-visa-application/', confirm_visa_application, name='confirm-visa-application')
]

"""
Django settings for GoSLBackend project.

Generated by 'django-admin startproject' using Django 5.1.1.

For more information on this file, see
https://docs.djangoproject.com/en/5.1/topics/settings/

For the full list of settings and their values, see
https://docs.djangoproject.com/en/5.1/ref/settings/
"""

from pathlib import Path

# Build paths inside the project like this: BASE_DIR / 'subdir'.
BASE_DIR = Path(__file__).resolve().parent.parent


# Quick-start development settings - unsuitable for production
# See https://docs.djangoproject.com/en/5.1/howto/deployment/checklist/

# SECURITY WARNING: keep the secret key used in production secret!
SECRET_KEY = 'django-insecure-m90whvp444j9w3pw+l6h%6wn6%6-#k@4gf*fqzy=(jb#!^0$0p'

# SECURITY WARNING: don't run with debug turned on in production!
DEBUG = True

ALLOWED_HOSTS = []


# Application definition

INSTALLED_APPS = [
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'rest_framework',
    'api',
]

REST_FRAMEWORK = {
    'DEFAULT_AUTHENTICATION_CLASSES': (
        'rest_framework_simplejwt.authentication.JWTAuthentication',
    ),
}

# Keycloak JWT settings
from datetime import timedelta

SIMPLE_JWT = {
    'ALGORITHM': 'RS256',
    'SIGNING_KEY': '',  # Leave this empty since we'll use the public key from Keycloak
    'VERIFYING_KEY': '''
    -----BEGIN PUBLIC KEY-----
    MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAuY+UwddGQiq+wE65pXA3xxceuCo62D9Vp+VOhwune+pC+wEspb4TKyKKLfTTp8uaPHGB9iGN+G+nymv6t8xAGoGBNIVb+7hgtSZrM2IIraKrCIQ5jBYHeOnh+jfkEBULFIcscosIlEyBt3i2p5WNQIxWS1uXR77x1R80+cVKv0JFT6QRxTzvfFux869qKajcvlt4vC27skQ1rTpnSskfDJZ8qox96O3pWeFB4gVUfTInDJmzt4v0TpwKnQ+vVKICSoYP84THG3V+9YTFESZRNV94CiCbT+2yP6ZPtONjsjzbzUIdMBbdVKFolFfogYPl/xkEvvpRHobFMnXEz22kSQIDAQAB
    -----END PUBLIC KEY-----
    ''',
    'AUTH_HEADER_TYPES': ('Bearer',),
    'USER_ID_FIELD': 'sub',
    'USER_ID_CLAIM': 'sub',
    'JWK_URL': 'https://localhost:8080/auth/realms/gosl/protocol/openid-connect/certs',
    'ISSUER': 'https://localhost:8080/auth/realms/gosl',
    'AUDIENCE': 'account',
    'TOKEN_LIFETIME': timedelta(minutes=5),
}

MIDDLEWARE = [
    'django.middleware.security.SecurityMiddleware',
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.middleware.common.CommonMiddleware',
    'django.middleware.csrf.CsrfViewMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    'django.middleware.clickjacking.XFrameOptionsMiddleware',
]

ROOT_URLCONF = 'GoSLBackend.urls'

TEMPLATES = [
    {
        'BACKEND': 'django.template.backends.django.DjangoTemplates',
        'DIRS': [],
        'APP_DIRS': True,
        'OPTIONS': {
            'context_processors': [
                'django.template.context_processors.debug',
                'django.template.context_processors.request',
                'django.contrib.auth.context_processors.auth',
                'django.contrib.messages.context_processors.messages',
            ],
        },
    },
]

WSGI_APPLICATION = 'GoSLBackend.wsgi.application'


# Database
# https://docs.djangoproject.com/en/5.1/ref/settings/#databases

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.sqlite3',
        'NAME': BASE_DIR / 'db.sqlite3',
    }
}


# Password validation
# https://docs.djangoproject.com/en/5.1/ref/settings/#auth-password-validators

AUTH_PASSWORD_VALIDATORS = [
    {
        'NAME': 'django.contrib.auth.password_validation.UserAttributeSimilarityValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.MinimumLengthValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.CommonPasswordValidator',
    },
    {
        'NAME': 'django.contrib.auth.password_validation.NumericPasswordValidator',
    },
]


# Internationalization
# https://docs.djangoproject.com/en/5.1/topics/i18n/

LANGUAGE_CODE = 'en-us'

TIME_ZONE = 'UTC'

USE_I18N = True

USE_TZ = True


# Static files (CSS, JavaScript, Images)
# https://docs.djangoproject.com/en/5.1/howto/static-files/

STATIC_URL = 'static/'
MEDIA_URL = '/media/'
MEDIA_ROOT = BASE_DIR / 'media/'

# Default primary key field type
# https://docs.djangoproject.com/en/5.1/ref/settings/#default-auto-field

DEFAULT_AUTO_FIELD = 'django.db.models.BigAutoField'

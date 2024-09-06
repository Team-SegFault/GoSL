from rest_framework.permissions import IsAuthenticated, BasePermission
import jwt
from django.conf import settings
from rest_framework.exceptions import AuthenticationFailed

class KeyCloakOfficerPermission(BasePermission):
    required_role = 'officer'

    def has_permission(self, request, view):
        # Return False if the Authorization header is not present
        if "Authorization" not in request.headers:
            return False

        # Get the token from the Authorization header
        auth_token = request.headers.get("Authorization", "").split("Bearer ")[1]

        # Get the public key from the settings
        public_key = settings.SIMPLE_JWT['VERIFYING_KEY']

        # Decode the token
        decoded = jwt.decode(auth_token, public_key, algorithms=['RS256'], options={"verify_signature": False}, audience=settings.SIMPLE_JWT['AUDIENCE'])

        # Get the users roles
        roles = decoded.get('realm_access', {}).get('roles', [])
        # print("roles", roles)

        # Check if the required role is in the users roles
        return self.required_role in roles

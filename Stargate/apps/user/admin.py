from django.contrib import admin

# Register your models here.
from django.contrib.auth import get_user_model

from .models import Permission, Role, Organization

Users = get_user_model()

# Register your models here.
admin.site.register(Users)
admin.site.register(Permission)
admin.site.register(Role)
admin.site.register(Organization)

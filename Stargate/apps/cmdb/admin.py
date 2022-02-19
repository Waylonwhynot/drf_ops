

from django.contrib import admin

from .models.model import Info, Group, InfoRelatedType, InfoRelated, FieldGroup, Fields
from .models.resources import Data, DataRelated
from .models.tags import Tag, DataTagRelated

admin.site.site_title = "Stargate" # html-title
admin.site.site_header = "Stargate"  # 后台登录页以及登录后侧边栏头部
admin.site.index_title = "Stargate" #登录后首页标题

# Register your models here.
admin.site.register(Info)
class InfoAdmin(admin.ModelAdmin):
    list_display = ('identifies', 'name', 'is_usable', 'group')
    list_editable = ('is_usable',)
    list_per_page = 50
    list_filter = ('name', 'group')

admin.site.register(Group)
admin.site.register(InfoRelatedType)
admin.site.register(InfoRelated)
admin.site.register(FieldGroup)
admin.site.register(Fields)
admin.site.register(Data)
admin.site.register(DataRelated)
admin.site.register(Tag)
admin.site.register(DataTagRelated)

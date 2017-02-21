from django.contrib import admin
from django import forms
from ckeditor.widgets import CKEditorWidget
from .models import *

class PublicacionAdminForm(forms.ModelForm):
    contenido = forms.CharField(widget=CKEditorWidget())
    class Meta:
        model = Publicacion
        fields = ['titulo','contenido']

class PublicacionAdmin(admin.ModelAdmin):
    form = PublicacionAdminForm
    list_display = ["titulo"]
    search_fields = ["titulo"]

    def save_model(self, request, obj, form, change):
        if not change:
            obj.autor = request.user
        obj.save()
admin.site.register(Publicacion, PublicacionAdmin)
from django.contrib import admin
from django import forms
from ckeditor.widgets import CKEditorWidget
from .models import *

# Registro del modelo Audio.
class AudioAdminForm(forms.ModelForm):
    descripcion = forms.CharField(widget=CKEditorWidget())
    class Meta:
        model = Audio
        fields = ['propietario', 'autor', 'descripcion', 'ruta', 'carrera', 'tipo', 'clase', 'clave', 'tematica']

class AudioAdmin(admin.ModelAdmin):
    form = AudioAdminForm
    list_display = ["__str__","activo","fecha","actualizado"]
    list_filter =["fecha"]
    list_editable =["activo"]
    class Meta:
        model = Audio

admin.site.register(Audio,AudioAdmin)

# Registro del modelo Video.
class VideoAdminForm(forms.ModelForm):
    descripcion = forms.CharField(widget=CKEditorWidget())
    class Meta:
        model = Video
        fields = ['propietario', 'autor', 'descripcion', 'ruta', 'carrera', 'tipo', 'clase', 'clave', 'tematica']

class VideoAdmin(admin.ModelAdmin):
    form = VideoAdminForm
    list_display = ["__str__","activo","fecha","actualizado"]
    list_filter =["fecha"]
    list_editable =["activo"]
    class Meta:
        model = Video

admin.site.register(Video,VideoAdmin)

# Registro del modelo Carrera.
@admin.register(Carrera)
class CarreraAdmin(admin.ModelAdmin):
    list_display = ["nombre","activo","fecha","actualizado",]
    list_filter = ["fecha"]
    list_editable = ["activo"]
    search_fields = ["nombre"]

    class Meta:
        model = Carrera

# Registro del modelo Clase.
@admin.register(Clase)
class ClaseAdmin(admin.ModelAdmin):
    list_display = ["nombre","activo","fecha","actualizado"]
    list_filter = ["fecha"]
    list_editable = ["activo"]
    search_fields = ["nombre"]
    class Meta:
        model = Clase

# Registro del modelo Clave.
@admin.register(Clave)
class ClaveAdmin(admin.ModelAdmin):
    list_display = ["nombre","activo","fecha","actualizado"]
    list_filter = ["fecha"]
    list_editable = ["activo"]
    search_fields = ["nombre"]
    class Meta:
        model = Clave

# Registro del modelo Evento.
@admin.register(Evento)
class EventoAdmin(admin.ModelAdmin):
    list_display = ["nombre","activo","fecha","actualizado"]
    list_filter = ["fecha"]
    list_editable = ["activo"]
    search_fields = ["nombre"]
    class Meta:
        model = Evento

# Registro del modelo Facultad.
@admin.register(Facultad)
class FacultadAdmin(admin.ModelAdmin):
    list_display = ["nombre","activo","fecha","actualizado"]
    list_filter = ["fecha"]
    list_editable = ["activo"]
    search_fields = ["nombre"]
    class Meta:
        model = Facultad

# Registro del modelo Image.
class ImagenAdminForm(forms.ModelForm):
    descripcion = forms.CharField(widget=CKEditorWidget())
    class Meta:
        model = Imagen
        fields = ['titulo', 'propietario', 'autor', 'carrera', 'descripcion', 'activo', 'tipo', 'clase', 'clave', 'tematica']

class ImagenAdmin(admin.ModelAdmin):
    form = ImagenAdminForm
    list_display = ["titulo", "ruta","activo","fecha","actualizado"]
    list_filter = ["fecha"]
    list_editable = ["activo"]
    search_fields = ["titulo"]
    class Meta:
        model = Imagen

admin.site.register(Imagen, ImagenAdmin)
# Registro del modelo Perfil.
@admin.register(Perfil)
class PerfilAdmin(admin.ModelAdmin):
    list_display = ["usuario","activo","fecha","actualizado"]
    list_filter = ["fecha"]
    list_editable = ["activo"]
    search_fields = ["codigo"]
    class Meta:
        model = Perfil

# Registro del modelo Sede.
@admin.register(Sede)
class SedeAdmin(admin.ModelAdmin):
    list_display = ["nombre","pais","ciudad","direccion","activo","fecha","actualizado"]
    list_filter = ["fecha"]
    list_editable = ["pais","ciudad","direccion","activo","activo"]
    search_fields = ["nombre"]
    class Meta:
        model = Sede

# Registro del modelo Tematica.
@admin.register(Tematica)
class ClaveAdmin(admin.ModelAdmin):
    list_display = ["nombre","activo","fecha","actualizado"]
    list_filter = ["fecha"]
    list_editable = ["activo"]
    search_fields = ["nombre"]
    class Meta:
        model = Tematica

# Registro del modelo Texto.
class TextAdminForm(forms.ModelForm):
    texto = forms.CharField(widget=CKEditorWidget())
    class Meta:
        model = Texto
        fields = ['nombre', 'propietario', 'colaborador', 'texto', 'carrera', 'activo', 'tipo', 'clase', 'clave', 'tematica']

class TextoAdmin(admin.ModelAdmin):
    form = TextAdminForm
    list_display = ["nombre", "activo", "fecha", "actualizado"]
    list_filter = ["fecha", "activo"]
    list_editable = ["activo"]
    search_fields = ["nombre"]

    class Meta:
        model = Texto
admin.site.register(Texto, TextoAdmin)

# Registro del modelo Tipo.
@admin.register(Tipo)
class TipoAdmin(admin.ModelAdmin):
    list_display = ["nombre", "activo", "fecha", "actualizado"]
    list_filter = ["fecha"]
    list_editable = ["activo"]
    search_fields = ["nombre"]
    class Meta:
        model = Tipo

# Registro del modelo Tipo de evento.
@admin.register(TipoEvento)
class TipoEventoAdmin(admin.ModelAdmin):
    list_display = ["nombre", "activo", "fecha", "actualizado"]
    list_filter = ["fecha"]
    list_editable = ["activo"]
    search_fields = ["nombre"]

    class Meta:
        model = TipoEvento

# Registro del modelo Tipo de orador.
@admin.register(TipoOrador)
class TipoOradorAdmin(admin.ModelAdmin):
    list_display = ["__str__", "activo", "fecha", "actualizado"]
    list_filter = ["fecha"]
    list_editable = ["activo"]
    search_fields = ["__str__"]

    class Meta:
        model = TipoOrador

# Registro del modelo Tipo de orador.
@admin.register(AreaConocimiento)
class AreaConocimientoAdmin(admin.ModelAdmin):
    list_display = ["__str__", "activo", "fecha", "actualizado"]
    list_filter = ["fecha"]
    list_editable = ["activo"]
    search_fields = ["__str__"]

    class Meta:
        model = TipoOrador

# Registro del modelo Pdf.
class PdfAdminForm(forms.ModelForm):
    descripcion = forms.CharField(widget=CKEditorWidget())
    class Meta:
        model = Pdf
        fields = ['nombre', 'propietario', 'autor', 'carrera', 'descripcion', 'ruta', 'evento', 'descargable', 'activo','tipo', 'clase', 'clave',
                  'tematica']

# Registro del modelo Pdf.
class PdfAdmin(admin.ModelAdmin):
    form = PdfAdminForm
    list_display = ["nombre", "activo", "fecha", "actualizado"]
    list_filter = ["fecha"]
    list_editable = ["activo"]
    search_fields = ["nombre"]
    class Meta:
        model = Pdf

admin.site.register(Pdf,PdfAdmin)

# Registro del modelo Dominios.
@admin.register(Dominio)
class DominioAdmin(admin.ModelAdmin):
    list_display = ["nombre", "activo", "fecha", "actualizado"]
    list_filter = ["fecha", "activo"]
    list_editable = ["activo"]
    search_fields = ["nombre"]
    class Meta:
        model = Dominio

# Registro del modelo Lista.
@admin.register(Tarea)
class TareaAdmin(admin.ModelAdmin):
    list_display = ["nombre", "fecha", "prioridad", "hecho"]
    list_filter = ["prioridad", "hecho"]
    list_editable = ["hecho"]
    search_fields = ["nombre"]
    class Meta:
        model = Tarea

# Registro del modelo Lista.
@admin.register(Orador)
class OradorAdmin(admin.ModelAdmin):
    list_display = ["nombres", "apellidos", "llegada", "despedida"]
    search_fields = ["nombres"]
    class Meta:
        model = Orador


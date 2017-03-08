#!/usr/bin/env python
# -*- coding: utf-8 -*-
from django import forms
from multiupload.fields import MultiFileField
from .models import *

class AudioForm(forms.ModelForm):
    class Meta:
        model = Audio
        fields = ['titulo', 'propietario', 'autor', 'descripcion', 'ruta', 'evento', 'carrera', 'tipo','clase' ,'clave', 'tematica']
        widgets = {
            'titulo':forms.TextInput(attrs={'class':'form-control'}),
            'propietario':forms.TextInput(attrs={'class':'form-control'}),
            'autor': forms.SelectMultiple(attrs={'class':'selectpicker', 'data-width':'100%', 'data-live-search':'true','data-container':'body','title':'Seleccione los colaboradores'}),
            'descripcion': forms.Textarea(attrs={'class':'form-control'}),
            'ruta': forms.FileInput(attrs={'class':'file','id':'audio_ruta'}),
            'evento': forms.Select(attrs={'class': 'selectpicker', 'data-width': '100%', 'data-live-search': 'true','data-container': 'body'}),
            'carrera': forms.Select(attrs={'class':'form-control'}),
            'tipo': forms.Select(attrs={'class':'form-control'}),
            'clase': forms.Select(attrs={'class':'form-control'}),
            'clave': forms.SelectMultiple(attrs={'class':'selectpicker', 'data-width':'100%', 'data-live-search':'true','data-container':'body','title':'Seleccione las claves'}),
            'tematica': forms.SelectMultiple(attrs={'class':'selectpicker', 'data-width':'100%', 'data-live-search':'true','data-container':'body','title':'Seleccione las tematicas'}),
        }

    def __init__(self, *args, **kwargs):
        super(AudioForm, self).__init__(*args, **kwargs)
        self.fields['descripcion'].label = "Descripcion"
        self.fields['carrera'].empty_label = "Seleccione la carrera enfoque del audio"
        self.fields['tipo'].empty_label = "Seleccione un tipo"
        self.fields['clase'].empty_label = "Seleccione una clase"
        self.fields['evento'].empty_label = "Seleccione el evento"


class PdfForm(forms.ModelForm):
    class Meta:
        model = Pdf
        fields = ['nombre', 'propietario','autor','descripcion','ruta', 'evento', 'tipo','clase','clave','tematica','carrera','descargable']
        widgets = {
            'nombre': forms.TextInput(attrs={'class':'form-control'}),
            'propietario':forms.TextInput(attrs={'class':'form-control'}),
            'autor': forms.SelectMultiple(attrs={'class':'selectpicker', 'data-width':'100%', 'data-live-search':'true','data-container':'body','title':'Seleccione los colaboradores'}),
            'descripcion':forms.Textarea(attrs={'class':'form-control'}),
            'ruta':forms.FileInput(attrs={'class':'file','id':'pdf_ruta'}),
            'descargable':forms.CheckboxInput(attrs={'class':'flat-red','id':'descargable'}),
            'tipo':forms.Select(attrs={'class':'selectpicker', 'data-width':'100%', 'data-live-search':'true','data-container':'body'}),
            'evento':forms.Select(attrs={'class':'selectpicker', 'data-width':'100%', 'data-live-search':'true','data-container':'body'}),
            'clase':forms.Select(attrs={'class':'selectpicker', 'data-width':'100%', 'data-live-search':'true','data-container':'body'}),
            'clave': forms.SelectMultiple(attrs={'class':'selectpicker', 'data-width':'100%', 'data-live-search':'true','data-container':'body','title':'Seleccione las claves'}),
            'tematica': forms.SelectMultiple(attrs={'class':'selectpicker', 'data-width':'100%', 'data-live-search':'true','data-container':'body','title':'Seleccione las tematicas'}),
            'carrera': forms.Select(attrs={'class':'selectpicker', 'data-width':'100%', 'data-live-search':'true','data-container':'body'}),
        }



    def __init__(self, *args, **kwargs):
        super(PdfForm, self).__init__(*args, **kwargs)
        self.fields['nombre'].label = "Titulo"
        self.fields['autor'].label = "Colaboradores"
        self.fields['descripcion'].label = "Pequeña descripción"
        self.fields['ruta'].label = "Adjunte el archivo"
        self.fields['carrera'].empty_label = "Seleccione la carrera enfoque del PDF"
        self.fields['descargable'].label = "Puede descargar"
        self.fields['tipo'].empty_label = "Seleccione el tipo"
        self.fields['evento'].empty_label = "Seleccione el evento"
        self.fields['clase'].empty_label = "Seleccione la clase"
        self.fields['tematica'].label = "Tematicas"

class TextoForm(forms.ModelForm):
    class Meta:
        model = Texto
        fields = ['nombre', 'colaborador', 'texto', 'carrera', 'tipo', 'evento', 'clase', 'clave', 'tematica']
        widgets = {
            'nombre': forms.TextInput(attrs={'class': 'form-control','placeholder':'Nombre del texto'}),
            'colaborador': forms.SelectMultiple(attrs={'class': 'selectpicker', 'data-width': '100%', 'data-live-search': 'true','data-container': 'body', 'title': 'Selecciones los colaboradores'}),
            'texto': forms.Textarea(attrs={'class':'form-control'}),
            'carrera': forms.Select(attrs={'class': 'selectpicker', 'data-width': '100%', 'data-live-search': 'true','data-container': 'body'}),
            'tipo': forms.Select(attrs={'class': 'selectpicker', 'data-width': '100%', 'data-live-search': 'true','data-container': 'body'}),
            'evento': forms.Select(attrs={'class': 'selectpicker', 'data-width': '100%', 'data-live-search': 'true','data-container': 'body'}),
            'clase': forms.Select(attrs={'class': 'selectpicker', 'data-width': '100%', 'data-live-search': 'true','data-container': 'body'}),
            'clave': forms.SelectMultiple(attrs={'class': 'selectpicker', 'data-width': '100%', 'data-live-search': 'true','data-container': 'body', 'title':'Seleccione las claves'}),
            'tematica': forms.SelectMultiple(attrs={'class': 'selectpicker', 'data-width': '100%', 'data-live-search': 'true','data-container': 'body', 'title':'Seleccione las tematicas'}),
        }

    def __init__(self, *args, **kwargs):
        super(TextoForm, self).__init__(*args, **kwargs)
        self.fields['nombre'].empty_label = "Titulo"
        self.fields['carrera'].empty_label = "Seleccione la carrera enfoque del TEXTO"
        self.fields['tipo'].empty_label = "Seleccione un tipo"
        self.fields['evento'].empty_label = "Seleccione un evento"
        self.fields['clase'].empty_label = "Seleccione una clase"

class ImagenForm(forms.ModelForm):
    class Meta:
        model = Imagen
        fields = ['titulo', 'autor', 'descripcion', 'carrera', 'evento', 'tipo', 'clase', 'clave', 'tematica']
        widgets = {
            'titulo':forms.TextInput(attrs={'class':'form-control'}),
            'autor': forms.SelectMultiple(attrs={'class': 'selectpicker', 'data-width': '100%', 'data-live-search': 'true','data-container': 'body', 'title': 'Selecciones los colaboradores'}),
            'descripcion': forms.Textarea(attrs={'class': 'form-control'}),
            'carrera': forms.Select(attrs={'class': 'selectpicker', 'data-width': '100%', 'data-live-search': 'true','data-container': 'body'}),
            'evento': forms.Select(attrs={'class': 'selectpicker', 'data-width': '100%', 'data-live-search': 'true','data-container': 'body'}),
            'tipo': forms.Select(attrs={'class': 'selectpicker', 'data-width': '100%', 'data-live-search': 'true','data-container': 'body'}),
            'clase': forms.Select(attrs={'class': 'selectpicker', 'data-width': '100%', 'data-live-search': 'true','data-container': 'body'}),
            'clave': forms.SelectMultiple(attrs={'class': 'selectpicker', 'data-width': '100%', 'data-live-search': 'true','data-container': 'body', 'title': 'Seleccione las claves'}),
            'tematica': forms.SelectMultiple(attrs={'class': 'selectpicker', 'data-width': '100%', 'data-live-search': 'true','data-container': 'body', 'title': 'Seleccione las tematicas'}),
        }

    rutas = MultiFileField(min_num=1, max_num=100, max_file_size=1024*1024*5)

    def save(self, commit=True):
        instance = super(ImagenForm, self).save(commit)
        for each in self.cleaned_data['rutas']:
            Foto.objects.create(ruta=each, contenedor=instance)
        return instance

    def __init__(self, *args, **kwargs):
        super(ImagenForm, self).__init__(*args, **kwargs)
        self.fields['autor'].empty_label = "Seleccione la carrera enfoque del TEXTO"
        self.fields['carrera'].empty_label = "Seleccione una carrera"
        self.fields['tipo'].empty_label = "Seleccione un tipo"
        self.fields['evento'].empty_label = "Seleccione un evento"
        self.fields['clase'].empty_label = "Seleccione una clase"

class EventoForm(forms.ModelForm):
    class Meta:
        model = Evento
        fields = ['nombre', 'encargado', 'colaboradores', 'tipo', 'inicio', 'fin', 'activo', 'cronograma']
        widgets = {
            'nombre': forms.TextInput(attrs={'class':'form-control', 'placeholder':'Nombre del evento'}),
            'encargado': forms.Select(attrs={'class': 'selectpicker', 'data-width': '100%', 'data-live-search': 'true','data-container': 'body', 'placeholder': 'Encargado'}),
            'colaboradores': forms.SelectMultiple(attrs={'class': 'selectpicker', 'data-width': '100%', 'data-live-search': 'true','data-container': 'body', 'title': 'Seleccione los colaboradores'}),
            'tipo': forms.Select(attrs={'class': 'selectpicker', 'data-width': '100%', 'data-live-search': 'true','data-container': 'body', 'placeholder': 'Seleccione el tipo de evento'}),
            'inicio': forms.DateInput(attrs={'class':'form-control pull-right', 'placeholder':'Nombre del evento','data-provide':'datepicker'}),
            'fin': forms.DateInput(attrs={'class':'form-control pull-right', 'placeholder':'Fecha de inicio','data-provide':'datepicker'}),
            'cronograma':forms.FileInput(attrs={'class':'file','id':'evento_ruta'}),
            'activo': forms.TextInput(attrs={'class':'form-control', 'placeholder':'Nombre del evento'}),
        }

    def __init__(self, *args, **kwargs):
        super(EventoForm, self).__init__(*args, **kwargs)
        self.fields['nombre'].empty_label = "Evento"
        self.fields['encargado'].empty_label = "Seleccione el encargado"
        self.fields['colaboradores'].empty_label = "Seleccione los colaboradores"
        self.fields['tipo'].empty_label = "Seleccione el tipo de evento"
        self.fields['colaboradores'].empty_label = "Seleccione los colaboradores"
        self.fields['inicio'].empty_label = "Inicio"
        self.fields['fin'].empty_label = "Fin"
        self.fields['cronograma'].empty_label = "Cronograma"

class VideoForm(forms.ModelForm):
    class Meta:
        model = Video
        fields = ['titulo', 'autor', 'descripcion', 'ruta', 'carrera', 'evento', 'tipo', 'clase', 'clave', 'tematica']
        widgets = {
            'titulo': forms.TextInput(attrs={'class':'form-control'}),
            'autor': forms.SelectMultiple(attrs={'class':'selectpicker', 'data-width':'100%', 'data-live-search':'true','data-container':'body',"title":"Seleccione los colaboradores"}),
            'descripcion': forms.Textarea(attrs={'class':'form-control'}),
            'ruta': forms.FileInput(attrs={'class':'file','id':'audio_ruta'}),
            'carrera': forms.Select(attrs={'class': 'selectpicker', 'data-width': '100%', 'data-live-search': 'true','data-container': 'body'}),
            'evento': forms.Select(attrs={'class':'form-control'}),
            'tipo': forms.Select(attrs={'class':'form-control'}),
            'clase': forms.Select(attrs={'class':'form-control'}),
            'clave': forms.SelectMultiple(attrs={'class':'selectpicker', 'data-width':'100%', 'data-live-search':'true','data-container':'body',"title":"Seleccione las palabras claves"}),
            'tematica': forms.SelectMultiple(attrs={'class':'selectpicker', 'data-width':'100%', 'data-live-search':'true','data-container':'body',"title":"Seleccione las tematicas"}),
        }

    def __init__(self, *args, **kwargs):
        super(VideoForm, self).__init__(*args, **kwargs)
        self.fields['autor'].label = "Colaboradores"
        self.fields['carrera'].empty_label = "Seleccione la carrera enfoque del VIDEO"
        self.fields['descripcion'].label = "Descripcion"
        self.fields['tipo'].label = "Tipo"
        self.fields['tipo'].empty_label = "Seleccione un tipo"
        self.fields['evento'].label = "Evento"
        self.fields['evento'].empty_label = "Seleccione un evento"
        self.fields['clase'].label = "Clase"
        self.fields['clase'].empty_label = "Seleccione una clase"
        self.fields['clave'].label = "Clave"
        self.fields['tematica'].label = "Tematica"


class ListaForm(forms.ModelForm):
    class Meta:
        model = Tarea
        fields = ['nombre', 'prioridad', 'hecho']
        widgets = {
            'nombre': forms.TextInput(attrs={'class':'form-control', 'placeholder':'Nombre de la tarea'}),
            'prioridad': forms.Select(attrs={'class': 'selectpicker', 'data-width': '100%', 'data-live-search': 'true','data-container': 'body'}),
            'hecho': forms.CheckboxInput(attrs={'class':'flat-red','id':'hecho'}),
        }

    def __init__(self, *args, **kwargs):
        super(ListaForm, self).__init__(*args, **kwargs)
        self.fields['nombre'].empty_label = "Nombre de la tarea"
        self.fields['prioridad'].empty_label = "Prioridad"
        self.fields['prioridad'].empty = "Seleccione la prioridad"
        self.fields['hecho'].label = "Hecho"


def clean(self, *args, **kwargs):
    super(PdfForm, self).clean(*args, **kwargs)
    super(TextoForm, self).clean(*args, **kwargs)
    super(AudioForm, self).clean(*args, **kwargs)
    super(VideoForm, self).clean(*args, **kwargs)
    super(EventoForm, self).clean(*args, **kwargs)

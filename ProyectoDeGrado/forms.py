#!/usr/bin/env python
# -*- coding: utf-8 -*-
import datetime
from django import forms
from django.core.mail import send_mail
from django.template import Context

from ProyectoDeGrado.settings import MEDIA_ROOT
from apps.administrador.models import *
from django.contrib.auth.models import User

class PerfilForm(forms.ModelForm):

    class Meta:
        model = Perfil
        fields = ['usuario', 'avatar', 'sede', 'codigo', 'carrera']
        widgets = {
            'usuario': forms.Select(attrs={'class':'selectpicker', 'disabled':'disabled', 'data-width':'100%', 'data-live-search':'true','data-container':'body'}),
            'avatar':forms.FileInput(attrs={'class':'file'}),
            'sede':forms.Select(attrs={'class':'selectpicker', 'data-width':'100%', 'data-live-search':'true','data-container':'body'}),
            'codigo':forms.TextInput(attrs={'class':'form-control'}),
            'carrera':forms.SelectMultiple(attrs={'class':'selectpicker', 'data-width':'100%', 'data-live-search':'true','data-container':'body','title':'Seleccione sus carreras'})
        }

    def __init__(self, *args, **kwargs):
        super(PerfilForm, self).__init__(*args, **kwargs)
        self.fields['sede'].empty_label = "Seleccione la su sede"

    def enviar(self, data):
        link = "http://www.repositio.com/activate/"+data['username']+"/"+ data['activation_key']
        message = "Continue con el proceso de registro por medio de este link "+link
        send_mail(data['email_subject'], message, 'Repositio <repositio@gmail.com>', [data['username']+data['dominio']],fail_silently=False)

    def save(self, data):
        perfil = Perfil()
        usuario = User.objects.get(username = data['username'])
        perfil.usuario = usuario
        perfil.activation_key=data['activation_key']
        perfil.key_expires=datetime.datetime.strftime(datetime.datetime.now() + datetime.timedelta(days=2), "%Y-%m-%d %H:%M:%S")
        perfil.save()
        return perfil


class UserForm(forms.ModelForm):

    class Meta:
        model = User
        fields = ['username', 'password', 'email', 'first_name', 'last_name']
        widgets = {
            'username': forms.TextInput(attrs={'class':'form-control'}),
            'password': forms.PasswordInput(attrs={'class':'form-control'}),
            'email': forms.EmailInput(attrs={'class':'form-control', 'disabled':'disabled'}),
            'first_name': forms.TextInput(attrs={'class':'form-control'}),
            'last_name': forms.TextInput(attrs={'class':'form-control'}),
        }

    def save(self, data):
        usuario = User()
        usuario.username = data['username']
        usuario.email = data['username']+data['dominio']
        usuario.save()
        return usuario

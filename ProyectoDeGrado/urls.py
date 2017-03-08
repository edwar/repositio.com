"""ProyectoDeGrado URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/1.10/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  url(r'^$', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  url(r'^$', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.conf.urls import url, include
    2. Add a URL to urlpatterns:  url(r'^blog/', include('blog.urls'))
"""
#!/usr/bin/env python
# -*- coding: utf-8 -*-
from django.conf.urls import url, include
from django.contrib import admin
from .views import *
from django.contrib.auth.views import login
from django.conf import settings
from django.conf.urls.static import static
from django.contrib.auth.views import logout

urlpatterns = [
    url('^', include('django.contrib.auth.urls')),
    url(r'^cerrar/$', logout,{'next_page': '/'}),
    #Urls de configuracion de Django-jet
    url(r'^jet/dashboard/', include('jet.dashboard.urls', 'jet-dashboard')),  # Django JET dashboard URLS
    url(r'^jet/', include('jet.urls', 'jet')),  # Django JET URLS
    #Url de configuracion del administrador
    url(r'^admin/repositio/', admin.site.urls),
    #Url de inicio
    url(r'^$', InicioView.as_view()),
    url(r'^busqueda/', SearchView.as_view()),
    #Url de login
    url(r'^sesion/',logout_required(login),{'template_name':'publico/sesion/inicio.html'},name="login"),
    #Url de login
    url(r'^$',logout_required(login),{'template_name':'inicio.html'},name="logout"),
    #Url de configuracion de administracion
    url(r'^administrador/', include('apps.administrador.urls', namespace='administrador')),
    url(r'^blog/', include('apps.blog.urls', namespace='blog')),
    url(r'^registro/', CorreoView.as_view(), name='registro'),
    url(r'^activate/(?P<username>[-\w]+)/(?P<key>.+)/', ActivacionView.as_view(), name='activacion'),
    url(r'^restaurar/clave/', ClaveView.as_view(), name='clave'),
    url(r'^actualizar/clave/', ActualizarClaveView.as_view(), name='actualizar_clave'),
    url(r'^lomasvisto/pdf/', LoMasVistoPdfView.as_view(), name='lomasvistopdf'),
    url(r'^lomasvisto/texto/', LoMasVistoTextoView.as_view(), name='lomasvistotexto'),
    url(r'^lomasvisto/audio/', LoMasVistoAudioView.as_view(), name='lomasvistoaudio'),
    url(r'^lomasvisto/video/', LoMasVistoVideoView.as_view(), name='lomasvistovideo'),
    url(r'^estadisticas/', EstadisticasView.as_view(), name='estadisticas'),
    url(r'^404/', Error404View.as_view(), name='404'),
    url(r'^500/', Error500View.as_view(), name='500'),
]+ static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)



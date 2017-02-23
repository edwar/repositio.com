#!/usr/bin/env python
# -*- coding: utf-8 -*-
from django.conf.urls import url
from .views import *

urlpatterns = [
    url(r'^$', PrincipalView.as_view(), name='inicio'),

    #URLS de creacion de contenidos FORMULARIOS
    url(r'^pdf/$', PdfView.as_view(), name='pdf'),
    url(r'^pdf/nuevo/$', PdfCreateView.as_view(), name='pdf_nuevo'),
    url(r'^pdf/lista/$', PdfListView.as_view(), name='pdf_lista'),
    url(r'^pdf/detalle/(?P<pk>\d+)/$', PdfDetail.as_view(), name='pdf_detalle'),
    url(r'^pdf/editar/(?P<pk>\d+)/$', PdfUpdate.as_view(), name='pdf_editar'),
    url(r'^pdf/eliminar/(?P<pk>\d+)/$', PdfDelete.as_view(), name='pdf_eliminar'),
    url(r'^audio/$', AudioView.as_view(), name='audio'),
    url(r'^audio/nuevo/$', AudioCreateView.as_view(), name='audio_nuevo'),
    url(r'^audio/lista/$', AudioListView.as_view(), name='audio_lista'),
    url(r'^audio/detalle/(?P<pk>\d+)/$', AudioDetail.as_view(), name='audio_detalle'),
    url(r'^audio/editar/(?P<pk>\d+)/$', AudioUpdate.as_view(), name='audio_editar'),
    url(r'^audio/eliminar/(?P<pk>\d+)/$', AudioDelete.as_view(), name='audio_eliminar'),
    url(r'^texto/$', TextoView.as_view(), name='texto'),
    url(r'^texto/nuevo/$', TextoCreateView.as_view(), name='texto_nuevo'),
    url(r'^texto/lista/$', TextoListView.as_view(), name='texto_lista'),
    url(r'^texto/detalle/(?P<pk>\d+)/$', TextoDetailView.as_view(), name='texto_detalle'),
    url(r'^texto/editar/(?P<pk>\d+)/$', TextoUpdateView.as_view(), name='texto_editar'),
    url(r'^texto/eliminar/(?P<pk>\d+)/$', TextoDeleteView.as_view(), name='texto_eliminar'),
    url(r'^video/$', VideoView.as_view(), name='video'),
    url(r'^video/nuevo/$', VideoCreateView.as_view(), name='video_nuevo'),
    url(r'^video/lista/$', VideoListView.as_view(), name='video_lista'),
    url(r'^video/detalle/(?P<pk>\d+)/$', VideoDetail.as_view(), name='video_detalle'),
    url(r'^video/editar/(?P<pk>\d+)/$', VideoUpdate.as_view(), name='video_editar'),
    url(r'^video/eliminar/(?P<pk>\d+)/$', VideoDelete.as_view(), name='video_eliminar'),
    url(r'^imagen/$', ImagenView.as_view(), name='imagen'),
    url(r'^imagen/nuevo/$', ImagenCreateView.as_view(), name='imagen_nuevo'),
    url(r'^imagen/lista/$', ImagenListView.as_view(), name='imagen_lista'),
    url(r'^imagen/detalle/(?P<pk>\d+)/$', ImagenDetail.as_view(), name='texto_detalle'),
    url(r'^imagen/editar/(?P<pk>\d+)/$', ImagenUpdate.as_view(), name='texto_editar'),
    url(r'^imagen/eliminar/(?P<pk>\d+)/$', ImagenDelete.as_view(), name='texto_eliminar'),
    url(r'^evento/$', EventoView.as_view(), name='evento'),
    url(r'^evento/nuevo/$', EventoCreateView.as_view(), name='evento_nuevo'),
    url(r'^evento/lista/$', EventoListView.as_view(), name='evento_nuevo'),
    url(r'^evento/detalle/(?P<pk>\d+)/$', EventoDetail.as_view(), name='evento_nuevo'),
    url(r'^evento/detalle/(?P<pk>\d+)/lista/$', Lista.as_view(), name='evento_nuevo'),
    url(r'^lista/(?P<pk>\d+)/$', ListaChange.as_view(), name='evento_nuevo'),
    url(r'^pendiente/$', PendienteView.as_view(), name='pendiente'),
    url(r'^pdf/activar/(?P<pk>\d+)/$', PdfActivarView.as_view(), name='activar_pdf'),
    url(r'^texto/activar/(?P<pk>\d+)/$', TextoActivarView.as_view(), name='activar_texto'),
    url(r'^audio/activar/(?P<pk>\d+)/$', AudioActivarView.as_view(), name='activar_audio'),
    url(r'^video/activar/(?P<pk>\d+)/$', VideoActivarView.as_view(), name='activar_video'),
    url(r'^imagen/activar/(?P<pk>\d+)/$', ImagenActivarView.as_view(), name='activar_imagen'),
    url(r'^perfil/(?P<pk>\d+)/$', PerfilView.as_view(), name='tematica_nuevo'),
]

handler404 = Error404View
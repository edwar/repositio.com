#!/usr/bin/env python
# -*- coding: utf-8 -*-
from django.contrib.auth.decorators import login_required
from django.http import HttpResponseRedirect
from django.shortcuts import render, get_object_or_404
from django.shortcuts import render
from django.utils.decorators import method_decorator
from django.views import View
from django.views.generic import TemplateView
from django.views.generic.detail import DetailView
from django.views.generic.edit import CreateView, UpdateView
from django.views.generic.list import ListView
from django.views.generic import FormView
from .forms import *
from .models import *

decoradores = [
    login_required
]
#Vista del dashboard
@method_decorator(decoradores, name='dispatch')
class PrincipalView(TemplateView):
    template_name = 'privado/principal.html'

#Vista de PDFS
@method_decorator(decoradores, name='dispatch')
class PdfView(TemplateView):
    template_name = 'privado/pdf/pdf.html'

@method_decorator(decoradores, name='dispatch')
class PdfCreateView(CreateView):
    form_class = PdfForm
    template_name = 'privado/pdf/pdf_form.html'
    success_url = '/administrador/pdf/lista/'

@method_decorator(decoradores, name='dispatch')
class PdfListView(ListView):
    model = Pdf
    template_name = 'privado/pdf/pdf_list.html'
    success_url = '/administrador/'

    def get_queryset(self):
        queryset = Pdf.objects.filter(activo=True, propietario=self.request.user.pk)
        return queryset

@method_decorator(decoradores, name='dispatch')
class PdfUpdate(UpdateView):
    form_class = PdfForm
    model = Pdf
    template_name = 'privado/pdf/pdf_edit.html'
    success_url = '/administrador/pdf/lista/'



#@method_decorator(decoradores, name='dispatch')
class PdfDetail(DetailView):
    model = Pdf
    template_name = 'privado/pdf/pdf_detail.html'

    def get_context_data(self, **kwargs):
        context = super(PdfDetail, self).get_context_data(**kwargs)
        pdf = Pdf.objects.get(pk=self.kwargs['pk'])
        print pdf.tipo
        if not self.request.user.is_authenticated:
            if pdf.tipo == "Privado":
                HttpResponseRedirect("/404/")
        return context

    def get_context_object_name(self, obj):
        row = PdfVisto.objects.filter(pdf=obj)
        if row.count() > 0:
            row = PdfVisto.objects.get(pdf=obj)
            row.contador+=1
            row.save()
        else:
            row = PdfVisto(pdf=obj, contador=1)
            row.save()
        visita = PdfVisualizacion()
        visita.save()


@method_decorator(decoradores, name='dispatch')
class PdfDelete(FormView):
    form_class = PdfForm
    template_name = 'privado/pdf/pdf_delete.html'

    def get(self, request, *args, **kwargs):
        dato = Pdf.objects.get(pk=kwargs['pk'])
        return render(request, self.template_name,{"dato":dato})

    def post(self, request, *args, **kwargs):
        dato = Pdf.objects.get(pk=kwargs['pk'])
        if (dato.nombre == request.POST.get("nombre")):
            dato.eliminado = True
            dato.save()
        else:
            return render(request, self.template_name, {'msg': "Nombre incorrecto",'tipo':'danger','icono':'glyphicon-warning-sign','titulo':'Error'})
        return HttpResponseRedirect("/administrador/pdf/lista/")

# Vista de TEXTOS
@method_decorator(decoradores, name='dispatch')
class TextoView(TemplateView):
    template_name = 'privado/texto/texto.html'

@method_decorator(decoradores, name='dispatch')
class TextoCreateView(CreateView):
    form_class = TextoForm
    template_name = 'privado/texto/texto_form.html'
    success_url = '/administrador/texto/lista/'

@method_decorator(decoradores, name='dispatch')
class TextoListView(ListView):
    model = Texto
    template_name = 'privado/texto/texto_list.html'

    def get_queryset(self):
        queryset = Texto.objects.filter(activo=True, propietario=self.request.user.pk)
        return queryset

@method_decorator(decoradores, name='dispatch')
class TextoUpdateView(UpdateView):
    form_class = TextoForm
    model = Texto
    template_name = 'privado/texto/texto_edit.html'
    success_url = '/administrador/texto/lista/'

    def post(self, request, *args, **kwargs):
        query = Texto.objects.get(pk=kwargs['pk'])
        texto = self.form_class(request.POST, instance=query)
        if texto.is_valid():
            texto.save()
        return HttpResponseRedirect(self.success_url)

#@method_decorator(decoradores, name='dispatch')
class TextoDetailView(DetailView):
    model = Texto
    template_name = 'privado/texto/texto_detail.html'

    def get_context_object_name(self, obj):
        row = TextoVisto.objects.filter(texto=obj)
        if row.count() > 0:
            row = TextoVisto.objects.get(texto=obj)
            row.contador+=1
            row.save()
        else:
            row = TextoVisto(texto=obj, contador=1)
            row.save()
        visita = TextoVisualizacion()
        visita.save()

@method_decorator(decoradores, name='dispatch')
class TextoDeleteView(FormView):
    form_class = TextoForm
    template_name = 'privado/texto/texto_delete.html'

    def get(self, request, *args, **kwargs):
        dato = Texto.objects.get(pk=kwargs['pk'])
        return render(request, self.template_name, {"dato": dato})


    def post(self, request, *args, **kwargs):
        dato = Texto.objects.get(pk=kwargs['pk'])
        if (dato.nombre == request.POST.get("nombre")):
            dato.eliminado = True
            dato.save()
        else:
            ctx = {'msg':'Nombre incorrecto','tipo':'warning','icono':'glyphicon-warning-sign','titulo':'Ocurrio algo inesperado',"dato": dato}
            return render(request, self.template_name, ctx)
        return HttpResponseRedirect("/administrador/pdf/lista/")


#Vista de AUDIO
@method_decorator(decoradores, name='dispatch')
class AudioView(TemplateView):
    template_name = 'privado/audio/audio.html'

@method_decorator(decoradores, name='dispatch')
class AudioCreateView(CreateView):
    form_class = AudioForm
    template_name = 'privado/audio/audio_form.html'
    success_url = '/administrador/audio/lista/'


@method_decorator(decoradores, name='dispatch')
class AudioListView(ListView):
    model = Audio
    template_name = 'privado/audio/audio_list.html'
    success_url = '/administrador/'

    def get_queryset(self):
        queryset = Audio.objects.filter(activo=True, propietario=self.request.user.pk)
        return queryset


@method_decorator(decoradores, name='dispatch')
class AudioDelete(FormView):
    form_class = AudioForm
    template_name = 'privado/audio/audio_delete.html'

    def get(self, request, *args, **kwargs):
        return render(request, self.template_name)

    def post(self, request, *args, **kwargs):
        dato = Audio.objects.get(pk=kwargs['pk'])
        if ("Eliminar" == request.POST.get("nombre")):
            dato.eliminado = True
            dato.save()
        else:
            return render(request, self.template_name, {'msg': "Nombre incorrecto",'tipo':'danger','icono':'glyphicon-warning-sign','titulo':'Error'})
        return HttpResponseRedirect("/administrador/audio/lista/")

@method_decorator(decoradores, name='dispatch')
class AudioUpdate(UpdateView):
    form_class = AudioForm
    model = Audio
    template_name = 'privado/audio/audio_edit.html'
    success_url = '/administrador/audio/lista/'

#@method_decorator(decoradores, name='dispatch')
class AudioDetail(DetailView):
    model = Audio
    template_name = 'privado/audio/audio_detail.html'

    def get_context_object_name(self, obj):
        row = AudioVisto.objects.filter(audio=obj)
        if row.count() > 0:
            row = AudioVisto.objects.get(audio=obj)
            row.contador += 1
            row.save()
        else:
            row = AudioVisto(audio=obj, contador=1)
            row.save()
        visita = AudioVisualizacion()
        visita.save()

@method_decorator(decoradores, name='dispatch')
class VideoView(TemplateView):
    template_name = 'privado/video/video.html'

@method_decorator(decoradores, name='dispatch')
class VideoCreateView(CreateView):
    form_class = VideoForm
    template_name = 'privado/video/video_form.html'
    success_url = '/administrador/video/lista/'

@method_decorator(decoradores, name='dispatch')
class VideoListView(ListView):
    model = Video
    template_name = 'privado/video/video_list.html'
    success_url = '/administrador/'

    def get_queryset(self):
        queryset = Video.objects.filter(activo=True, propietario=self.request.user.pk)
        return queryset

@method_decorator(decoradores, name='dispatch')
class VideoUpdate(UpdateView):
    form_class = VideoForm
    model = Video
    template_name = 'privado/video/video_edit.html'
    success_url = '/administrador/video/lista/'

#@method_decorator(decoradores, name='dispatch')
class VideoDetail(DetailView):
    model = Video
    template_name = 'privado/video/video_detail.html'

    def get_context_object_name(self, obj):
        row = VideoVisto.objects.filter(video=obj)
        if row.count() > 0:
            row = VideoVisto.objects.get(video=obj)
            row.contador += 1
            row.save()
        else:
            row = VideoVisto(video=obj, contador=1)
            row.save()
        visita = VideoVisualizacion()
        visita.save()


@method_decorator(decoradores, name='dispatch')
class VideoDelete(FormView):
    form_class = VideoForm
    template_name = 'privado/video/video_delete.html'

    def get(self, request, *args, **kwargs):
        return render(request, self.template_name)

    def post(self, request, *args, **kwargs):
        dato = Video.objects.get(pk=kwargs['pk'])
        if ("Eliminar" == request.POST.get("nombre")):
            dato.eliminado = True
            dato.save()
        else:
            return render(request, self.template_name, {'msg': "Nombre incorrecto",'tipo':'danger','icono':'glyphicon-warning-sign','titulo':'Error'})
        return HttpResponseRedirect("/administrador/audio/lista/")


@method_decorator(decoradores, name='dispatch')
class ImagenView(TemplateView):
    template_name = 'privado/imagen/imagen.html'

@method_decorator(decoradores, name='dispatch')
class ImagenCreateView(CreateView):
    form_class = ImagenForm
    template_name = 'privado/imagen/imagen_form.html'
    success_url = '/administrador/imagen/lista/'

@method_decorator(decoradores, name='dispatch')
class ImagenListView(ListView):
    model = Imagen
    template_name = 'privado/imagen/imagen_list.html'
    success_url = '/administrador/'

    def get_queryset(self):
        queryset = Imagen.objects.filter(activo=True, propietario=self.request.user.pk)
        return queryset

@method_decorator(decoradores, name='dispatch')
class ImagenUpdate(UpdateView):
    form_class = ImagenForm
    model = Imagen
    template_name = 'privado/imagen/imagen_edit.html'
    success_url = '/administrador/imagen/lista/'

#@method_decorator(decoradores, name='dispatch')
class ImagenDetail(DetailView):
    model = Imagen
    template_name = 'privado/imagen/imagen_detail.html'


@method_decorator(decoradores, name='dispatch')
class ImagenDelete(FormView):
    form_class = ImagenForm
    template_name = 'privado/imagen/imagen_delete.html'

    def get(self, request, *args, **kwargs):
        return render(request, self.template_name)

    def post(self, request, *args, **kwargs):
        dato = Imagen.objects.get(pk=kwargs['pk'])
        if ("Eliminar" == request.POST.get("nombre")):
            dato.eliminado = True
            dato.save()
        else:
            return render(request, self.template_name, {'msg': "Nombre incorrecto",'tipo':'danger','icono':'glyphicon-warning-sign','titulo':'Error'})
        return HttpResponseRedirect("/administrador/imagen/lista/")


@method_decorator(decoradores, name='dispatch')
class EventoView(TemplateView):
    template_name = 'privado/evento/evento.html'

@method_decorator(decoradores, name='dispatch')
class EventoCreateView(CreateView):
    form_class = EventoForm
    template_name = 'privado/evento/evento_form.html'
    success_url = '/administrador/evento/lista/'

@method_decorator(decoradores, name='dispatch')
class EventoListView(ListView):
    model = Evento
    template_name = 'privado/evento/evento_list.html'
    success_url = '/administrador/'

    def get_queryset(self):
        queryset = Evento.objects.filter(activo=True)
        return queryset

@method_decorator(decoradores, name='dispatch')
class EventoDetail(DetailView):
    model = Evento
    template_name = 'privado/evento/evento_detail.html'



@method_decorator(decoradores, name='dispatch')
class PendienteView(View):
    template_name = 'privado/pendiente/pendiente.html'

    def get(self, *args, **kwargs):
        pdfs = Pdf.objects.filter(activo=False, eliminado=False)
        textos = Texto.objects.filter(activo=False, eliminado=False)
        audios = Audio.objects.filter(activo=False, eliminado=False)
        videos = Video.objects.filter(activo=False, eliminado=False)
        imagenes = Imagen.objects.filter(activo=False, eliminado=False)
        ctx = {"pdfs": pdfs, "textos": textos, "audios": audios, "videos": videos, "imagenes": imagenes}

        return render(self.request, self.template_name,ctx)

@method_decorator(decoradores, name="dispatch")
class PdfActivarView(FormView):
    template_name = 'privado/pendiente/pendiente.html'

    def get(self, request, pk, *args, **kwargs):
        pdf = Pdf.objects.get(id=pk)
        pdf.save()
        return HttpResponseRedirect("/administrador/pendiente/")

@method_decorator(decoradores, name="dispatch")
class TextoActivarView(FormView):
    template_name = 'privado/pendiente/pendiente.html'

    def get(self, request, pk, *args, **kwargs):
        texto = Texto.objects.get(id=pk)
        texto.save()
        return HttpResponseRedirect("/administrador/pendiente/")

@method_decorator(decoradores, name="dispatch")
class AudioActivarView(FormView):
    template_name = 'privado/pendiente/pendiente.html'

    def get(self, request, pk, *args, **kwargs):
        audio = Audio.objects.get(id=pk)
        audio.save()
        return HttpResponseRedirect("/administrador/pendiente/")

@method_decorator(decoradores, name="dispatch")
class VideoActivarView(FormView):
    template_name = 'privado/pendiente/pendiente.html'

    def get(self, request, pk, *args, **kwargs):
        video = Video.objects.get(id=pk)
        video.save()
        return HttpResponseRedirect("/administrador/pendiente/")

@method_decorator(decoradores, name="dispatch")
class ImagenActivarView(FormView):
    template_name = 'privado/pendiente/pendiente.html'

    def get(self, request, pk, *args, **kwargs):
        imagen = Imagen.objects.get(id=pk)
        imagen.save()
        return HttpResponseRedirect("/administrador/pendiente/")

@method_decorator(decoradores, name="dispatch")
class PerfilView(DetailView):
    model = Perfil
    template_name = 'privado/perfil/index.html'

@method_decorator(decoradores, name="dispatch")
class Lista(FormView):
    template_name = "privado/todo/todo.html"
    form_class = ListaForm

    def get(self, request, pk, *args, **kwargs):
        todo = Tarea.objects.filter(evento=pk)
        print todo
        ctx = {"tareas":todo, 'form':self.form_class}
        return render(request,self.template_name, ctx)

    def post(self, request, pk, *args, **kwargs):
        todo = Tarea.objects.filter(evento=pk)
        ctx = {"tareas": todo, 'form': self.form_class}
        form = ListaForm(request.POST)
        if  form.is_valid():
            tarea = form.save(commit=False)
            tarea.evento_id=pk
            tarea.save()
        return render(request, self.template_name, ctx)

@method_decorator(decoradores, name="dispatch")
class ListaChange(FormView):
    template_name = "privado/todo/todo.html"
    form_class = ListaForm

    def get(self, request, pk, *args, **kwargs):
        todo = Tarea.objects.get(pk=pk)
        if todo.hecho:
            todo.hecho = False
        else:
            todo.hecho = True
        todo.save()
        return HttpResponseRedirect(request.META.get('HTTP_REFERER'))

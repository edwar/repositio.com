#!/usr/bin/env python
# -*- coding: utf-8 -*-
import hashlib
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger
from django.http import HttpResponseRedirect
from django.shortcuts import render, get_object_or_404, redirect
from django.utils.crypto import random
from django.views import View
from django.views.generic import FormView, TemplateView
from django.conf import settings
from django.contrib.auth.hashers import make_password
from django.core import mail
from .forms import *
from apps.administrador.models import *
from django.core.mail import send_mail
from django.contrib import messages
import string
import random
from django.db.models import Q
from apps.administrador.models import *
import arrow

from ProyectoDeGrado import settings

def logout_required(view):
    def f(request, *args, **kwargs):
        if request.user.is_anonymous():
            return view(request, *args, **kwargs)
        return HttpResponseRedirect(settings.LOGIN_REDIRECT_URL)
    return f

class RegistroView(View):
    template_name = 'publico/registro/activacion_form.html'

    def get(self, request, *args, **kwargs):
        return render(request, self.template_name)

    def post(self, request, *args, **kwargs):

        mail.send_mail('subject', 'message', 'sarath4coding@gmail.com', ['sarath4coding@gmail.com'])
        return request(request, self.template_name)


class CorreoView(FormView):
    form_class = PerfilForm
    template_name = 'publico/registro/correo.html'

    def get(self, request, *args, **kwargs):
        dominios = Dominio.objects.filter(activo=True)
        ctx = {"dominios":dominios}
        return render(request, self.template_name, ctx)

    def post(self, request, *args, **kwargs):
        data={}
        data['username']=request.POST['usuario']
        data['dominio']=request.POST['dominio']
        if data['username'] != "" or data['dominio'] != "":
            usernamesalt = request.POST['usuario']
            salt = hashlib.sha1(str(random.random())).hexdigest()[:5]
            data['activation_key']= hashlib.sha1(salt+usernamesalt).hexdigest()
            data['email_subject'] = "Active su cuenta"
            usuario = UserForm()
            usuario.save(data)
            formulario = PerfilForm()
            formulario.enviar(data)
            formulario.save(data)
            ctx = {'msg':'Se ha enviado un correo con el link de activación','tipo':'success','icono':'glyphicon-ok','titulo':'Exito'}
        else:
            ctx = {'msg': 'El usuario y la contraseña son obligatorios', 'tipo': 'danger', 'icono': 'glyphicon-warning-sign', 'titulo': 'Error'}
        return render(request, self.template_name,ctx)


class ActivacionView(FormView):
    form_class = PerfilForm
    template_name = 'publico/registro/activacion_form.html'

    def get(self, request, *args, **kwargs):
        usuario = get_object_or_404(User, username= kwargs['username'])
        usuario = UserForm(instance=usuario)
        perfil = get_object_or_404(Perfil, activation_key = kwargs['key'])
        perfil = PerfilForm(instance=perfil)
        return render(request, self.template_name,{'usuario': usuario,'perfil':perfil})

    def post(self, request, *args, **kwargs):
        usuario = get_object_or_404(User, username=kwargs['username'])
        usuario.password = make_password(request.POST['password'])
        usuario.first_name = request.POST['first_name']
        usuario.last_name = request.POST['last_name']
        usuario.save()
        perfil = get_object_or_404(Perfil, activation_key=kwargs['key'])
        perfil.avatar = request.FILES['avatar']
        sede = Sede.objects.get(pk=request.POST['sede'])
        perfil.sede = sede
        perfil.codigo = request.POST['codigo']
        perfil.carrera.add(request.POST['carrera'])
        perfil.save()
        return HttpResponseRedirect("/")


class ClaveView(View):
    template_name = 'publico/registro/restaurar_form.html'

    def id_generator(self):
        chars = string.ascii_uppercase + string.digits
        return str(''.join(random.choice(chars) for _ in range(6)))

    def restaurar(self, data):
        usuario = User.objects.get(username = data['username'])
        data['clave'] = self.id_generator()
        data['username'] = usuario.username
        data['mail'] = usuario.email
        usuario.password = make_password(data['clave'])
        usuario.save()
        self.enviar(data)


    def enviar(self, data):
        message = "Para ingregar </br><b>Usuario: </b> "+data['username']+"</br><b>Usuario: </b>"+data['clave']
        send_mail("Restaurar clave", message, 'Repositio <repositio@gmail.com>',
                  [data['mail']], fail_silently=False)

    def get(self, request, *args, **kwargs):
        return render(request, self.template_name)

    def post(self, request, *args, **kwargs):
        data = {}
        data['username'] = request.POST['usuario']
        print data['username']
        self.restaurar(data)
        message = ("Te hemos enviado un correo con una contraseña autogenerada.")
        messages.success(request, message)
        return redirect('/')

class ActualizarClaveView(View):
    template_name='publico/registro/actualizar_clave_form.html'

    def get(self, request, *args, **kwargs):
        return render(request, self.template_name)

    def post(self, request, *args, **kwargs):
        if request.POST['nueva'] == request.POST['confirmacion']:
            usuario = User.objects.get(pk=request.user.pk)
            if usuario.check_password(request.POST['anterior'].strip()):
                usuario.password = make_password(request.POST['nueva'])
                usuario.save()
                message = ("Se a actualizado la contraseña con exito. Por seguridad inicie sesión nuevamente")
                messages.success(request, message)
                return redirect('/')
            else:
                return render(request, self.template_name,{'msg':'La contraseña actual es incorrecta, intenta nuevamente','tipo':'danger','titulo':'Error','icono':'glyphicon-exclamation-sign'})
        else:
            return render(request, self.template_name,{'msg':'Error al confirmar la contraseña, por favor intentelo nuevamente','tipo':'danger','titulo':'Error','icono':'glyphicon-exclamation-sign'})

class InicioView(View):
    template_name = 'publico/inicio/index.html'

    def get(self, request, *args, **kwargs):
        ctx={"pdfs":"","textos":"","audios":"","videos":""}
        return render(request, self.template_name,ctx)

class SearchView(View):
    template_name = 'publico/inicio/index.html'

    def get(self, *args, **kwargs):
        if 'q' in self.request.GET and self.request.GET['q'] or 'c' in self.request.GET and self.request.GET['c']:
            pdfs = Pdf.objects.all().filter(Q(nombre__iexact=self.request.GET['q']) | Q(clase_id=self.request.GET.get('c')))
            textos = Texto.objects.all().filter(Q(nombre__iexact=self.request.GET['q']) | Q(clase_id=self.request.GET.get('c')))
            audios = Audio.objects.all().filter(Q(descripcion__iexact=self.request.GET['q']))
            videos = Video.objects.all().filter(Q(descripcion__iexact=self.request.GET['q']))
            ctx = {"pdfs":pdfs,"textos":textos,"audios":audios,"videos":videos}
            print ctx
            return render(self.request, self.template_name,ctx)
        else:
            pdfs = Pdf.objects.all()
            textos = Texto.objects.all()
            audios = Audio.objects.all()
            videos = Video.objects.all()
            ctx = {"pdfs": pdfs, "textos": textos, "audios": audios, "videos": videos}
            return render(self.request, self.template_name,ctx)

class LoMasVistoPdfView(View):
    template_name = 'publico/visto/pdf.html'

    def get(self, *args, **kwargs):
        vistopdf = PdfVisto.objects.all().order_by('-contador')[:10]
        cont = []
        total = 0
        for dato in vistopdf:
            total += dato.contador
            if self.request.user.is_authenticated:
                pdf=Pdf.objects.get(pk=dato.pdf_id)
            else:
                pdf=Pdf.objects.get(pk=dato.pdf_id, tipo=2)
            pdf.contador = dato.contador
            cont.append(pdf)
        ctx = {"pdfs":cont, "total":total}
        print(ctx)
        return render(self.request, self.template_name, ctx)

class LoMasVistoTextoView(View):
    template_name = 'publico/visto/texto.html'

    def get(self, *args, **kwargs):
        vistotexto = TextoVisto.objects.all().order_by('-contador')[:10]
        cont = []
        total = 0
        for dato in vistotexto:
            total += dato.contador
            texto = Texto.objects.get(pk=dato.texto_id)
            texto.contador = dato.contador
            cont.append(texto)
        ctx = {"textos":cont, "total":total}
        return render(self.request, self.template_name, ctx)

class LoMasVistoAudioView(View):
    template_name = 'publico/visto/audio.html'

    def get(self, *args, **kwargs):
        vistoaudio = AudioVisto.objects.all().order_by('-contador')[:10]
        cont = []
        total = 0
        for dato in vistoaudio:
            total += dato.contador
            audio = Audio.objects.get(pk=dato.audio_id)
            audio.contador = dato.contador
            cont.append(audio)
        ctx = {"audios":cont, "total":total}
        print(ctx)
        return render(self.request, self.template_name, ctx)

class LoMasVistoVideoView(View):
    template_name = 'publico/visto/video.html'

    def get(self, *args, **kwargs):
        vistovideo = VideoVisto.objects.all().order_by('-contador')[:10]
        cont = []
        total = 0
        for dato in vistovideo:
            total += dato.contador
            video = Video.objects.get(pk=dato.video_id)
            video.contador = dato.contador
            cont.append(video)
        ctx = {"videos":cont, "total":total}
        print(ctx)
        return render(self.request, self.template_name, ctx)

class EstadisticasView(TemplateView):
    template_name = 'publico/estadisticas/index.html'

    def get_context_data(self, **kwargs):
        context = super(EstadisticasView, self).get_context_data(**kwargs)
        context['pdf'] = self.pdf()
        context['texto'] = self.texto()
        context['audio'] = self.audio()
        context['tipos'] = self.tipos()
        context['clases'] = self.clases()
        context['claves'] = self.claves()
        context['tematicas'] = self.tematicas()
        return context

    def pdf(self):
        final_data = []

        date = arrow.now()
        date = date.replace(days=+1)
        for day in xrange(0, 31):
            date = date.replace(days=-1)
            print date
            count = PdfVisualizacion.objects.filter(fecha=date.floor('day').datetime.date()).count()
            final_data.append(count)

        return final_data

    def texto(self):
        final_data = []

        date = arrow.now()
        date = date.replace(days=+1)
        for day in xrange(0, 31):
            date = date.replace(days=-1)
            print date
            count = TextoVisualizacion.objects.filter(fecha=date.floor('day').datetime.date()).count()
            final_data.append(count)

        return final_data

    def audio(self):
        final_data = []

        date = arrow.now()
        date = date.replace(days=+1)
        for day in xrange(0, 31):
            date = date.replace(days=-1)
            print date
            count = AudioVisualizacion.objects.filter(fecha=date.floor('day').datetime.date()).count()
            final_data.append(count)

        return final_data

    def tipos(self):
        final_data = []
        tipos = Tipo.objects.filter(activo=True)
        for tipo in tipos:
            final_data.append(
                {"pdf":Pdf.objects.filter(tipo=tipo).count(),
                 "texto":Texto.objects.filter(tipo=tipo).count(),
                 "audio":Audio.objects.filter(tipo=tipo).count(),
                 "video":Video.objects.filter(tipo=tipo).count(),
                 "tipo":tipo})

        return final_data

    def clases(self):
        final_data = []
        clases = Clase.objects.filter(activo=True)
        for clase in clases:
            final_data.append(
                {"pdf": Pdf.objects.filter(clase=clase).count(),
                 "texto": Texto.objects.filter(clase=clase).count(),
                 "audio": Audio.objects.filter(clase=clase).count(),
                 "video": Video.objects.filter(clase=clase).count(),
                 "clase": clase})
        return final_data

    def claves(self):
        final_data = []
        claves = Clave.objects.filter(activo=True)
        for clave in claves:
            final_data.append(
                {"pdf": Pdf.objects.filter(clave=clave).count(),
                 "texto": Texto.objects.filter(clave=clave).count(),
                 "audio": Audio.objects.filter(clave=clave).count(),
                 "video": Video.objects.filter(clave=clave).count(),
                 "clave": clave})
        return final_data

    def tematicas(self):
        final_data = []
        tematicas = Tematica.objects.filter(activo=True)
        for tematica in tematicas:
            final_data.append(
                {"pdf": Pdf.objects.filter(tematica=tematica).count(),
                 "texto": Texto.objects.filter(tematica=tematica).count(),
                 "audio": Audio.objects.filter(tematica=tematica).count(),
                 "video": Video.objects.filter(tematica=tematica).count(),
                 "tematica": tematica})

        return final_data

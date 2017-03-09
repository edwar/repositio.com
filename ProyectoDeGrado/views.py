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
from django.db import IntegrityError
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

class Error404View(TemplateView):
    template_name = "publico/404/index.html"

class Error500View(TemplateView):
    template_name = "publico/500/index.html"

class CorreoView(FormView):
    form_class = PerfilForm
    template_name = 'publico/registro/correo.html'

    def get(self, request, *args, **kwargs):
        dominios = Dominio.objects.filter(activo=True)
        ctx = {"dominios":dominios}
        return render(request, self.template_name, ctx)

    def post(self, request, *args, **kwargs):
        dominios = Dominio.objects.filter(activo=True)
        try:
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
                ctx = {'msg':'Se ha enviado un correo con el link de activación','tipo':'success','icono':'glyphicon-ok','titulo':'Exito','dominios':dominios}
            else:
                ctx = {'msg': 'El usuario y el dominio son obligatorios', 'tipo': 'danger', 'icono': 'glyphicon-warning-sign', 'titulo': 'Error','dominios':dominios}
            return render(request, self.template_name,ctx)
        except IntegrityError as e:
            ctx = {'msg': 'Error en la integridad de los datos.', 'tipo': 'warning', 'icono': 'glyphicon-warning-sign', 'titulo': 'Advertencia','dominios':dominios}
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
        from django.core.mail import EmailMultiAlternatives
        subject, from_email, to = 'Restaurar clave', 'Repositio <repositio@gmail.com>', data['mail']
        message_text = "..."
        message_html = "Para ingregar debes copiar y pegar estos datos en </br>el formulario de login y actualizar tu clave:</br><b>Usuario: </b> "+data['username']+"</br><b>Clave: </b>"+data['clave']
        msg = EmailMultiAlternatives(subject, message_text, from_email, [to])
        msg.attach_alternative(message_html, "text/html")
        msg.send()

    def get(self, request, *args, **kwargs):
        return render(request, self.template_name)

    def post(self, request, *args, **kwargs):
        data = {}
        try:
            data['username'] = request.POST['usuario']
            self.restaurar(data)
            return render(request, self.template_name,{'msg':'Te hemos enviado un correo con una contraseña autogenerada al correo'+ str(data['mail']),'tipo':'info','titulo':'Informacion','icono':'glyphicon-info-sign'})
        except Exception as e:
            return render(request, self.template_name,{'msg':'Ha ocurrido algo inesperado.'+str(e),'tipo':'danger','titulo':'Error','icono':'glyphicon-exclamation-sign'})
        

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
        if 'q' in self.request.GET and self.request.GET['q'] or 'c' in self.request.GET and self.request.GET['c'] or not self.request.user.is_authenticated():
            pdfs = Pdf.objects.all().filter(Q(nombre__icontains=str(self.request.GET['q'])) | Q(clase_id=self.request.GET.get('c')),tipo=2)
            textos = Texto.objects.all().filter(Q(nombre__icontains=str(self.request.GET['q'])) | Q(clase_id=self.request.GET.get('c')),tipo=2)
            audios = Audio.objects.all().filter(Q(titulo__icontains=str(self.request.GET['q'])) | Q(clase_id=self.request.GET.get('c')),tipo=2)
            videos = Video.objects.all().filter(Q(titulo__icontains=str(self.request.GET['q'])) | Q(clase_id=self.request.GET.get('c')),tipo=2)
            ctx = {"pdfs":pdfs,"textos":textos,"audios":audios,"videos":videos}
            print ctx
            return render(self.request, self.template_name,ctx)
        elif 'q' in self.request.GET and self.request.GET['q'] or 'c' in self.request.GET and self.request.GET['c']:
            pdfs = Pdf.objects.all().filter(Q(nombre__icontains=str(self.request.GET['q'])) | Q(clase_id=self.request.GET.get('c')))
            textos = Texto.objects.all().filter(Q(nombre__icontains=str(self.request.GET['q'])) | Q(clase_id=self.request.GET.get('c')))
            audios = Audio.objects.all().filter(Q(titulo__icontains=str(self.request.GET['q'])) | Q(clase_id=self.request.GET.get('c')))
            videos = Video.objects.all().filter(Q(titulo__icontains=str(self.request.GET['q'])) | Q(clase_id=self.request.GET.get('c')))
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
            if self.request.user.is_authenticated:
                pdf=Pdf.objects.get(pk=dato.pdf_id)
                total += dato.contador
                pdf.contador = dato.contador
                cont.append(pdf)
            else:
                try:
                    pdf=Pdf.objects.get(pk=dato.pdf_id, tipo__id=2)
                    total += dato.contador
                    pdf.contador = dato.contador
                    cont.append(pdf)
                except Exception as e:
                    msg=e
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
            if self.request.user.is_authenticated:
                texto=Texto.objects.get(pk=dato.texto_id)
                total += dato.contador
                texto.contador = dato.contador
                cont.append(texto)
            else:
                try:
                    texto=Texto.objects.get(pk=dato.texto_id, tipo__id=2)
                    total += dato.contador
                    texto.contador = dato.contador
                    cont.append(texto)
                except Exception as e:
                    msg=e
        ctx = {"textos":cont, "total":total}
        return render(self.request, self.template_name, ctx)

class LoMasVistoAudioView(View):
    template_name = 'publico/visto/audio.html'

    def get(self, *args, **kwargs):
        vistoaudio = AudioVisto.objects.all().order_by('-contador')[:10]
        cont = []
        total = 0
        for dato in vistoaudio:

            if self.request.user.is_authenticated:
                audio=Audio.objects.get(pk=dato.audio_id)
                total += dato.contador
                audio.contador = dato.contador
                cont.append(audio)
            else:
                try:
                    audio=Audio.objects.get(pk=dato.audio_id, tipo__id=2)
                    total += dato.contador
                    audio.contador = dato.contador
                    cont.append(audio)
                except Exception as e:
                    msg=e
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

            if self.request.user.is_authenticated:
                video=Video.objects.get(pk=dato.video_id)
                total += dato.contador
                video.contador = dato.contador
                cont.append(video)
            else:
                try:
                    video=Video.objects.get(pk=dato.video_id, tipo__id=2)
                    total += dato.contador
                    video.contador = dato.contador
                    cont.append(video)
                except Exception as e:
                    msg=e
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

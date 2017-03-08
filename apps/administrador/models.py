#!/usr/bin/env python
# -*- coding: utf-8 -*-
from __future__ import unicode_literals
import datetime
from django.contrib.auth.models import User
from django.db import models
from .validaciones import *

def texto(self, filename):
    url = '%s/libros/%s' % (self.propietario, filename)
    return url


def imagen(self, filename):
    url = '%s/imagenes/%s' % (self.contenedor.propietario, filename)
    return url


def audio(self, filename):
    url = '%s/audios/%s' % (self.propietario, filename)
    return url


def video(self, filename):
    url = '%s/videos/%s' % (self.propietario, filename)
    return url


def pdf(self, filename):
    url = '%s/pdf/%s' % (self.propietario, filename)
    return url

def hv(self, filename):
    url = '%s/%s/hv/%s' % (self.nombre, self.id, filename)
    return url

def cronograma(self, filename):
    url = '%s/%s/cronograma/%s' % (self.nombre, self.id, filename)
    return url

def avatar(self, filename):
    url = '%s/avatar/%s' % (self.usuario, filename)
    return url

def foto(self, filename):
    url = 'orador/foto/%s' % (filename)
    return url


# Create your models here.
class Facultad(models.Model):
    nombre = models.CharField('Facultad', max_length=50, unique=True, error_messages={'unique':"Ya existe una facultad con este nombre",})
    activo = models.BooleanField(default=True)
    fecha = models.DateTimeField(auto_now_add=True)
    actualizado = models.DateTimeField(auto_now=True)

    def __str__(self):
        return self.nombre.encode('utf-8', errors='strict')

    class Meta:
        ordering = ('nombre',)
        verbose_name = "Facultad"

class TipoEvento(models.Model):
    nombre = models.CharField('Tipo de documento', max_length=30, unique=True, error_messages={'unique':"Ya existe un tipo con este nombre",})
    activo = models.BooleanField(default=True)
    fecha = models.DateTimeField(auto_now_add=True)
    actualizado = models.DateTimeField(auto_now=True)

    def __str__(self):
        return self.nombre.encode('utf-8', errors='strict')

    class Meta:
        ordering = ('nombre',)
        verbose_name = "Tipo de evento"
        verbose_name_plural = "Tipos de eventos"

class Evento(models.Model):
    nombre = models.CharField('Evento', max_length=45, unique=True, error_messages={'unique':"Ya existe un evento con este nombre",})
    encargado = models.ForeignKey(User, on_delete=models.CASCADE)
    colaboradores = models.ManyToManyField(User, related_name='Colaboradores_evento')
    cronograma = models.FileField(upload_to=cronograma)
    tipo = models.ForeignKey(TipoEvento, on_delete=models.CASCADE)
    inicio = models.DateField()
    fin = models.DateField()
    activo = models.BooleanField(default=False)
    fecha = models.DateTimeField(auto_now_add=True)
    actualizado = models.DateTimeField(auto_now=True)

    def __str__(self):
        return self.nombre.encode('utf-8', errors='strict')

    class Meta:
        ordering = ('nombre',)
        verbose_name = "Evento"

class Carrera(models.Model):
    facultad = models.ForeignKey(Facultad, on_delete=models.CASCADE, )
    nombre = models.CharField('Carrera', max_length=25, unique=True, error_messages={'unique':"Ya existe una carrera con este nombre",})
    activo = models.BooleanField(default=True)
    fecha = models.DateTimeField(auto_now_add=True)
    actualizado = models.DateTimeField(auto_now=True)

    def __str__(self):
        return self.nombre.encode('utf-8', errors='strict')

    class Meta:
        ordering = ('nombre',)
        verbose_name = "Carrera"



class Sede(models.Model):
    nombre = models.CharField('Unidad administrativa', max_length=45, unique=True, error_messages={'unique':"Ya existe una sede con este nombre",})
    pais = models.CharField('Pais', max_length=35)
    ciudad = models.CharField('Ciudad', max_length=45)
    direccion = models.CharField('Direccion', max_length=45)
    activo = models.BooleanField(default=True)
    fecha = models.DateTimeField(auto_now_add=True)
    actualizado = models.DateTimeField(auto_now=True)

    def __str__(self):
        return self.nombre.encode('utf-8', errors='strict')

    class Meta:
        ordering = ('nombre',)
        verbose_name = "Sede"

class Perfil(models.Model):
    usuario = models.OneToOneField(User, on_delete=models.CASCADE, unique=True, error_messages={'unique':"Ya existe un usuario con este nombre",}, null=True, blank=True)
    avatar = models.FileField(upload_to=avatar, null=True, blank=True)
    sede = models.ForeignKey(Sede, on_delete=models.CASCADE, null=True, blank=True)
    codigo = models.CharField('Numero de codigo', max_length=15, null=True, blank=True)
    carrera = models.ManyToManyField(Carrera, blank=True)
    activation_key = models.CharField(max_length=40)
    key_expires = models.DateTimeField()
    activo = models.BooleanField(default=True)
    fecha = models.DateTimeField(auto_now_add=True)
    actualizado = models.DateTimeField(auto_now=True)

    def __str__(self):
        return self.usuario.username.encode('utf-8', errors='strict')

    class Meta:
        ordering = ('usuario',)
        verbose_name = "Perfil"
        verbose_name_plural = "Perfiles"



class Tipo(models.Model):
    nombre = models.CharField('Tipo de documento', max_length=30, unique=True, error_messages={'unique':"Ya existe un tipo con este nombre",})
    activo = models.BooleanField(default=True)
    fecha = models.DateTimeField(auto_now_add=True)
    actualizado = models.DateTimeField(auto_now=True)

    def __str__(self):
        return self.nombre.encode('utf-8', errors='strict')

    class Meta:
        ordering = ('nombre',)
        verbose_name = "Tipo"


class Clase(models.Model):
    nombre = models.CharField('Clase de documento', max_length=30, unique=True, error_messages={'unique':"Ya existe una clase con este nombre",})
    activo = models.BooleanField(default=True)
    fecha = models.DateTimeField(auto_now_add=True)
    actualizado = models.DateTimeField(auto_now=True)

    def __str__(self):
        return self.nombre.encode('utf-8', errors='strict')

    class Meta:
        ordering = ('nombre',)
        verbose_name = "Clase"



class Clave(models.Model):
    nombre = models.CharField('Palabra clave', max_length=30, unique=True, error_messages={'unique':"Ya existe una clave con este nombre",})
    activo = models.BooleanField(default=True)
    fecha = models.DateTimeField(auto_now_add=True)
    actualizado = models.DateTimeField(auto_now=True)

    def __str__(self):
        return self.nombre.encode('utf-8', errors='strict')

    class Meta:
        ordering = ('nombre',)
        verbose_name = "Clave"
        verbose_name_plural = "Claves"


class Tematica(models.Model):
    nombre = models.CharField('Tematica', max_length=30, unique=True, error_messages={'unique':"Ya existe una tematica con este nombre",})
    activo = models.BooleanField(default=True)
    fecha = models.DateTimeField(auto_now_add=True)
    actualizado = models.DateTimeField(auto_now=True)

    def __str__(self):
        return self.nombre.encode('utf-8', errors='strict')

    class Meta:
        ordering = ('nombre',)
        verbose_name = "Tematica"
        verbose_name_plural = "Tematicas"

class Texto(models.Model):
    nombre = models.CharField('Texto', max_length=45, unique=True, error_messages={'unique':"Ya existe un texto con este nombre",}, help_text="Este campo hace referencia al nombre del texto que se esta creando.")
    propietario = models.ForeignKey(User, on_delete=models.CASCADE, help_text="Este campo hac referencia al dueño o propietario del texto.")
    colaborador = models.ManyToManyField(Perfil, related_name='Colaborador', blank=True, help_text="Esta lista de selección multiple le permitira referenciar a todos los colaboradores del documento.")
    carrera = models.ForeignKey(Carrera, on_delete=models.CASCADE, help_text="Esta lista de selección le permitira relacionar la carrera de enfoque del documento.")
    texto = models.TextField('Resumen del documento', help_text="Es esta parte del formulario puede escribir el contenido del texto a crear.")
    evento = models.ForeignKey(Evento, on_delete=models.CASCADE, null=True, blank=True, help_text="Esta lista de selección hace referencia al evento que pertenece el documento si es que aplica.")
    tipo = models.ForeignKey(Tipo, on_delete=models.CASCADE, help_text="Esta lista de selección le permite tipoficar el documento.")
    clase = models.ForeignKey(Clase, on_delete=models.CASCADE, help_text="Esta lista de selección le permite clasificar el documento.")
    clave = models.ManyToManyField(Clave, help_text="Esta lista de selección multiple le permite enriqueser la referenciación del documento.")
    tematica = models.ManyToManyField(Tematica, help_text="Esta lista de selección multiple le permite asignar multiples tematicas referentes al testo.")
    activo = models.BooleanField(default=True)
    eliminado = models.BooleanField(default=False)
    fecha = models.DateTimeField(auto_now_add=True)
    actualizado = models.DateTimeField(auto_now=True)

    def __str__(self):
        return self.propietario.username.encode('utf-8', errors='strict')

    class Meta:
        ordering = ('fecha',)
        verbose_name = "Texto"
        verbose_name_plural = "Textos"

    def save(self, *args, **kwargs):
        if self.activo:
            self.activo = False
        else:
            self.activo = True
        super(Texto, self).save(*args, **kwargs)

class Imagen(models.Model):
    titulo = models.CharField(max_length=50, help_text="Este campo hace referencia al contendio.")
    propietario = models.ForeignKey(User, on_delete=models.CASCADE, help_text="Esta lista de opciones le permite referenciar un suaurio propietario de la imagen.")
    autor = models.ManyToManyField(User, related_name='Autor_imagen', blank=True, help_text="Esta lista de opcion multiple le permite relacionar multiples colaboradores a la imagen.")
    descripcion = models.TextField(help_text="Este campo le permite agregar una pequeña descripción a la imagen que se esta cargando.")
    carrera = models.ForeignKey(Carrera, on_delete=models.CASCADE, help_text="Esta lista de opciones le permite relacionar las carreras a las cuales ")
    evento = models.ForeignKey(Evento, on_delete=models.CASCADE, null=True, blank=True, help_text="Esta lista de selección hace referencia al evento que pertenece el documento si es que aplica.")
    tipo = models.ForeignKey(Tipo, on_delete=models.CASCADE,help_text="Esta lista de selección le permite tipoficar el documento.")
    clase = models.ForeignKey(Clase, on_delete=models.CASCADE,help_text="Esta lista de selección le permite clasificar el documento.")
    clave = models.ManyToManyField(Clave,help_text="Esta lista de selección multiple le permite enriqueser la referenciación del documento.")
    tematica = models.ManyToManyField(Tematica,help_text="Esta lista de selección multiple le permite asignar multiples tematicas referentes al testo.")
    activo = models.BooleanField(default=True)
    eliminado = models.BooleanField(default=False)
    fecha = models.DateTimeField(auto_now_add=True)
    actualizado = models.DateTimeField(auto_now=True)

    def __str__(self):
        return self.titulo.encode('utf-8', errors='strict')

    class Meta:
        ordering = ('fecha',)
        verbose_name = "Imagen"
        verbose_name_plural = "Imagenes"

    def save(self, *args, **kwargs):
        if self.activo:
            self.activo = False
        else:
            self.activo = True
        super(Imagen, self).save(*args, **kwargs)

class Foto(models.Model):
    contenedor = models.ForeignKey(Imagen, on_delete=models.CASCADE)
    ruta = models.ImageField(upload_to=imagen)

    
        


class Audio(models.Model):
    titulo = models.CharField(max_length=50, help_text="Este campo hace referencia al contendio.")
    propietario = models.ForeignKey(User, on_delete=models.CASCADE, help_text="Este campo hac referencia al dueño o propietario del texto.")
    autor = models.ManyToManyField(User, related_name='Actor_audio', blank=True, help_text="Esta lista de selección multiple le permitira referenciar a todos los colaboradores del documento.")
    descripcion = models.TextField('Descripcion', help_text="Este campo hace referencia a una pequeña descripción corta de audio que se esta cargando en el sistema.")
    ruta = models.FileField(upload_to=audio, help_text="Este campo permite adjuntar un archivo el cual se cargara en el sistema.")
    evento = models.ForeignKey(Evento, on_delete=models.CASCADE, null=True, blank=True, help_text="Esta lista de selección hace referencia al evento que pertenece el documento si es que aplica.")
    carrera = models.ForeignKey(Carrera, on_delete=models.CASCADE, help_text="Esta lista de opcines le permite asignar una carrera de enfoque al audio.")
    tipo = models.ForeignKey(Tipo, on_delete=models.CASCADE, help_text="Esta lista le permite tipificar el audio que se esta cargando.")
    clase = models.ForeignKey(Clase, on_delete=models.CASCADE, help_text="Esta lista le permite clasificar el audio que se esta cargando.")
    clave = models.ManyToManyField(Clave, help_text="Esta lista de opcion multiple le permite enriqueser el audio que se esta cargando.")
    tematica = models.ManyToManyField(Tematica, help_text="Esta lista de opcion multiple le permite asignarle diversas tematicas al audio que se esta cargando.")
    activo = models.BooleanField(default=True)
    eliminado = models.BooleanField(default=False)
    fecha = models.DateTimeField(auto_now_add=True)
    actualizado = models.DateTimeField(auto_now=True)

    def __str__(self):
        return self.propietario.username.encode('utf-8', errors='strict')

    class Meta:
        ordering = ('fecha',)
        verbose_name = "Audio"
        verbose_name_plural = "Audios"

    def save(self, *args, **kwargs):
        if self.activo:
            self.activo = False
        else:
            self.activo = True
        super(Audio, self).save(*args, **kwargs)

class Pdf(models.Model):
    nombre = models.CharField(max_length=45, unique=True, help_text="Este campo hace referencia al nombre que identific el documento.")
    propietario = models.ForeignKey(User, on_delete=models.CASCADE, help_text="Esta lista de selección hace referencia al propietario o dueño del archivo a crear.")
    autor = models.ManyToManyField(Perfil, related_name='Actor_pdf', blank=True, help_text="Esta lista de selección hace referencia a los colaboradores del documento pero que no son el propietario directo.")
    descripcion = models.TextField('Descripcion', help_text="Este campo hace referencia a un texto descriptivo que realice una pequeña introducción al documento.")
    ruta = models.FileField(upload_to=pdf, validators=[validate_even], help_text="Este campo permite seleccionar un archivo pdf dentro de nuestro ordenador.")
    evento = models.ForeignKey(Evento, on_delete=models.CASCADE, null=True, blank=True, help_text="Esta lista de selección hace referencia al evento que pertenece el documento si es que aplica.")
    carrera = models.ForeignKey(Carrera, on_delete=models.CASCADE, help_text="Esta lista de seleccion hace referencia a la carrera de enfoque que tiene el documento que se va a crear.")
    descargable = models.BooleanField(default=False, help_text="Este boton seleccionable le permite al usuario definir si el documento cargado puede ser descargado una vez sea publicado.")
    tipo = models.ForeignKey(Tipo, on_delete=models.CASCADE, help_text="Esta lista de selección le permite tipoficar el documento.")
    clase = models.ForeignKey(Clase, on_delete=models.CASCADE, help_text="Esta lista de selección le permite clasificar el documento.")
    clave = models.ManyToManyField(Clave, help_text="Esta lista de selección multiple le permite enriqueser la referenciación del documento.")
    tematica = models.ManyToManyField(Tematica, help_text="Esta lista de selección multiple le permite asignar multiples tematicas referentes al testo.")
    activo = models.BooleanField(default=True)
    eliminado = models.BooleanField(default=False)
    fecha = models.DateTimeField(auto_now_add=True)
    actualizado = models.DateTimeField(auto_now=True)

    def name(self):
        ruta = self.ruta.name
        nombre = ruta.split("/")
        indice= len(nombre)
        return nombre[indice-1]

    def __str__(self):
        return self.nombre.encode('utf-8', errors='strict')

    class Meta:
        ordering = ('fecha',)
        verbose_name = 'Pdf'
        verbose_name_plural = "Pdf's"

    def save(self, *args, **kwargs):
        if self.activo:
            self.activo = False
        else:
            self.activo = True
        super(Pdf, self).save(*args, **kwargs)

class Video(models.Model):
    titulo = models.CharField(max_length=50, help_text="Este campo hace referencia al contendio.")
    propietario = models.ForeignKey(User, on_delete=models.CASCADE, help_text="Esta lista de selección hace referencia a propietario dueño del video.")
    autor = models.ManyToManyField(Perfil, related_name='Actor_video', blank=True, help_text="Esta lista de seleccion multiple hace referencia a los colaboradores que tuvierón participación el el video.")
    descripcion = models.TextField('Descripcion', help_text="Este campo hace referencia a una breve descripción del contenido del video.")
    ruta = models.FileField(upload_to=video, help_text="En este campo puede cargar el video que se subira a la plataforma.")
    evento = models.ForeignKey(Evento, on_delete=models.CASCADE, null=True, blank=True, help_text="Esta lista de selección hace referencia al evento que pertenece el documento si es que aplica.")
    carrera = models.ForeignKey(Carrera, on_delete=models.CASCADE, help_text="Esta lista de opciones le permite darle una carrera enfoque al video.")
    tipo = models.ForeignKey(Tipo, on_delete=models.CASCADE, help_text="Esta lista de selección le permite tipificar el video,")
    clase = models.ForeignKey(Clase, on_delete=models.CASCADE, help_text="Esta lista de opciones le permite clasificar el video.")
    clave = models.ManyToManyField(Clave, help_text="Esta lista de selección multiple le permitia enriqueser los metadatos del video.")
    tematica = models.ManyToManyField(Tematica, help_text="Esta lista de selección multiple le permite asignar multiples tematicas al video.")
    activo = models.BooleanField(default=True)
    eliminado = models.BooleanField(default=False)
    fecha = models.DateTimeField(auto_now_add=True)
    actualizado = models.DateTimeField(auto_now=True)

    def __str__(self):
        return self.propietario.username.encode('utf-8', errors='strict')

    class Meta:
        ordering = ('fecha',)
        verbose_name = "Video"
        verbose_name_plural = "Videos"

    def save(self, *args, **kwargs):
        if self.activo:
            self.activo = False
        else:
            self.activo = True
        super(Video, self).save(*args, **kwargs)


class Dominio(models.Model):
    nombre = models.CharField(max_length=35, unique=True)
    activo = models.BooleanField(default=False)
    fecha = models.DateTimeField(auto_now_add=True)
    actualizado = models.DateTimeField(auto_now=True)

    def __str__(self):
        return self.nombre.encode('utf-8', errors='strict')

    class Meta:
        ordering = ('fecha',)
        verbose_name = "Dominio"
        verbose_name_plural = "Dominios"

PRIORITY_CHOICES = (

  (1, 'Baja'),

  (2, 'Normal'),

  (3, 'Alta'),

)

class Tarea(models.Model):
    nombre = models.CharField(max_length=50)
    evento = models.ForeignKey(Evento, on_delete=models.CASCADE)
    fecha = models.DateTimeField(default=datetime.datetime.now)
    prioridad = models.IntegerField(choices=PRIORITY_CHOICES, default=2)
    hecho = models.BooleanField(default=False)

    def __str__(self):
        return self.nombre.encode('utf-8', errors='strict')

    class Meta:
        ordering = ['-prioridad', 'nombre']
        verbose_name = "Tarea"
        verbose_name_plural = "Tareas"

class TipoOrador(models.Model):
    nombre = models.CharField('Tipo de orador', max_length=30, unique=True, error_messages={'unique':"Ya existe un tipo con este nombre",})
    activo = models.BooleanField(default=True)
    fecha = models.DateTimeField(auto_now_add=True)
    actualizado = models.DateTimeField(auto_now=True)

    def __str__(self):
        return self.nombre.encode('utf-8', errors='strict')

    class Meta:
        ordering = ('nombre',)
        verbose_name = "Tipo de orador"
        verbose_name_plural = "Tipos de oradores"

class AreaConocimiento(models.Model):
    nombre = models.CharField('Area de conocimiento', max_length=30, unique=True, error_messages={'unique':"Ya existe un tipo con este nombre",})
    activo = models.BooleanField(default=True)
    fecha = models.DateTimeField(auto_now_add=True)
    actualizado = models.DateTimeField(auto_now=True)

    def __str__(self):
        return self.nombre.encode('utf-8', errors='strict')

    class Meta:
        ordering = ('nombre',)
        verbose_name = "Area de conocimiento"
        verbose_name_plural = "Areas de conocimiento"

class Orador(models.Model):
    nombres = models.CharField(max_length=45)
    apellidos = models.CharField(max_length=45)
    documento = models.FileField(upload_to=foto)
    hv = models.FileField(upload_to=hv, validators=[pdf])
    conocimiento = models.ManyToManyField(AreaConocimiento)
    llegada = models.DateField()
    despedida = models.DateField()

    def __str__(self):
        return self.nombres.encode('utf-8', errors='strict')

    class Meta:
        ordering = ('nombres','apellidos')
        verbose_name = "Orador"
        verbose_name_plural = "Oradores"

class PdfVisto(models.Model):
    pdf = models.ForeignKey(Pdf, on_delete=models.CASCADE)
    contador = models.IntegerField()

class TextoVisto(models.Model):
    texto = models.ForeignKey(Texto, on_delete=models.CASCADE)
    contador = models.IntegerField()

class AudioVisto(models.Model):
    audio = models.ForeignKey(Audio, on_delete=models.CASCADE)
    contador = models.IntegerField()

class VideoVisto(models.Model):
    video = models.ForeignKey(Video, on_delete=models.CASCADE)
    contador = models.IntegerField()

class PdfVisualizacion(models.Model):
    fecha = models.DateField(auto_now_add=True)

class TextoVisualizacion(models.Model):
    fecha = models.DateField(auto_now_add=True)

class AudioVisualizacion(models.Model):
    fecha = models.DateField(auto_now_add=True)

class VideoVisualizacion(models.Model):
    fecha = models.DateField(auto_now_add=True)

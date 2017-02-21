from apps.administrador.models import Perfil
from apps.administrador.models import *

def avatar(request):
    try:
        img = None
        user = request.user
        up = Perfil.objects.get(usuario_id=user.pk)
        if up.avatar:
            img = "/%s/"%(up.avatar)
        else:
            img = "/static/administrador/img/user.png"
    except:
        img = "/static/administrador/img/user.png"
    return img

def usuario(request):
    datos = {
        'id': request.user.pk,
        'nombre': request.user,
    }
    return datos

def cantidad_pdf(request):
    pdfs=Pdf.objects.filter(propietario=request.user.pk, activo=True).count()
    return pdfs

def cantidad_texto(request):
    textos=Texto.objects.filter(propietario=request.user.pk, activo=True).count()
    return textos

def cantidad_audio(request):
    audios=Audio.objects.filter(propietario=request.user.pk, activo=True).count()
    return audios

def cantidad_video(request):
    videos=Video.objects.filter(propietario=request.user.pk, activo=True).count()
    return videos

def cantidad_Imagen(request):
    imagenes=Imagen.objects.filter(propietario=request.user.pk, activo=True).count()
    return imagenes

def cantidad_evento(request):
    eventos=Evento.objects.filter(activo=True).count()
    return eventos

def pendientes(request):
    pdfs = Pdf.objects.filter(activo=False, eliminado=False).count()
    textos = Texto.objects.filter(activo=False, eliminado=False).count()
    audios = Audio.objects.filter(activo=False, eliminado=False).count()
    videos = Video.objects.filter(activo=False, eliminado=False).count()
    imagenes = Imagen.objects.filter(activo=False, eliminado=False).count()
    total = int(pdfs)+int(textos)+int(audios)+int(videos)+int(imagenes)
    return total

def miembro_desde(request):
    fecha=None
    if request.user.is_authenticated() == True:
        usuario = User.objects.get(pk = request.user.pk)
        fecha = usuario.date_joined
    return fecha

def clase(request):
    clases = Clase.objects.filter(activo=True)
    return clases

def perfil_id(request):
    if(request.user.is_authenticated):
    	perfil = Perfil.objects.get(usuario = request.user.pk)
    	return perfil
    else:
	return ""

def v_global(request):
    context = {
        'avatar': avatar(request),
        'usuario':usuario(request),
        'pdfs':cantidad_pdf(request),
        'textos':cantidad_texto(request),
        'audios':cantidad_audio(request),
        'videos':cantidad_video(request),
        'imagenes':cantidad_Imagen(request),
        'eventos':cantidad_evento(request),
        'pendientes':pendientes(request),
        'miembro_desde':miembro_desde(request),
        'clases':clase(request),
	'perfil_id':perfil_id(request),
    }
    return context
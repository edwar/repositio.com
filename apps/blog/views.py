from django.shortcuts import render
from django.views.generic import ListView, DetailView
from .models import *

class InicioView(ListView):
    template_name = 'blog/index.html'
    paginate_by = 4
    model = Publicacion

class PublicacionDetailView(DetailView):
    template_name = 'blog/detalle.html'
    model = Publicacion
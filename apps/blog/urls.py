from django.conf.urls import url
from .views import *

urlpatterns = [
    url(r'^$', InicioView.as_view(), name='blog_inicio'),
    url(r'^publicacion/(?P<slug>[-\w]+)/$', PublicacionDetailView.as_view(), name='blog_inicio'),
]
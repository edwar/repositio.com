from __future__ import unicode_literals
from django.contrib.auth.models import User

from django.db import models
from django.template.defaultfilters import slugify

class Publicacion(models.Model):
    titulo = models.CharField(max_length=50)
    contenido =  models.TextField()
    autor = models.ForeignKey(User, on_delete=models.CASCADE, editable=False)
    publicado = models.DateField(auto_now_add=True)
    slug = models.SlugField(editable=False)

    def __str__(self):
        return self.titulo.encode('utf-8', errors='strict')

    class Meta:
        ordering = ('titulo',)
        verbose_name = "Publicacion"
        verbose_name_plural = "Publicaciones"

    def save(self, *args, **kwargs):
        if not self.id:
            self.slug = slugify(self.titulo)
        super(Publicacion, self).save(*args, **kwargs)

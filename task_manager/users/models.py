from django.contrib.auth.models import AbstractUser
from django.db import models
from django.utils.translation import gettext_lazy as _

class User(AbstractUser):
    created_at = models.DateTimeField(auto_now_add=True, verbose_name=_('created at'))
    updated_at = models.DateTimeField(auto_now=True, verbose_name=_('updated at'))

    class Meta:
        verbose_name = _('user')
        verbose_name_plural = _('users')
        ordering = ['username']

    def __str__(self):
        full_name = self.get_full_name()
        return full_name if full_name.strip() else self.username

    @property
    def full_name(self):
        """Property для получения полного имени"""
        return self.get_full_name()
    
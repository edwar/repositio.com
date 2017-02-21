from django.core.exceptions import ValidationError
from django.utils.translation import ugettext_lazy as _
import os
def validate_even(value):
    valid_extensions = ['.pdf']
    ext = os.path.splitext(value.name)[1]
    if not ext.lower() in valid_extensions:
        raise ValidationError(
            _('%(value)s archivo no valido!!!'),
            params={'value': value},
        )

#valid_extensions = ['.pdf', '.doc', '.docx', '.jpg', '.png', '.xlsx', '.xls']
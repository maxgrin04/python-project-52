import rollbar
from django.conf import settings

rollbar.init(**settings.ROLLBAR)

from django.urls import path
from api.views import get_last_release

urlpatterns = [
    path('<str:user>/<str:repo>/', get_last_release),
]

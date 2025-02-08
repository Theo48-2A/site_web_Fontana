from django.urls import path
from .views import cv_detail

urlpatterns = [
    path('', cv_detail, name='cv_detail'),

]

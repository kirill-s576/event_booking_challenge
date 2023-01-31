from django.db import models

# Create your models here.


class Event(models.Model):
    name = models.CharField(max_length=250)


class Booking(models.Model):
    event = models.ForeignKey("Event", on_delete=models.CASCADE)
    time_start = models.DateTimeField(null=False)
    duration = models.IntegerField()


class Hours(models.Model):
    number = models.IntegerField()

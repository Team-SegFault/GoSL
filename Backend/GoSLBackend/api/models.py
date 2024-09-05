from django.db import models

# Create your models here.
class Item(models.Model):
    name = models.CharField(max_length=100)
    description = models.CharField(max_length=200)
    # price = models.DecimalField(max_digits=10, decimal_places=2)
    # stock = models.IntegerField()
    # image = models.ImageField(upload_to='images')

    def __str__(self):
        return self.name
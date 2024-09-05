from django.db import models
    
class VisaType(models.Model):
    visa_type = models.CharField(max_length=100)
    visa_type_description = models.CharField(max_length=200)
    visa_type_duration = models.IntegerField()
    # visa_type_eligibility = models.CharField(max_length=200)

    def __str__(self):
        return self.visa_type
    

class VisaApplication(models.Model):
    id = models.AutoField(primary_key=True)
    form_created = models.DateTimeField(auto_now_add=True)
    name = models.CharField(max_length=100)
    email = models.EmailField()
    phone = models.CharField(max_length=15)
    address = models.CharField(max_length=200)
    passport_number = models.CharField(max_length=20)
    passport_issue_date = models.DateField()
    passport_expiry_date = models.DateField()
    passport_photo = models.ImageField(upload_to='media/images', default='media/images/default.jpg')
    visa_type_reference = models.ForeignKey('VisaType', on_delete=models.CASCADE, related_name='visa_type_reference')
    visa_start_date = models.DateField()

    def __str__(self):
        return f"{self.id} - {self.name}"
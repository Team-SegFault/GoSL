from django.db import models
    
class VisaType(models.Model):
    visa_type = models.CharField(max_length=100)
    visa_type_description = models.CharField(max_length=200)
    visa_type_duration = models.IntegerField()
    # visa_type_eligibility = models.CharField(max_length=200)

    def __str__(self):
        return self.visa_type
    

GENDER_CHOICES = [
    ('Male', 'Male'),
    ('Female', 'Female'),
    ('Other', 'Other'),
]


class VisaApplication(models.Model):
    # Id and Created Timestamp
    id = models.AutoField(primary_key=True)
    form_created = models.DateTimeField(auto_now_add=True)


    # Personal Information
    name = models.CharField(max_length=100)
    gender = models.CharField(max_length=6, choices=GENDER_CHOICES)
    occupation = models.CharField(max_length=100)
    civil_status = models.CharField(max_length=20)
    date_of_birth = models.DateField()
    # place_of_birth = models.CharField(max_length=100, null=True)
    passport_size_photo = models.ImageField(upload_to='images')


    # Passport Information
    passport_issue_country = models.CharField(max_length=100)
    passport_number = models.CharField(max_length=20)
    passport_issue_date = models.DateField()
    passport_expiry_date = models.DateField()
    passport_bio_page = models.ImageField(upload_to='passport_bio')


    # Contact Information
    phone = models.CharField(max_length=15)
    address = models.CharField(max_length=200)
    email = models.EmailField()


    # Visa Information
    # visa_type_reference = models.ForeignKey('VisaType', on_delete=models.CASCADE, related_name='visa_type_reference')
    visa_duration = models.IntegerField()
    visa_start_date = models.DateField()


    # Travel Information
    past_travel_history = models.CharField(max_length=200)


    # Admin Status
    isApproved = models.BooleanField(default=False)
    isProccessing = models.BooleanField(default=False)
    isRejected = models.BooleanField(default=False)
    isPending = models.BooleanField(default=True)

    def __str__(self):
        return f"{self.id} - {self.name}"
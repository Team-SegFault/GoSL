import 'package:GOSL/components/stepper.dart';
import 'package:GOSL/views/visa_application/form_sections/passport_details.dart';
import 'package:GOSL/views/visa_application/form_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import 'application_success.dart';
import 'form_sections/arrival_details.dart';
import 'form_sections/contact_form_details.dart';
import 'dynamic_form.dart';
import 'form_sections/personal_info_form.dart';

class VisaApplicationPage extends StatefulWidget {
  @override
  State<VisaApplicationPage> createState() => _VisaApplicationPageState();
}

class _VisaApplicationPageState extends State<VisaApplicationPage> {
  final Map<int, dynamic> _visaApplicationData = {};
  final PageController _pageController = PageController();
  int _currentPageIndex = 0;

  // page form keys
  final Map<int, GlobalKey<FormBuilderState>> _pageFormKey = {
    0: GlobalKey<FormBuilderState>(),
    1: GlobalKey<FormBuilderState>(),
    2: GlobalKey<FormBuilderState>(),
    3: GlobalKey<FormBuilderState>(),
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Visa Application',
        ),
      ),
      body: Column(
        children: [
          FormStepper(
            activeStep: _currentPageIndex,
            titles: const [
              'Personal Info',
              'Contact Details',
              'Passport Details',
              'Arrival Details',
            ],
          ),
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (index) async {
                await _saveFormData(); // Save form data on page change
                setState(() {
                  _currentPageIndex = index;
                });
                print(_visaApplicationData);
              },
              children: [
                FormWrapper(
                  child: DynamicForm(
                    formKey: _pageFormKey[0]!,
                    fields: personalInfoFields(
                      initialValues: _visaApplicationData[0] ?? {},
                    ),
                    onActionButtonClick: goToNextPage,
                    isLastStep: false,
                  ),
                ),
                FormWrapper(
                  child: DynamicForm(
                    formKey: _pageFormKey[1]!,
                    fields: contactDetailsFields(
                      initialValues: _visaApplicationData[1] ?? {},
                    ),
                    onActionButtonClick: goToNextPage,
                    isLastStep: false,
                  ),
                ),
                FormWrapper(
                  child: DynamicForm(
                    formKey: _pageFormKey[2]!,
                    fields: passportDetailsFields(
                        initialValues: _visaApplicationData[2] ?? {}
                    ),
                    onActionButtonClick: goToNextPage,
                    isLastStep: false,
                  ),
                ),
                FormWrapper(
                  child: DynamicForm(
                    formKey: _pageFormKey[3]!,
                    fields: arrivalDetails(
                        initialValues: _visaApplicationData[3] ?? {}
                    ),
                    onActionButtonClick: () async {
                      _saveFormData();
                      await postVisaApplication();
                    },
                    isLastStep: true,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Save form data based on the current step
  Future<void> _saveFormData() async {
    FormBuilderState? currentFormState;

    // Determine the current form to save
    currentFormState = _pageFormKey[_currentPageIndex]!.currentState;

    // Save the form data if it's valid
    if (currentFormState?.saveAndValidate() ?? false) {
      setState(() {
        _visaApplicationData[_currentPageIndex] =
            currentFormState!.value;
      });
    }
  }


  void goToNextPage() async {
    await _saveFormData();
    _pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  Future postVisaApplication() async {
    // Post visa application data to the server
    await http.post(
      Uri.parse('https://example.com/api/visa_application'),
      body: jsonEncode(_visaApplicationData),
      headers: {
        'Content-Type': 'application/json',
      },
    );

    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => const ApplicationSuccessPage()),
    );
  }

  dynamic prepareRequestBody(visaApplicationData) {
    final personalInfo = visaApplicationData[0];
    final contactDetails = visaApplicationData[1];
    final passportDetails = visaApplicationData[2];
    final arrivalDetails = visaApplicationData[3];


    // "name": "John Doe",
    // "gender": "Male",
    // "occupation": "Employed",
    // "civil_status": "Married",
    // "date_of_birth": "2000-01-01",
    // "passport_size_photo": "http://localhost:8000/media/images/default_h6l8pVr.jpg",
    // "passport_issue_country": "United Kingdom",
    // "passport_number": "12342CX2342K",
    // "passport_issue_date": "2022-01-01",
    // "passport_expiry_date": "2030-01-01",
    // "passport_bio_page": "http://localhost:8000/media/passport_bio/ray-so-export_hK4rZdR.png",
    // "phone": "+941134293423",
    // "address": "No 1, Help Me Avenue, New York, USA.",
    // "email": "hello@example.com",
    // "visa_duration": 1,
    // "visa_start_date": "2024-12-01",
    // "past_travel_history": "None",

    return {
      'name': personalInfo['name'],
      'gender': personalInfo['gender'],
      'occupation': personalInfo['occupation'],
      'civil_status': personalInfo['civil_status'],
      'date_of_birth': personalInfo['date_of_birth'],
      'passport_size_photo': personalInfo['passport_size_photo'],
      'passport_issue_country': passportDetails['passport_issue_country'],
      'passport_number': passportDetails['passport_number'],
      'passport_issue_date': passportDetails['passport_issue_date'],
      'passport_expiry_date': passportDetails['passport_expiry_date'],
      'passport_bio_page': passportDetails['passport_bio_page'],
      'phone': contactDetails['phone'],
      'address': contactDetails['address'],
      'email': contactDetails['email'],
      'visa_duration': arrivalDetails['visa_duration'],
      'visa_start_date': arrivalDetails['visa_start_date'],
      'past_travel_history': arrivalDetails['past_travel_history'],
    };
}}

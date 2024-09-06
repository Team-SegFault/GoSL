import 'package:http/http.dart' as http;
import 'package:path/path.dart' as path; // For basename
import 'package:http_parser/http_parser.dart'; // For MediaType
import 'package:GOSL/components/stepper.dart';
import 'package:GOSL/views/visa_application/form_sections/passport_details.dart';
import 'package:GOSL/views/visa_application/form_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_image_picker/form_builder_image_picker.dart';

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

  Future<void> postVisaApplication() async {
    var request = http.MultipartRequest(
      'POST',
      Uri.parse('https://example.com/api/visa_application'),
    );

    // Prepare JSON data
    final Map<String, String> requestBody = prepareRequestBody(_visaApplicationData);

    // Add text fields
    request.fields.addAll(requestBody);

    // Attach images (passport bio page and passport size photo)
    final XFile passportBioPage = _visaApplicationData[2]['passport_bio_page'];
    final XFile passportSizePhoto = _visaApplicationData[0]['passport_size_photo'];

    request.files.add(await http.MultipartFile.fromPath(
      'passport_bio_page',
      passportBioPage.path,
      filename: path.basename(passportBioPage.path),
      contentType: MediaType('image', 'jpeg'), // Adjust as per the actual file type
    ));

    request.files.add(await http.MultipartFile.fromPath(
      'passport_size_photo',
      passportSizePhoto.path,
      filename: path.basename(passportSizePhoto.path),
      contentType: MediaType('image', 'jpeg'),
    ));

    // Set headers
    request.headers['Content-Type'] = 'multipart/form-data';

    // Send the request
    final response = await request.send();

    // Check if the request was successful
    if (response.statusCode == 200) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const ApplicationSuccessPage()),
      );
    } else {
      // Handle error
      print('Error: ${response.statusCode}');
    }
  }

  Map<String, String> prepareRequestBody(visaApplicationData) {
    final personalInfo = visaApplicationData[0];
    final contactDetails = visaApplicationData[1];
    final passportDetails = visaApplicationData[2];
    final arrivalDetails = visaApplicationData[3];

    return {
      'name': personalInfo['name'],
      'gender': personalInfo['gender'],
      'occupation': personalInfo['occupation'],
      'civil_status': personalInfo['civil_status'],
      'date_of_birth': personalInfo['date_of_birth'],
      'passport_issue_country': passportDetails['passport_issue_country'],
      'passport_number': passportDetails['passport_number'],
      'passport_issue_date': passportDetails['passport_issue_date'],
      'passport_expiry_date': passportDetails['passport_expiry_date'],
      'phone': contactDetails['phone'],
      'address': contactDetails['address'],
      'email': contactDetails['email'],
      'visa_duration': arrivalDetails['visa_duration'],
      'visa_start_date': arrivalDetails['visa_start_date'],
      'past_travel_history': arrivalDetails['past_travel_history'],
    };
  }
}

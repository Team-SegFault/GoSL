import 'package:GOSL/components/stepper.dart';
import 'package:GOSL/views/visa_application/form_sections/passport_details.dart';
import 'package:GOSL/views/visa_application/form_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import 'form_sections/arrival_details.dart';
import 'form_sections/contact_form_details.dart';
import 'dynamic_form.dart';
import 'form_sections/personal_info_form.dart';

class VisaApplicationPage extends StatefulWidget {
  @override
  State<VisaApplicationPage> createState() => _VisaApplicationPageState();
}

class _VisaApplicationPageState extends State<VisaApplicationPage> {
  final Map<String, dynamic> _visaApplicationData = {};
  final PageController _pageController = PageController();
  int _currentPageIndex = 0;

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
            onStepTapped: (index) {
              _pageController.jumpToPage(index);
            },
          ),
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentPageIndex = index;
                });
              },
              children: [
                FormWrapper(
                  child: DynamicForm(
                    fields: personalInfoFields,
                    saveForm: (formData) {
                      setState(() {
                        _visaApplicationData['personalInfo'] = formData;
                      });
                    },
                    onActionButtonClick: goToNextPage,
                    isLastStep: false, // Not the last step, show "Next"
                  ),
                ),
                FormWrapper(
                  child: DynamicForm(
                    fields: contactDetailsFields,
                    saveForm: (formData) {
                      setState(() {
                        _visaApplicationData['contactDetails'] = formData;
                      });
                    },
                    onActionButtonClick: goToNextPage,
                    isLastStep: false, // Last step, show "Submit"
                  ),
                ),
                FormWrapper(
                    child: DynamicForm(
                        fields: passportDetailsFields,
                        saveForm: (formData) {
                          setState(() {
                            _visaApplicationData['passportDetails'] = formData;
                          });
                        },
                        onActionButtonClick: goToNextPage,
                        isLastStep: false)),
                FormWrapper(
                    child: DynamicForm(
                        fields: arrivalDetails,
                        saveForm: (formData) {
                          setState(() {
                            _visaApplicationData['arrivalDetails'] = formData;
                          });
                        },
                        onActionButtonClick: goToNextPage,
                        isLastStep: true))
              ],
            ),
          ),
        ],
      ),
    );
  }

  void goToNextPage() {
    _pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }
}

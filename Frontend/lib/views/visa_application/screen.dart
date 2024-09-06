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
          // ElevatedButton(onPressed: (){
          //   print(_visaApplicationData);
          // }, child: Text('Submit')),
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
                    onActionButtonClick: goToNextPage,
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
}

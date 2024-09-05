
import 'package:GOSL/views/visa_application/personal_info_form.dart';
import 'package:flutter/material.dart';
import 'package:GOSL/components/stepper.dart';

class VisaApplicationPage extends StatelessWidget{

  const VisaApplicationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Visa Application'),
      ),
      body: Column(
        children: [
          const FormStepper(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            child: PersonalInfoForm(),
          ),
        ],
      ),
    );
  }

}
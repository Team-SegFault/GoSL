import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';

class FormStepper extends StatefulWidget {
  const FormStepper({super.key});

  @override
  State<FormStepper> createState() => _FormStepperState();
}

class _FormStepperState extends State<FormStepper> {
  int activeStep = 0;

  final List<String> _titles = [
    'Personal Info',
    'Passport Info',
    'Visa Info',
    'Travel Details',
    'Completion'
  ];

  @override
  Widget build(BuildContext context) {
    return EasyStepper(
      activeStep: activeStep,
      lineStyle: LineStyle(
        lineSpace: 0,
        lineType: LineType.normal,
        finishedLineColor: Colors.orange,
        activeLineColor: Colors.grey[200],
        unreachedLineColor: Colors.grey[200]
      ),
      activeStepTextColor: Colors.black54,
      unreachedStepBackgroundColor: Colors.grey,
      internalPadding: 0,
      showLoadingAnimation: false,
      stepRadius: 6,
      showStepBorder: false,
      steps: List.generate(_titles.length, (index) {
        return EasyStep(
          customStep: Container(
            child: CircleAvatar(
              radius: 8,
              backgroundColor: Colors.transparent,
              child: CircleAvatar(
                radius: 6,
                backgroundColor:
                    activeStep >= index ? Colors.orangeAccent : Colors.grey[200],
              ),
            ),
          ),
          // title: activeStep == index ? _titles[index] : null,
            customTitle: Text(
              _titles[index],
              style: TextStyle(
                color: activeStep == index ? Colors.black : Colors.grey[200],
                fontSize: 10,
              ),
            ),
          topTitle: false
        );
      }),
      onStepReached: (index) => setState(() => activeStep = index),
    );
  }
}

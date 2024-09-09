import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';

class FormStepper extends StatelessWidget {
  final List<String> titles;
  final int activeStep;

  const FormStepper({super.key, required this.titles, required this.activeStep});

  @override
  Widget build(BuildContext context) {
    return EasyStepper(
      activeStep: activeStep,
      lineStyle: const LineStyle(
          lineSpace: 0,
          lineLength: 75,
          lineType: LineType.normal,
          finishedLineColor: Colors.orange,
          activeLineColor: Color(0xFFD9D9D9),
          unreachedLineColor: Color(0xFFD9D9D9)),
      unreachedStepBackgroundColor: const Color(0xFFD9D9D9),
      activeStepTextColor: Colors.black54,
      internalPadding: 0,
      showLoadingAnimation: false,
      stepRadius: 6,
      showStepBorder: false,
      steps: List.generate(titles.length, (index) {
        return EasyStep(
            customStep: CircleAvatar(
              radius: 8,
              backgroundColor: Colors.transparent,
              child: CircleAvatar(
                radius: 6,
                backgroundColor: activeStep >= index ? Colors.orangeAccent : const Color(0xFFD9D9D9),
              ),
            ),
            // title: activeStep == index ? _titles[index] : null,
            customTitle: activeStep == index
                ? Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      titles[index],
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: activeStep == index ? Colors.black : Colors.grey[200],
                        fontSize: 10,
                      ),
                    ),
                  )
                : null,
            topTitle: false);
      }),
    );
  }
}

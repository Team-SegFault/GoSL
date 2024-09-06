import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';

class FormStepper extends StatelessWidget {
  List<String> titles;
  Function(int index) onStepTapped;
  int activeStep;

  FormStepper(
      {super.key,
      required this.onStepTapped,
      required this.titles,
      required this.activeStep});

  @override
  Widget build(BuildContext context) {
    return EasyStepper(
      activeStep: activeStep,
      lineStyle: LineStyle(
          lineSpace: 0,
          lineType: LineType.normal,
          finishedLineColor: Colors.orange,
          activeLineColor: Colors.grey[200],
          unreachedLineColor: Colors.grey[200]),
      unreachedStepBackgroundColor: Colors.grey,
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
                backgroundColor: activeStep >= index
                    ? Colors.orangeAccent
                    : Colors.grey[200],
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
                        color: activeStep == index
                            ? Colors.black
                            : Colors.grey[200],
                        fontSize: 10,
                      ),
                    ),
                  )
                : null,
            topTitle: false);
      }),
      onStepReached: (index) => onStepTapped(index),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:gap/gap.dart';

class DynamicForm extends StatelessWidget {
  final List<Widget> fields;  // List of field definitions
  final Function() onActionButtonClick;
  final bool isLastStep;

  final GlobalKey<FormBuilderState> formKey;

  DynamicForm({
    required this.formKey,
    required this.fields,
    required this.onActionButtonClick,
    required this.isLastStep,
  });

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: formKey,
      child: Column(
        children: [
          // Display form fields with gap
          for (final field in fields) ...[
            field,
            const Gap(15),
          ],
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () async {
                onActionButtonClick();
              },
              child: Text(isLastStep ? 'Submit' : 'Next'),  // Display "Submit" or "Next"
            ),
          ),
        ],
      ),
    );
  }
}

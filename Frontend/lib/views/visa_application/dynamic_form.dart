import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:gap/gap.dart';

class DynamicForm extends StatelessWidget {
  final List<Widget> fields;  // List of field definitions
  final Function() onActionButtonClick;
  final bool isLastStep;

  final GlobalKey<FormBuilderState> formKey = GlobalKey<FormBuilderState>();

  final Function(Map<String, dynamic>) saveForm;

  DynamicForm({
    super.key,
    required this.fields,
    required this.onActionButtonClick,
    required this.isLastStep,
    required this.saveForm,
  });

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: formKey,
      onChanged: () {
        // Handle form changes
      },
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
              onPressed: () {
                // Validate form
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

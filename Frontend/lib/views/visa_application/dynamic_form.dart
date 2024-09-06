import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:gap/gap.dart';

class DynamicForm extends StatelessWidget {
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();
  final List<Widget> fields;  // List of field definitions
  final Function(Map<String, dynamic>) onActionButtonClick;  // Callback to pass form data
  final bool isLastStep;  // Determines if it's the last step

  DynamicForm({
    super.key,
    required this.fields,
    required this.onActionButtonClick,
    required this.isLastStep,
  });

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: _formKey,
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
                if (_formKey.currentState?.saveAndValidate() ?? false) {
                  onActionButtonClick(_formKey.currentState?.value ?? {});
                }
              },
              child: Text(isLastStep ? 'Submit' : 'Next'),  // Display "Submit" or "Next"
            ),
          ),
        ],
      ),
    );
  }
}

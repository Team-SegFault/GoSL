import 'package:GOSL/utils/datestring.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

List<Widget> arrivalDetails({required initialValues}) {
  return [
    // arrival date
    FormBuilderDateTimePicker(
      name: 'visa_start_date',
      initialValue: initialValues['visa_start_date'],
      decoration: const InputDecoration(labelText: 'Expected Arrival Date'),
      inputType: InputType.date,
      validator: FormBuilderValidators.compose([
        FormBuilderValidators.dateTime(),
        FormBuilderValidators.required(),
      ]),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      initialDate: DateTime.now().add(const Duration(days: 1)),
      firstDate: DateTime.now(),
    ),
    // duration of stay in days
    FormBuilderTextField(
      name: 'visa_duration',
      initialValue: initialValues['visa_duration'],
      validator: FormBuilderValidators.compose([
        FormBuilderValidators.required(),
        FormBuilderValidators.numeric(errorText: "Please enter a number"),
        FormBuilderValidators.min(1),
      ]),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: const InputDecoration(
        labelText: 'Duration of Stay in Days',
      ),
    ),
    // travel history
    FormBuilderTextField(
      name: 'past_travel_history',
      initialValue: initialValues['past_travel_history'],
      validator: FormBuilderValidators.required(),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: const InputDecoration(
        labelText: 'Travel History',
        helperText: 'Please provide a brief history of your travel',
        helperMaxLines: 3,
      ),
    ),
  ];
}

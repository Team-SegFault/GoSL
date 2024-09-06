import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

List<Widget> arrivalDetails = [
  // arrival date
  FormBuilderDateTimePicker(
    name: 'arrivalDate',
    decoration: const InputDecoration(labelText: 'Expected Arrival Date'),
    inputType: InputType.date,
    initialDate: DateTime.now().add(const Duration(days: 1)),
    firstDate: DateTime.now(),
  ),
  // duration of stay in days
  FormBuilderTextField(
    name: 'durationOfStay',
    valueTransformer: (value) => int.tryParse(value!),
    validator: FormBuilderValidators.compose([
      FormBuilderValidators.required(),
      FormBuilderValidators.numeric(errorText: "Please enter a number"),
      FormBuilderValidators.min(1),
    ]),
    decoration: const InputDecoration(
        labelText: 'Duration of Stay in Days',
    ),
  ),
  // travel history
  FormBuilderTextField(
    name: 'travelHistory',
    decoration: const InputDecoration(
        labelText: 'Travel History',
        helperText: 'Please provide a brief history of your travel',
        helperMaxLines: 3,
    ),
  ),
];
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_image_picker/form_builder_image_picker.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

List<Widget> passportDetailsFields({required initialValues}) {
  return [
    // country of issue
    FormBuilderTextField(
      name: 'passport_issue_country',
      initialValue: initialValues['passport_issue_country'],
      validator: FormBuilderValidators.required(),
      style: const TextStyle(fontSize: 13),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: const InputDecoration(labelText: 'Country of Issue'),
    ),
    FormBuilderTextField(
      name: 'passport_number',
      initialValue: initialValues['passport_number'],
      style: const TextStyle(fontSize: 13),
      validator: FormBuilderValidators.compose([
        FormBuilderValidators.passport(),
        FormBuilderValidators.required(),
      ]),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: const InputDecoration(labelText: 'Passport Number'),
    ),
    FormBuilderDateTimePicker(
      name: 'passport_issue_date',
      initialValue: initialValues['passport_issue_date'],
      style: const TextStyle(fontSize: 13),
      decoration: const InputDecoration(labelText: 'Issue Date'),
      inputType: InputType.date,
      validator: FormBuilderValidators.compose([
        FormBuilderValidators.dateTime(),
        FormBuilderValidators.required(),
      ]),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    ),
    FormBuilderDateTimePicker(
      name: 'passport_expiry_date',
      initialValue: initialValues['passport_expiry_date'],
      style: const TextStyle(fontSize: 13),
      decoration: const InputDecoration(labelText: 'Expiry Date'),
      inputType: InputType.date,
      validator: FormBuilderValidators.compose([
        FormBuilderValidators.dateTime(),
        FormBuilderValidators.required(),
      ]),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      firstDate: DateTime(1900),
    ),
    // Photo of the Passport Bio Page
    FormBuilderImagePicker(
      name: 'passport_bio_page',
      initialValue: initialValues['passport_bio_page'],
      validator: FormBuilderValidators.required(),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: const InputDecoration(
        labelText: 'Photo of the Passport Bio Page',
        helperText: 'Please upload a clear photo of the passport bio page',
      ),
      maxImages: 1,
    ),
  ];
}

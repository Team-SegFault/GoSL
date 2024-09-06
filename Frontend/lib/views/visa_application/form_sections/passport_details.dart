import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_image_picker/form_builder_image_picker.dart';

List<Widget> passportDetailsFields({required initialValues}){
  return [
    // country of issue
    FormBuilderTextField(
      name: 'countryOfIssue',
      initialValue: initialValues['countryOfIssue'],
      decoration: const InputDecoration(labelText: 'Country of Issue'),
    ),
    FormBuilderTextField(
      name: 'passportNumber',
      initialValue: initialValues['passportNumber'],
      decoration: const InputDecoration(labelText: 'Passport Number'),
    ),
    FormBuilderDateTimePicker(
      name: 'issueDate',
      initialValue: initialValues['issueDate'],
      decoration: const InputDecoration(labelText: 'Issue Date'),
      inputType: InputType.date,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    ),
    FormBuilderDateTimePicker(
      name: 'expiryDate',
      initialValue: initialValues['expiryDate'],
      decoration: const InputDecoration(labelText: 'Expiry Date'),
      inputType: InputType.date,
      firstDate: DateTime(1900),
    ),
    // Photo of the Passport Bio Page
    FormBuilderImagePicker(
      name: 'passportPhoto',
      initialValue: initialValues['passportPhoto'],
      decoration: const InputDecoration(
        labelText: 'Photo of the Passport Bio Page',
        helperText: 'Please upload a clear photo of the passport bio page',
      ),
      maxImages: 1,
    ),
  ];
}
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_image_picker/form_builder_image_picker.dart';

List<Widget> passportDetailsFields = [
  // country of issue
  FormBuilderTextField(
    name: 'countryOfIssue',
    decoration: const InputDecoration(labelText: 'Country of Issue'),
  ),
  FormBuilderTextField(
    name: 'passportNumber',
    decoration: const InputDecoration(labelText: 'Passport Number'),
  ),
  FormBuilderDateTimePicker(
    name: 'issueDate',
    decoration: const InputDecoration(labelText: 'Issue Date'),
    inputType: InputType.date,
    firstDate: DateTime(1900),
    lastDate: DateTime.now(),
  ),
  FormBuilderDateTimePicker(
    name: 'expiryDate',
    decoration: const InputDecoration(labelText: 'Expiry Date'),
    inputType: InputType.date,
    firstDate: DateTime(1900),
  ),
  // Photo of the Passport Bio Page
  FormBuilderImagePicker(
    name: 'photos',
    decoration: const InputDecoration(
        labelText: 'Photo of the Passport Bio Page',
      helperText: 'Please upload a clear photo of the passport bio page',
    ),
    maxImages: 1,
  ),
];
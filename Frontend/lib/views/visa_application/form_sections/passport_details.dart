import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_image_picker/form_builder_image_picker.dart';

import '../../../utils/datestring.dart';

List<Widget> passportDetailsFields({required initialValues}){
  return [
    // country of issue
    FormBuilderTextField(
      name: 'passport_issue_country',
      initialValue: initialValues['passport_issue_country'],
      decoration: const InputDecoration(labelText: 'Country of Issue'),
    ),
    FormBuilderTextField(
      name: 'passport_number',
      initialValue: initialValues['passport_number'],
      decoration: const InputDecoration(labelText: 'Passport Number'),
    ),
    FormBuilderDateTimePicker(
      name: 'passport_issue_date',
      initialValue: initialValues['passport_issue_date'],
      decoration: const InputDecoration(labelText: 'Issue Date'),
      inputType: InputType.date,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    ),
    FormBuilderDateTimePicker(
      name: 'passport_expiry_date',
      initialValue: initialValues['passport_expiry_date'],
      decoration: const InputDecoration(labelText: 'Expiry Date'),
      inputType: InputType.date,
      firstDate: DateTime(1900),
    ),
    // Photo of the Passport Bio Page
    FormBuilderImagePicker(
      name: 'passport_bio_page',
      initialValue: initialValues['passport_bio_page'],
      decoration: const InputDecoration(
        labelText: 'Photo of the Passport Bio Page',
        helperText: 'Please upload a clear photo of the passport bio page',
      ),
      maxImages: 1,
    ),
  ];
}
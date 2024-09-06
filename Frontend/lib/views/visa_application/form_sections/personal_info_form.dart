import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_image_picker/form_builder_image_picker.dart';

List<Widget> personalInfoFields  = [
  FormBuilderTextField(
    name: 'name',
    decoration: const InputDecoration(labelText: 'Name'),
  ),
  FormBuilderDropdown(
    name: 'gender',
    decoration: const InputDecoration(labelText: 'Gender'),
    items: ['Male', 'Female', 'Other']
        .map(
          (gender) =>
          DropdownMenuItem(
            value: gender,
            child: Text(gender),
          ),
    )
        .toList(),
  ),
  FormBuilderDateTimePicker(
    name: 'birthdate',
    decoration: const InputDecoration(labelText: 'Date of Birth'),
    inputType: InputType.date,
    firstDate: DateTime(1900),
  ),
  FormBuilderDropdown(
    name: 'occupation',
    decoration: const InputDecoration(labelText: 'Occupation'),
    items: [
      'Employed',
      'Self-Employed',
      'Student',
      'Retired',
      'Unemployed',
      'Other',
      'N/A'
    ]
        .map(
          (gender) =>
          DropdownMenuItem(
            value: gender,
            child: Text(gender),
          ),
    )
        .toList(),
  ),
  FormBuilderDropdown(
    name: 'civil_status',
    decoration: const InputDecoration(labelText: 'Civil Status'),
    items: ['Married', 'Single', 'Divorced', 'Widowed']
        .map(
          (gender) =>
          DropdownMenuItem(
            value: gender,
            child: Text(gender),
          ),
    )
        .toList(),
  ),
  FormBuilderImagePicker(
    name: 'photo',
    decoration: const InputDecoration(
      labelText: 'Passport sized Photo',
      helperText: 'Please upload a clear passport sized photo of yourself',
      helperMaxLines: 3
    ),
  )
];
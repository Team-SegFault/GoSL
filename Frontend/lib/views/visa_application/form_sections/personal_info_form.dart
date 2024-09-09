import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_image_picker/form_builder_image_picker.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../../../utils/datestring.dart';

List<Widget> personalInfoFields({required initialValues}) {
  return [
    FormBuilderTextField(
      name: 'name',
      initialValue: initialValues['name'],
      style: const TextStyle(fontSize: 13),
      decoration: const InputDecoration(labelText: 'Name'),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: FormBuilderValidators.required(),
    ),
    FormBuilderDropdown(
      name: 'gender',
      initialValue: initialValues['gender'],
      decoration: const InputDecoration(labelText: 'Gender'),
      validator: FormBuilderValidators.required(),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      items: ['Male', 'Female', 'Other']
          .map(
            (gender) => DropdownMenuItem(
              value: gender,
              child: Text(
                gender,
                style: const TextStyle(fontSize: 13),
              ),
            ),
          )
          .toList(),
    ),
    FormBuilderDateTimePicker(
      name: 'date_of_birth',
      initialValue: initialValues['date_of_birth'],
      validator: FormBuilderValidators.compose(
        [
          FormBuilderValidators.dateTime(),
          FormBuilderValidators.required(),
        ],
      ),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: const InputDecoration(labelText: 'Date of Birth'),
      inputType: InputType.date,
      style: const TextStyle(fontSize: 13),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    ),
    FormBuilderDropdown(
      name: 'occupation',
      initialValue: initialValues['occupation'],
      decoration: const InputDecoration(labelText: 'Occupation'),
      validator: FormBuilderValidators.required(),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      items: ['Employed', 'Self-Employed', 'Student', 'Retired', 'Unemployed', 'Other', 'N/A']
          .map(
            (gender) => DropdownMenuItem(
              value: gender,
              child: Text(
                gender,
                style: const TextStyle(fontSize: 13),
              ),
            ),
          )
          .toList(),
    ),
    FormBuilderDropdown(
      name: 'civil_status',
      initialValue: initialValues['civil_status'],
      decoration: const InputDecoration(labelText: 'Civil Status'),
      validator: FormBuilderValidators.required(),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      items: ['Married', 'Single', 'Divorced', 'Widowed']
          .map(
            (gender) => DropdownMenuItem(
              value: gender,
              child: Text(
                gender,
                style: const TextStyle(fontSize: 13),
              ),
            ),
          )
          .toList(),
    ),
    FormBuilderImagePicker(
      name: 'passport_size_photo',
      initialValue: initialValues['passport_size_photo'],
      maxImages: 1,
      validator: FormBuilderValidators.required(),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: const InputDecoration(
          labelText: 'Passport sized Photo',
          helperText: 'Please upload a clear passport sized photo of yourself',
          helperMaxLines: 3),
    )
  ];
}

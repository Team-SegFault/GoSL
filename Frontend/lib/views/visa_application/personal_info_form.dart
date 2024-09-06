import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

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
    decoration: const InputDecoration(labelText: 'Birthdate'),
    inputType: InputType.date,
    initialDate: DateTime.now(),
    initialValue: DateTime.now(),
    firstDate: DateTime(1900),
    lastDate: DateTime.now(),
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
    name: 'gender',
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
];
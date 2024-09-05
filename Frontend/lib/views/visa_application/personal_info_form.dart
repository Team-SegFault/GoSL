import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:gap/gap.dart';

class PersonalInfoForm extends StatelessWidget {
  final _formKey = GlobalKey<FormBuilderState>();

  PersonalInfoForm({super.key});

  static const gap = Gap(20);

  static List<Widget> elements  = [
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
    SizedBox(
      width: double.infinity,
      child: AppButton(
        text: 'Next',
        onPressed: () {

        },
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: _formKey,
      child: Column(
        // children - elements with gap in between
        children: [
          for (var element in elements) ...[element, gap],
        ],
      ),
    );
  }
}

class AppButton extends StatelessWidget {
  final String text;

  final Function()? onPressed;

  const AppButton({
    super.key,
    required this.text,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(14),
          shape: RoundedRectangleBorder(
            borderRadius:
            BorderRadius.circular(10), // Adjust the border radius as needed
          ),
          elevation: 0),
      onPressed: onPressed,
      child: Text(text, style: const TextStyle(color: Colors.black)),
    );
  }
}

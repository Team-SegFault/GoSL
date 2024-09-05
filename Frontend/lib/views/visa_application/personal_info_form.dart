import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:gap/gap.dart';

class PersonalInfoForm extends StatelessWidget {
  final _formKey = GlobalKey<FormBuilderState>();

  PersonalInfoForm({super.key});

  static const gap = Gap(20);

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: _formKey,
      child: Column(
        children: [
          FormBuilderTextField(
            name: 'name',
            decoration: const InputDecoration(labelText: 'Name'),
          ),
          gap,
          FormBuilderDropdown(
            name: 'gender',
            decoration: const InputDecoration(labelText: 'Gender'),
            items: ['Male', 'Female', 'Other']
                .map(
                  (gender) => DropdownMenuItem(
                    value: gender,
                    child: Text(gender),
                  ),
                )
                .toList(),
          ),
          gap,
          FormBuilderDateTimePicker(
            name: 'birthdate',
            decoration: const InputDecoration(labelText: 'Birthdate'),
            inputType: InputType.date,
            initialDate: DateTime.now(),
            initialValue: DateTime.now(),
            firstDate: DateTime(1900),
            lastDate: DateTime.now(),
          ),
          gap,
          FormBuilderDropdown(
            name: 'occupation',
            decoration: const InputDecoration(labelText: 'Occupation'),
            items: ['Employed', 'Self-Employed', 'Student', 'Retired', 'Unemployed', 'Other', 'N/A']
                .map(
                  (gender) => DropdownMenuItem(
                value: gender,
                child: Text(gender),
              ),
            )
                .toList(),
          ),
          gap,
          FormBuilderDropdown(
            name: 'gender',
            decoration: const InputDecoration(labelText: 'Civil Status'),
            items: ['Married', 'Single', 'Divorced', 'Widowed']
                .map(
                  (gender) => DropdownMenuItem(
                value: gender,
                child: Text(gender),
              ),
            )
                .toList(),
          ),
          gap,
          SizedBox(
            width: double.infinity,
            child: AppButton(
              text: 'Next',
              onPressed: () {},
            ),
          ),
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

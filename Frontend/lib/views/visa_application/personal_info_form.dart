import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class PersonalInfoForm extends StatelessWidget{

  final _formKey = GlobalKey<FormBuilderState>();

  PersonalInfoForm({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: FormBuilder(
        key: _formKey,
        child: Column(
          children: [
            FormBuilderTextField(
              name: 'email',
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            const SizedBox(height: 10),
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
            const SizedBox(height: 10),
            FormBuilderDateTimePicker(
              name: 'birthdate',
              decoration: const InputDecoration(labelText: 'Birthdate'),
              inputType: InputType.date,
              initialDate: DateTime.now(),
              initialValue: DateTime.now(),
              firstDate: DateTime(1900),
              lastDate: DateTime.now(),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.saveAndValidate()) {
                  print(_formKey.currentState!.value.entries.toList());
                }
              },
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }

}

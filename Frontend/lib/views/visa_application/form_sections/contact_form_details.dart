import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

List<Widget> contactDetailsFields({required initialValues}) {
  return [
    FormBuilderTextField(
      name: 'email',
      initialValue: initialValues['email'],
      style: const TextStyle(fontSize: 13),
      validator: FormBuilderValidators.compose(
        [
          FormBuilderValidators.required(),
          FormBuilderValidators.email(),
        ],
      ),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: const InputDecoration(labelText: 'Email'),
    ),
    FormBuilderTextField(
      name: 'phone',
      initialValue: initialValues['phone'],
      style: const TextStyle(fontSize: 13),
      keyboardType: TextInputType.phone,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: FormBuilderValidators.compose(
        [
          FormBuilderValidators.required(),
          FormBuilderValidators.phoneNumber(),
        ],
      ),
      decoration: const InputDecoration(labelText: 'Phone Number'),
    ),
    // permanent residence address
    FormBuilderTextField(
      name: 'address',
      initialValue: initialValues['address'],
      style: const TextStyle(fontSize: 13),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: FormBuilderValidators.required(),
      decoration: const InputDecoration(labelText: 'Residence Address'),
    ),
  ];
}

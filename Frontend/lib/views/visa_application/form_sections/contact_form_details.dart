import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

List<Widget> contactDetailsFields({required initialValues}){
  return [
    FormBuilderTextField(
      name: 'email',
      initialValue: initialValues['email'],
      decoration: const InputDecoration(labelText: 'Email'),
    ),
    FormBuilderTextField(
      name: 'phone',
      initialValue: initialValues['phone'],
      decoration: const InputDecoration(labelText: 'Phone Number'),
    ),
    // permanent residence address
    FormBuilderTextField(
      name: 'address',
      initialValue: initialValues['address'],
      decoration: const InputDecoration(labelText: 'Residence Address'),
    ),
  ];
}
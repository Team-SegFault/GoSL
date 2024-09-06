import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

List<Widget> contactDetailsFields = [
  FormBuilderTextField(
    name: 'email',
    decoration: const InputDecoration(labelText: 'Email'),
  ),
  FormBuilderTextField(
    name: 'phone',
    decoration: const InputDecoration(labelText: 'Phone Number'),
  ),
  // Add more fields...
];
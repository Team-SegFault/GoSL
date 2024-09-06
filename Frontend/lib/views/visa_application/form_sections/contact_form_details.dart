import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

List<Widget> contactDetailsFields(){
  return [
    FormBuilderTextField(
      name: 'email',
      decoration: const InputDecoration(labelText: 'Email'),
    ),
    FormBuilderTextField(
      name: 'phone',
      decoration: const InputDecoration(labelText: 'Phone Number'),
    ),
    // permanent residence address
    FormBuilderTextField(
      name: 'address',
      decoration: const InputDecoration(labelText: 'Residence Address'),
    ),
  ];
}
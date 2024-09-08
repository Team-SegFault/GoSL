import 'package:flutter/widgets.dart';

class FormWrapper extends StatelessWidget {
  const FormWrapper({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            child: child,
          ),
        ],
      ),
    );
  }
}
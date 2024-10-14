import 'package:flutter/material.dart';

class CoordinateFormField extends StatelessWidget {
  const CoordinateFormField({
    super.key,
    required this.label,
    required this.controller,
  });

  final String label;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
      ),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Veuillez entrer une ${label.toLowerCase()}';
        }

        try {
          double.parse(value);
        } catch (e) {
          return "Veuillez entrer une ${label.toLowerCase()} valide";
        }

        return null;
      },
    );
  }
}

import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatelessWidget {
  const TextFormFieldWidget({
    super.key,
    required this.label,
    this.controller,
    this.keyboardType,
    this.onChanged,
    this.validator,
    this.maxLines,
    required this.formKey,
    this.hintText,
  });
  final String label;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final ValueChanged? onChanged;
  final int? maxLines;
  final String? hintText;
  final GlobalKey<FormFieldState> formKey;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: TextFormField(
        key: formKey,
        controller: controller,
        onChanged: onChanged,
        keyboardType: keyboardType,
        validator: validator,
        maxLines: maxLines,
        decoration: InputDecoration(
            // constraints: const BoxConstraints(maxHeight: 5, minHeight: 3),
            alignLabelWithHint: true,
            label: Text(label),
            hintText: hintText,
            border: const OutlineInputBorder()),
      ),
    );
  }
}

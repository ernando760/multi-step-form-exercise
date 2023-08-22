import 'package:flutter/material.dart';

class ProductFormPage extends StatelessWidget {
  const ProductFormPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Expanded(
        child: Container(
          alignment: Alignment.center,
          child: const Text("Form page"),
        ),
      )),
    );
  }
}

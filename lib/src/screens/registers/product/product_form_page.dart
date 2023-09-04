import 'package:flutter/material.dart';
import 'package:multi_step_form_exercise/src/screens/registers/controllers/form_product_controller.dart';
import 'package:multi_step_form_exercise/src/screens/registers/widgets/form_product_widget.dart';

class ProductFormPage extends StatefulWidget {
  const ProductFormPage({super.key});

  @override
  State<ProductFormPage> createState() => _ProductFormPageState();
}

class _ProductFormPageState extends State<ProductFormPage> {
  final controller = FormProductController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.center,
              child: const FormProductWidget(),
            ),
          ),
        ],
      )),
    );
  }
}

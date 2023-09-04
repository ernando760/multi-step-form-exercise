import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:multi_step_form_exercise/src/screens/registers/controllers/form_product_controller.dart';
import 'package:provider/provider.dart';

class FormProductWidget extends StatefulWidget {
  const FormProductWidget({
    super.key,
  });

  @override
  State<FormProductWidget> createState() => _FormProductWidgetState();
}

class _FormProductWidgetState extends State<FormProductWidget> {
  late final GlobalKey<FormState> _formKey;

  @override
  void initState() {
    super.initState();
    _formKey = GlobalKey<FormState>(debugLabel: "Form key");
  }

  void _onCreateProduct() {
    if (_formKey.currentState!.validate()) {
      context.read<FormProductController>().createProduct();
      Navigator.pushReplacementNamed(context, "/productsPage");
      log("product created: ${context.read<FormProductController>().products}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: [
            _buildTitle(),
            _buildStepper(context),
          ],
        ));
  }

  Widget _buildTitle() {
    return Expanded(
        child: Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(10),
      child: const Text(
        "Cadastrar produto",
        style: TextStyle(fontSize: 26, fontWeight: FontWeight.w600),
      ),
    ));
  }

  Widget _buildStepper(BuildContext context) {
    final formController = Provider.of<FormProductController>(context);
    return ChangeNotifierProvider<FormProductController>.value(
      value: formController,
      builder: (context, child) {
        return Expanded(
            flex: 4,
            child: Stepper(
                type: StepperType.vertical,
                currentStep: formController.currentStep,
                controlsBuilder: (context, details) {
                  return _buildPreviousAndNextButtons();
                },
                // onStepTapped: formController.setStep,
                steps: formController.stepsList));
      },
    );
  }

  Widget _buildPreviousAndNextButtons() {
    return Consumer<FormProductController>(
        builder: (context, formController, _) {
      return SizedBox(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
                onPressed: formController.currentStep !=
                        formController.formTextFieldGroupList.length - 1
                    ? formController.stepNext
                    : _onCreateProduct,
                child: formController.currentStep !=
                        formController.stepsList.length - 1
                    ? const Text("Próximo")
                    : const Text("adicionar produto")),
            ElevatedButton(
                onPressed: formController.stepBack,
                child: const Text("Voltar")),
          ],
        ),
      );
    });
  }

  // Widget _buildPageViewForm() {
  //   final formController = Provider.of<FormController>(context);
  //   return ChangeNotifierProvider.value(
  //     value: formController,
  //     child: Expanded(
  //       flex: 2,
  //       child: Container(
  //         decoration: const BoxDecoration(
  //             // color: Colors.redAccent,
  //             ),
  //         child: PageView.builder(
  //             // controller: controller,
  //             onPageChanged: (value) => formController.setPage(value),
  //             physics: const NeverScrollableScrollPhysics(),
  //             itemCount: _formTextFieldGroupList(formController).length,
  //             itemBuilder: (context, index) {
  //               return _formTextFieldGroupList(formController)[index];
  //             }),
  //       ),
  //     ),
  //   );
  // }
}

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:multi_step_form_exercise/src/keys/form_product_text_field_key.dart';
import 'package:multi_step_form_exercise/src/models/product_model.dart';
import 'package:multi_step_form_exercise/src/validator/form_validator_product_controller.dart';
import 'package:multi_step_form_exercise/src/validator/validator.dart';
import 'package:multi_step_form_exercise/src/screens/registers/widgets/group_form_widget.dart';
import 'package:multi_step_form_exercise/src/screens/registers/widgets/text_form_field_widget.dart';

class FormProductController extends ChangeNotifier {
  TextEditingController nomeController = TextEditingController();
  TextEditingController descricaoController = TextEditingController();
  TextEditingController categoriaController = TextEditingController();
  TextEditingController precoController = TextEditingController();
  TextEditingController alturaController = TextEditingController();
  TextEditingController pesoController = TextEditingController();
  PageController pageController = PageController();

  late final List<Step> stepsList;
  late final List<GroupFormWidget> formTextFieldGroupList;
  late final Validator formValidatorController;

  int currentPage = 0;
  int currentStep = 0;
  List<ProductModel> products = [];

  FormProductController() {
    formValidatorController = FormValidatorController();
    formTextFieldGroupList = _formTextFieldGroupList();
    stepsList = _stepList();
  }

  setStep(int step) {
    currentStep = step;
    log("Current Step = $step");
    notifyListeners();
  }

  void setPage(int newPage) {
    currentPage = newPage;
    notifyListeners();
  }

  void clear() {
    nomeController.clear();
    descricaoController.clear();
    categoriaController.clear();
    precoController.clear();
    alturaController.clear();
    pesoController.clear();
    notifyListeners();
  }

  void stepNext() {
    if (currentStep != stepsList.length - 1) {
      if (_checkValidationTextField()) {
        setStep(currentStep + 1);
      }
    }
    notifyListeners();
  }

  void stepBack() {
    if (currentStep != 0) {
      setStep(currentStep - 1);
    }
    notifyListeners();
  }

  createProduct() {
    final id = DateTime.now().microsecondsSinceEpoch;
    final newProduct = ProductModel(
      id: id.toString(),
      nome: nomeController.text,
      descricao: descricaoController.text,
      categoria: categoriaController.text,
      preco: double.parse(precoController.text),
      altura: double.parse(alturaController.text),
      peso: double.parse(pesoController.text),
    );
    products.add(newProduct);
    currentStep = 0;
    clear();
    notifyListeners();
  }

  bool _checkValidationTextField() {
    List<(int, bool)> isGroupValidated = [];
    for (var (index, group) in formTextFieldGroupList.indexed) {
      isGroupValidated.addAll(group.textFormField
          .map((e) => index == currentStep
              ? (index, e.formKey.currentState!.validate())
              : (index, e.formKey.currentState!.isValid))
          .toList());
    }
    final isTextFieldValidated = isGroupValidated
        .where((e) => e.$1 == currentStep || e.$2 == true)
        .every((element) => element.$2 == true);
    log("${isGroupValidated.where((e) => e.$1 == currentStep || e.$2 == true)}",
        name: "group");
    log("$isTextFieldValidated", name: "validated");
    return isTextFieldValidated;
  }

  List<Step> _stepList() {
    return formTextFieldGroupList.indexed
        .map((e) => Step(
            isActive: currentStep >= e.$1,
            state: currentStep > e.$1
                ? StepState.complete
                : currentStep == e.$1
                    ? StepState.editing
                    : StepState.indexed,
            title: Text(e.$2.groupTitle),
            content: e.$2))
        .toList();
  }

  List<GroupFormWidget> _formTextFieldGroupList() {
    return [
      GroupFormWidget(
        groupTitle: "Nome e descrição",
        textFormField: [
          TextFormFieldWidget(
            formKey: FormProductTextFieldKey.textFieldNomeKey,
            controller: nomeController,
            label: "nome",
            validator: (value) => formValidatorController.validarNome(
              nome: value,
            ),
          ),
          TextFormFieldWidget(
            formKey: FormProductTextFieldKey.textFieldDescricaoKey,
            controller: descricaoController,
            label: "descrição",
            maxLines: 5,
            validator: (value) =>
                formValidatorController.validarDescricao(descricao: value),
          ),
        ],
      ),
      GroupFormWidget(
        groupTitle: "Categoria e preço",
        textFormField: [
          TextFormFieldWidget(
            formKey: FormProductTextFieldKey.textFieldCategoriaKey,
            controller: categoriaController,
            label: "categoria",
            validator: (value) =>
                formValidatorController.validarCategoria(categoria: value),
          ),
          TextFormFieldWidget(
            formKey: FormProductTextFieldKey.textFieldPrecoKey,
            controller: precoController,
            label: "preço",
            hintText: "0.00",
            keyboardType: TextInputType.number,
            validator: (value) =>
                formValidatorController.validarPreco(preco: value),
          ),
        ],
      ),
      GroupFormWidget(
        groupTitle: "Altura e peso",
        textFormField: [
          TextFormFieldWidget(
            formKey: FormProductTextFieldKey.textFieldAlturaKey,
            controller: alturaController,
            label: "Altura",
            hintText: "0.00",
            keyboardType: TextInputType.number,
            validator: (value) =>
                formValidatorController.validarCategoria(categoria: value),
          ),
          TextFormFieldWidget(
            formKey: FormProductTextFieldKey.textFieldPesoKey,
            controller: pesoController,
            label: "peso",
            keyboardType: TextInputType.number,
            hintText: "0.00",
            validator: (value) =>
                formValidatorController.validarPreco(preco: value),
          ),
        ],
      )
    ];
  }
}

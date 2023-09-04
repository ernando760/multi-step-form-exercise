import 'package:flutter/material.dart';

class FormProductTextFieldKey {
  static final GlobalKey<FormFieldState> formProductKey =
      GlobalKey<FormFieldState>(debugLabel: "form product");
  static final GlobalKey<FormFieldState> textFieldNomeKey =
      GlobalKey<FormFieldState>(debugLabel: "nome");
  static final GlobalKey<FormFieldState> textFieldDescricaoKey =
      GlobalKey<FormFieldState>(debugLabel: "descricao");
  static final GlobalKey<FormFieldState> textFieldCategoriaKey =
      GlobalKey<FormFieldState>(debugLabel: "categoria");
  static final GlobalKey<FormFieldState> textFieldPrecoKey =
      GlobalKey<FormFieldState>(debugLabel: "preco");
  static final GlobalKey<FormFieldState> textFieldAlturaKey =
      GlobalKey<FormFieldState>(debugLabel: "altura");
  static final GlobalKey<FormFieldState> textFieldPesoKey =
      GlobalKey<FormFieldState>(debugLabel: "peso");
}

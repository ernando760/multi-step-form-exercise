import 'package:form_validator/form_validator.dart';
import 'package:multi_step_form_exercise/src/validator/validator.dart';

class FormValidatorController extends Validator {
  // ignore: prefer_final_fields
  ValidationBuilder _validator = ValidationBuilder();
  ValidationBuilder get validator => _validator;
  final ValidationBuilder _nomeValidator =
      ValidationBuilder(requiredMessage: "Por favor preencha os campo nome");
  final ValidationBuilder _descricaoValidator = ValidationBuilder(
      requiredMessage: "Por favor preencha os campo descrição");
  final ValidationBuilder _categoriaValidator = ValidationBuilder(
      requiredMessage: "Por favor preencha os campo categoria");
  final ValidationBuilder _precoValidator =
      ValidationBuilder(requiredMessage: "Por favor preencha os campo preço");

  @override
  String? validarNome({String? nome}) => _nomeValidator
      .required()
      .minLength(4, "Requer no minimo 4 caracteres")
      .build()(nome);

  @override
  String? validarDescricao({String? descricao}) => _descricaoValidator
      .required()
      .minLength(4, "Requer no minimo 4 caracteres")
      .build()(descricao);

  @override
  String? validarCategoria({String? categoria}) => _categoriaValidator
      .required()
      .minLength(4, "Requer no minimo 4 caracteres")
      .build()(categoria);

  @override
  String? validarPreco({String? preco}) => _precoValidator
      .required()
      .minLength(4, "Requer no minimo 4 caracteres")
      .build()(preco);
}

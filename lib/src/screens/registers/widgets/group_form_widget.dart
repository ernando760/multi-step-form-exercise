import 'package:flutter/material.dart';
import 'package:multi_step_form_exercise/src/screens/registers/widgets/text_form_field_widget.dart';

class GroupFormWidget extends StatelessWidget {
  const GroupFormWidget({
    super.key,
    required this.textFormField,
    required this.groupTitle,
  });
  final String groupTitle;
  final List<TextFormFieldWidget> textFormField;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [...textFormField],
      ),
    );
  }
}

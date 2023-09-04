import 'package:flutter/material.dart';
import 'package:multi_step_form_exercise/app.dart';
import 'package:multi_step_form_exercise/src/screens/registers/controllers/form_product_controller.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Provider.debugCheckInvalidValueType = null;
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => FormProductController(),
      )
    ],
    child: const App(),
  ));
}

import 'package:flutter/material.dart';
import 'package:multi_step_form_exercise/src/screens/auth/product/product_form_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Multi step form exercise",
      theme: ThemeData(useMaterial3: true),
      home: const ProductFormPage(),
    );
  }
}

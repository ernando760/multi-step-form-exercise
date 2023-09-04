import 'package:flutter/material.dart';
import 'package:multi_step_form_exercise/src/screens/home/home_page.dart';
import 'package:multi_step_form_exercise/src/screens/product/products_page.dart';
import 'package:multi_step_form_exercise/src/screens/registers/product/product_form_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Multi step form exercise",
      theme: ThemeData(useMaterial3: true),
      initialRoute: "/productForm",
      routes: {
        "/": (context) => const HomePage(),
        "/productForm": (context) => const ProductFormPage(),
        "/productsPage": (context) => const ProductsPage(),
      },
    );
  }
}

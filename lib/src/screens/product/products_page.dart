import 'package:flutter/material.dart';
import 'package:multi_step_form_exercise/src/screens/registers/controllers/form_product_controller.dart';
import 'package:provider/provider.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Products"),
      ),
      body: Column(
        children: [
          Expanded(child: Consumer<FormProductController>(
              builder: (context, controller, _) {
            return Container(
              child: ListView.builder(
                itemCount: controller.products.length,
                itemBuilder: (context, index) {
                  final product = controller.products[index];
                  return ListTile(
                    title: Text(product.nome),
                    leading: Text(product.preco.toString()),
                    trailing: Text(product.altura.toString()),
                    subtitle: Text(product.descricao),
                  );
                },
              ),
            );
          })),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushReplacementNamed(context, "/productForm");
        },
        child: const Icon(Icons.add_shopping_cart_outlined),
      ),
    );
  }
}

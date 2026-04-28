import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testech/features/shopping/presentation/shopping_view_model.dart';

class ShoppingScreen extends StatefulWidget {
  const ShoppingScreen({super.key});

  @override
  State<ShoppingScreen> createState() => _ShoppingScreenState();
}

class _ShoppingScreenState extends State<ShoppingScreen> {
  final _productName = TextEditingController();

  @override
  void dispose() {
    _productName.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final products = context.watch<ShoppingViewModel>().products;

    return Scaffold(
      appBar: AppBar(title: Text("Shopping")),
      body: Column(
        children: [
         const SizedBox(height: 14),
          TextField(
            controller: _productName,
            decoration: const InputDecoration(
              labelText: "New product",
              border: OutlineInputBorder(),
            ),
          ),
         const SizedBox(height: 14),
          Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  if (_productName.text.isEmpty) return;
                  context.read<ShoppingViewModel>().addProduct(
                    _productName.text = "",
                  );
                },
                child: const Text("Ajouter"),
              ),
              ElevatedButton(
                onPressed: () {
                  context.read<ShoppingViewModel>().clear();
                },
                child: const Text("Clear"),
              ),
            ],
          ),
         const SizedBox(height: 14),

          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: products.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(products[index]),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () =>
                        context.read<ShoppingViewModel>().remove(index),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

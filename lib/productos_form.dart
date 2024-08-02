import 'package:flutter/material.dart';

class MyProductsPage extends StatefulWidget {
  _MyProductsPageState createState() => _MyProductsPageState();
}

class _MyProductsPageState extends State<MyProductsPage> {
  // Simulación de datos de productos
  final List<Map<String, String>> _products = [
    {
      'name': 'Café Americano',
      'description': 'Café clásico con agua caliente.',
      'price': '\$2.50'
    },
    {
      'name': 'Capuchino',
      'description': 'Café con leche espumosa.',
      'price': '\$3.00'
    },
    {'name': 'Latte', 'description': 'Café con leche.', 'price': '\$3.50'},
    {
      'name': 'Frappuccino',
      'description': 'Bebida de café frío con crema.',
      'price': '\$4.00'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Productos",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color.fromARGB(255, 7, 116, 67),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back, color: Colors.white)),
        actionsIconTheme: IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: _products.length,
          itemBuilder: (context, index) {
            final product = _products[index];
            return Card(
              child: ListTile(
                title: Text(product['name']!),
                subtitle: Text(product['description']!),
                trailing: Text(product['price']!),
              ),
            );
          },
        ),
      ),
    );
  }
}

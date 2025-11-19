import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:football_shop/screens/menu.dart';

class ProductFormPage extends StatefulWidget {
  const ProductFormPage({super.key});

  @override
  State<ProductFormPage> createState() => _ProductFormPageState();
}

class _ProductFormPageState extends State<ProductFormPage> {
  final _formKey = GlobalKey<FormState>();

  String _name = "";
  String _description = "";
  String _thumbnail = "";
  int _price = 0;
  int _amount = 0;
  bool _isFeatured = false;

  @override
  Widget build(BuildContext context) {
    // ambil CookieRequest dari Provider (wajib biar bisa post ke Django)
    final request = context.watch<CookieRequest>();

    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Add Product Form')),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Product Name
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Product Name',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) => setState(() => _name = value),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter product name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),

              // Description
              TextFormField(
                maxLines: 3,
                decoration: const InputDecoration(
                  labelText: 'Product Description',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) => setState(() => _description = value),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter description';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),

              // Price
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Price',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  setState(() {
                    _price = int.tryParse(value) ?? 0;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty || _price <= 0) {
                    return 'Please enter valid price';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),

              // Amount
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Amount',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  setState(() {
                    _amount = int.tryParse(value) ?? 0;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty || _amount < 0) {
                    return 'Please enter valid amount';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),

              // Thumbnail URL
              TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Thumbnail URL (optional)',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) => setState(() => _thumbnail = value),
              ),
              const SizedBox(height: 16.0),

              // Featured switch
              SwitchListTile(
                title: const Text('Featured Product'),
                value: _isFeatured,
                onChanged: (value) {
                  setState(() {
                    _isFeatured = value;
                  });
                },
              ),
              const SizedBox(height: 16.0),

              // Save button (kirim ke Django)
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    // GANTI URL sesuai path di urls.py kamu
                    // Emulator Android: http://10.0.2.2:8000/create-product-ajax/
                    // Chrome/web      : http://localhost:8000/create-product-ajax/
                    final response = await request.postJson(
                      "http://localhost:8000/create-product-ajax/",
                      jsonEncode({
                        "name": _name,
                        "price": _price,
                        "description": _description,
                        "amount": _amount,
                        "thumbnail": _thumbnail,
                        "is_featured": _isFeatured,
                      }),
                    );

                    if (!mounted) return;

                    if (response['status'] == 'success') {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Product successfully saved!"),
                        ),
                      );
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MyHomePage(),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            "Something went wrong, please try again.",
                          ),
                        ),
                      );
                    }
                  }
                },
                child: const Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

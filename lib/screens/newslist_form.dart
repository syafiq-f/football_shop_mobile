import 'package:flutter/material.dart';

class NewsFormPage extends StatefulWidget {
  const NewsFormPage({super.key});

  @override
  State<NewsFormPage> createState() => _NewsFormPageState();
}

class _NewsFormPageState extends State<NewsFormPage> {
  final _formKey = GlobalKey<FormState>();
  String _name = "", _description = "", _thumbnail = "";
  double _price = 0.0;
  bool _isFeatured = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Add Product Form')),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Nama produk
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Product Name',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    setState(() {
                      _name = value;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter product name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),
                // Deskripsi produk
                TextFormField(
                  maxLines: 3,
                  decoration: const InputDecoration(
                    labelText: 'Product Description',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    setState(() {
                      _description = value;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter description';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16.0),
                // Harga produk
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Price',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    setState(() {
                      _price = double.tryParse(value) ?? 0.0;
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
                // Thumbnail URL
                TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Thumbnail URL (optional)',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    setState(() {
                      _thumbnail = value;
                    });
                  },
                ),
                const SizedBox(height: 16.0),
                // Featured Switch
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
                // Save Button
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text('Product saved successfully!'),
                            content: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Name: $_name'),
                                Text('Price: $_price'),
                                Text('Description: $_description'),
                                Text('Thumbnail: $_thumbnail'),
                                Text('Featured: ${_isFeatured ? "Yes" : "No"}'),
                              ],
                            ),
                            actions: [
                              TextButton(
                                child: const Text('OK'),
                                onPressed: () {
                                  Navigator.pop(context);
                                  _formKey.currentState!.reset();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    }
                  },
                  child: const Text('Save'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mongo_dart/mongo_dart.dart' as mongo;
import 'package:product_app/pages/homepage.dart';
import 'package:product_app/screens/dashboard.dart';

class AddProductForm extends StatefulWidget {
  @override
  _AddProductFormState createState() => _AddProductFormState();
}

class _AddProductFormState extends State<AddProductForm> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  XFile? _imageFile;

  final String dbUrl =
      'mongodb+srv://Mike:12345@dart.gsx83ml.mongodb.net/testdb?retryWrites=true&w=majority&appName=Dart';
  late mongo.Db db;
  late mongo.DbCollection productsCollection;

  @override
  void initState() {
    super.initState();
    _initializeDb();
  }

  Future<void> _initializeDb() async {
    db = await mongo.Db.create(dbUrl);
    await db.open();
    productsCollection = db.collection('products');
    print('Connected to the database');
  }

  Future<void> _insertProduct(Map<String, dynamic> product) async {
    try {
      // Convert imagePath to String if it is an ObjectId
      if (product['imagePath'] is mongo.ObjectId) {
        product['imagePath'] =
            (product['imagePath'] as mongo.ObjectId).toHexString();
      }

      // Ensure productsCollection is initialized
      if (productsCollection == null) {
        print('productsCollection is not initialized');
        return;
      }

      var result = await productsCollection.insertOne(product);
      if (result.isSuccess) {
        print('Product inserted successfully');
      } else {
        print('Failed to insert product');
      }
    } catch (e) {
      print('Error inserting product: $e');
    }
  }

  Future<void> _pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _imageFile = pickedFile;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(
          'Add Product',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => DashboardScreen()));
          },
          icon: Icon(Icons.navigate_before),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            height: 500,
            width: 300,
            child: Card(
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextFormField(
                      controller: _nameController,
                      decoration: const InputDecoration(
                        labelText: 'Name',
                      ),
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: _descriptionController,
                      decoration: const InputDecoration(
                        labelText: 'Description',
                      ),
                      maxLines: null,
                    ),
                    SizedBox(height: 20),
                    if (_imageFile != null)
                      Image.file(
                        File(_imageFile!.path),
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                    ElevatedButton(
                      onPressed: _pickImage,
                      child: const Text('Pick Image'),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () async {
                        final product = {
                          'name': _nameController.text,
                          'description': _descriptionController.text,
                          'imagePath': _imageFile?.path ?? '',
                        };

                        await _insertProduct(product);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomePage()));
                      },
                      child: const Text('Save'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    db.close();
    super.dispose();
  }
}

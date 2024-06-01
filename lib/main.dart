import 'package:flutter/material.dart';
import 'package:product_app/screens/splash.dart';
import 'package:mongo_dart/mongo_dart.dart';

DbCollection? productsCollection;

void main() async {
  final db = await Db.create(
      'mongodb+srv://Mike:12345@dart.gsx83ml.mongodb.net/testdb?retryWrites=true&w=majority&appName=Dart');

  try {
    await db.open();
    print('Connected to the database');

    productsCollection = db.collection('products');

    runApp(MyApp());
  } catch (e) {
    print('Error connecting to the database: $e');
    // Handle error connecting to the database
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: SplashScreen(),
    );
  }
}

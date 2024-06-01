import 'package:flutter/material.dart';
import 'package:product_app/dbHelper/mongodb.dart';
import 'package:product_app/pages/homepage.dart';
import 'package:product_app/screens/dashboard.dart';
import 'package:product_app/screens/splash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MongoDatabase.Connect();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Trial(),
    );
  }
}

class Trial extends StatefulWidget {
  const Trial({super.key});

  @override
  State<Trial> createState() => _TrialState();
}

class _TrialState extends State<Trial> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text("Helloow"),
    );
  }
}

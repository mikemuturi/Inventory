import 'package:flutter/material.dart';
import 'package:product_app/screens/dashboard.dart';
import 'package:product_app/screens/product.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'HomePage',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => DashboardScreen()));
            },
            icon: Icon(
              Icons.navigate_before,
              size: 22,
              color: Colors.white,
            )),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 50,
          ),
          Row(
            children: [
              SizedBox(
                width: 80,
              ),
              Container(
                height: 100,
                width: 100,
                child: const Card(
                  borderOnForeground: true,
                  color: Colors.cyan,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Products"),
                        SizedBox(
                          height: 3,
                        ),
                        Text('10'),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 30),
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AddProductForm()));
                    },
                    child: const Text("AddProduct")),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Divider(
            height: 3,
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}

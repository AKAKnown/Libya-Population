import 'package:flutter/material.dart';
import 'package:flutter_read/views/chart.dart';
import 'package:flutter_read/views/homepage.dart';

import 'main.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MyHomePage(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Chart()),
          );
        },
        tooltip: 'Increment Counter',
        child: const Icon(Icons.insert_chart),
      ),
    );
  }
}

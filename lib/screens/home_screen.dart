import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  static String id = "HomePage";
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text(
          'Home Page '
        ),
      ),
    );
  }
}

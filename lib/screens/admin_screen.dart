import 'package:flutter/material.dart';

import '../constants.dart';

class AdminPage extends StatelessWidget {
  static String id = "AdminPage";
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: KMainColor,
      appBar: AppBar(),
      body: Center(
        child: Text(
            'Admin Page '
        ),
      ),
    );
  }
}

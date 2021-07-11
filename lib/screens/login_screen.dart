import 'package:buy_it_app/screens/signup_screen.dart';
import 'package:buy_it_app/services/auth.dart';
import 'package:buy_it_app/widgets/custom_textfield.dart';
import 'package:buy_it_app/widgets/logo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants.dart';
import 'home_screen.dart';

class LoginScreen extends StatelessWidget {
  static String id = 'LoginScreen';
  late String _email, _password;
  final _auth = Auth();
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: KMainColor,
      body: Form(
        key: _globalKey,
        child: ListView(
          children: [
            Logo(),
            SizedBox(height: height * .1),
            CustomTextField(
              icon: Icons.email,
              onClick: (value){
                _email=value;
              },
              hint: 'Enter Your Email',
            ),
            SizedBox(
              height: height * .02,
            ),
            CustomTextField(
              icon: Icons.lock,
              hint: 'Enter Your Password',
              onClick: (value){
                _password=value;
              },
            ),
            SizedBox(
              height: height * .05,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 150),
              child: Builder(
                builder: (context)=>MaterialButton(
                  color: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  onPressed: ()async {
                    try {
                      _globalKey.currentState!.save();
                      print(_email);
                      print(_password);
                      final _authrResult = await _auth.SignIn(_email, _password);
                      Navigator.pushNamed(context, HomePage.id);
                    } catch (e) {
                      Scaffold.of(context).showSnackBar(
                        SnackBar(
                          content: Text(e.toString()),
                        ),
                      );
                    }

                  },
                  child: Text(
                    'Login',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: height * .05,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  ' Don\'t Have An Account  ',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, SignUPScreen.id);
                  },
                  child: Text(
                    ' Sign Up  ',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

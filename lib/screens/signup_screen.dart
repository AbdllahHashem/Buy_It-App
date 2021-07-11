import 'package:buy_it_app/provider/model_hud.dart';
import 'package:buy_it_app/screens/login_screen.dart';
import 'package:buy_it_app/services/auth.dart';
import 'package:buy_it_app/widgets/custom_textfield.dart';
import 'package:buy_it_app/widgets/logo.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

import '../constants.dart';
import 'home_screen.dart';

class SignUPScreen extends StatelessWidget {
  static String id = "SignUPScreen";
  late String _email, _password;
  final _auth = Auth();
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return  Scaffold(
        backgroundColor: KMainColor,
        body: ModalProgressHUD(
          inAsyncCall: Provider.of<ModelHud>(context).isLoading ,
          child: Form(
            key: _globalKey,
            child: ListView(
              children: [
                Logo(),
                SizedBox(height: height * .1),
                CustomTextField(
                  icon: Icons.perm_identity,
                  hint: 'Enter Your Name',
                  onClick: (value) {},
                ),
                SizedBox(
                  height: height * .02,
                ),
                CustomTextField(
                  icon: Icons.email,
                  hint: 'Enter Your Email',
                  onClick: (value) {
                    _email = value;
                  },
                ),
                SizedBox(
                  height: height * .02,
                ),
                CustomTextField(
                  icon: Icons.lock,
                  hint: 'Enter Your Password',
                  onClick: (value) {
                    _password = value;
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
                      onPressed: () async {
                        final modelHud=Provider.of<ModelHud>(context,listen: false);
                        modelHud.changeisloading(true);
                        if (_globalKey.currentState!.validate()) {
                          try {
                            _globalKey.currentState!.save();
                            print(_email);
                            print(_password);
                            final _authrResult =
                            await _auth.SignUp(_email, _password);
                            modelHud.changeisloading(false);
                            Navigator.pushNamed(context, HomePage.id);
                          } catch (e) {
                            modelHud.changeisloading(false);
                            Scaffold.of(context).showSnackBar(
                              SnackBar(
                                content: Text(e.toString()),
                              ),
                            );
                          }
                        }
                        modelHud.changeisloading(false);
                      },
                      child: Text(
                        'Sign Up',
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
                      ' Do Have An Account  ',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, LoginScreen.id);
                      },
                      child: Text(
                        ' Login ',
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
        ),

    );
  }
}

import 'package:flutter/material.dart';

import '../constants.dart';

class CustomTextField extends StatelessWidget {

  final String hint;
  final IconData icon;
  final  Function  onClick;
  String? _errMessage(String str)
  {
    switch(hint)
    {
      case 'Enter Your Name' : return 'Name is Empty !';
      case 'Enter Your Password' : return 'Password is Empty !';
      case 'Enter Your Email' : return 'Email is Empty !';
    }
  }
  CustomTextField({
    required this.hint,
    required this.icon,
    required  this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: TextFormField(
        obscureText: hint=='Enter Your Password'? true : false,
        validator: (value){
          if(value!.isEmpty)
            {
              return _errMessage(hint);
            }
        },
        onSaved: (value){
          onClick(value);
        } ,
        cursorColor: KMainColor,
        decoration: InputDecoration(
          hintText: hint,
          prefixIcon: Icon(
            icon,
            color: KMainColor,
          ),
          filled: true,

          fillColor: KSecondaryColor,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(
              color: Colors.white,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(
              color: Colors.white,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(
              color: Colors.white,
            ),
          ),

        ),
      ),
    );
  }
}

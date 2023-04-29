import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextInputType textInputTypee;
  final bool isPassword;
  final String hinttextt;
  final TextEditingController? controller;
 String? Function(String?)? validatorr;
 CustomTextField({Key? key, required this.hinttextt,required this.isPassword,required this.textInputTypee, this.controller,required this.validatorr, }) : super(key: key);
 

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator:validatorr ,
      controller: controller,
              keyboardType:textInputTypee,
              obscureText: isPassword,
              decoration: InputDecoration(
                hintText: hinttextt,
               
                enabledBorder:OutlineInputBorder(borderSide:Divider.createBorderSide(context), ) ,
               
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey),
                  
                ),
                
                contentPadding: EdgeInsets.all(8),
              ),
    );
  }
}
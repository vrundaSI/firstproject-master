import 'package:flutter/material.dart';
import 'package:flutter/services.dart';




class CustomTextField extends StatelessWidget {
  final TextInputType keyboardType;
  final FormFieldValidator validator;
  final String hintText,title;
  final bool isValue,isRadius;
  final bool obSecure;
  final TextEditingController controller;
  CustomTextField({Key key, this.keyboardType, this.validator, this.obSecure, this.hintText, this.controller, this.title, this.isValue,  this.isRadius}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        SizedBox(height: 5,),
        TextFormField(obscureText: obSecure,

          textAlign: isValue == true ? TextAlign.center : TextAlign.start,

          controller: controller,
          validator: validator,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            hintText: hintText,
            isDense: true,
            border: OutlineInputBorder(
                borderRadius: isRadius == true ?  BorderRadius.circular(10) :BorderRadius.circular(30)
            ),
            focusedBorder:   OutlineInputBorder(
                borderRadius: isRadius == true ?  BorderRadius.circular(10) :BorderRadius.circular(30)
            ),
            enabledBorder: OutlineInputBorder(
                borderRadius: isRadius == true ?  BorderRadius.circular(10) :BorderRadius.circular(30)
            ),
            errorBorder:  OutlineInputBorder(
                borderRadius: isRadius == true ?  BorderRadius.circular(10) :BorderRadius.circular(30)
            ),
            disabledBorder: InputBorder.none,

          ),
        ),
      ],
    );
  }
}





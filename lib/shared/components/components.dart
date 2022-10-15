import 'package:flutter/material.dart';

Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType type,
  bool isPassword=false,
  GestureTapCallback? onTap,
  ValueChanged? onsubmit,
  FormFieldValidator<String>? validate,
  required String label,
   IconData? suffix,
  required IconData prefix,
  VoidCallback? suffixPressed
})=>
    TextFormField(
     controller:controller,
    keyboardType: type,
    obscureText:isPassword ,
    onTap:onTap ,
    onFieldSubmitted:onsubmit ,
    validator:validate,
      decoration: InputDecoration(
          labelText:label,
          suffixIcon:suffix!=null?
          IconButton(
            onPressed:suffixPressed ,
            icon: Icon(suffix),
          ):null,
          prefixIcon: Icon(prefix),
        border: OutlineInputBorder()
),
    );

Widget defaultButton({
  required VoidCallback function,
  required String text,
  double witdth=double.infinity,
  Color color=Colors.blue
})=>MaterialButton(
  onPressed: (){},
  child: Text(text),
  minWidth:witdth ,
  color: color,
);
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InputField extends StatelessWidget{
  final String text;
  final Icon image;
  final bool focus;
  final bool obscure;

  const InputField({
    super.key,
    required this.text,
    required this.image,
    required this.focus,
    required this.obscure,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return TextField(
      autofocus: focus,
      cursorColor: Color(0xFF0ECB81),
      decoration: InputDecoration(
        prefixIcon: Padding(
          padding: EdgeInsets.only(left: 23, right: 15),
          child: image,
        ),
        prefixIconColor: MaterialStateColor.resolveWith((states) =>
        states.contains(MaterialState.focused)
            ? Color(0xFF0ECB81)
            : Color(0xFFBEBEBE)),
        labelText: text,
        labelStyle: TextStyle(color: Color(0xFFBDBDBD), fontSize: 14),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFF0ECB81), width: 1),
          borderRadius: BorderRadius.all(Radius.circular(50)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xFFEBEBEB), width: 1),
          borderRadius: BorderRadius.all(Radius.circular(50)),
        ),
        floatingLabelBehavior: FloatingLabelBehavior.never,
      ),
      obscureText: obscure,
    );
  }
}
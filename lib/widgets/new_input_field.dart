import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewInputField extends StatefulWidget {
  final String text;
  final Icon image;
  final bool focus;
  final bool obscure;
  final TextInputType inputtype;
  final Function(String) onTextChanged;
  final Function(_NewInputFieldState)? onStateSet;
  final String initialText;

  const NewInputField({
    Key? key,
    required this.text,
    required this.image,
    required this.focus,
    required this.obscure,
    required this.inputtype,
    required this.onTextChanged,
    required this.initialText,
    this.onStateSet,
  }) : super(key: key);

  @override
  _NewInputFieldState createState() => _NewInputFieldState();
}

class _NewInputFieldState extends State<NewInputField> {
  late TextEditingController _controller;
  String _textContent = "";

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialText);
    _textContent = widget.initialText;

    _controller.addListener(() {
      widget.onTextChanged(_controller.text);
      setState(() {
        _textContent = _controller.text;
      });
    });
    widget.onStateSet?.call(this);
  }

  @override
  void didUpdateWidget(covariant NewInputField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.initialText != widget.initialText) {
      _controller.text = widget.initialText;
      _textContent = widget.initialText;
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      autofocus: widget.focus,
      cursorColor: Color(0xFF0ECB81),
      decoration: InputDecoration(
        prefixIcon: Padding(
          padding: EdgeInsets.only(left: 23, right: 15),
          child: widget.image,
        ),
        prefixIconColor: MaterialStateColor.resolveWith((states) =>
            states.contains(MaterialState.focused)
                ? Color(0xFF0ECB81)
                : Color(0xFFBEBEBE)),
        labelText: widget.text,
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
      obscureText: widget.obscure,
      keyboardType: widget.inputtype,
      onChanged: _onTextChanged,
    );
  }

  String getEnteredText() {
    return _textContent;
  }

  // _onTextChanged 메서드 추가
  void _onTextChanged(String text) {
    widget.onTextChanged(text);
    setState(() {
      _textContent = text;
    });
  }
}

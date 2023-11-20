import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewInputField extends StatefulWidget {
  final String text;
  final Icon image;
  final bool focus;
  final bool obscure;
  final TextInputType inputtype;
  final Function(String) onTextChanged; // 입력된 텍스트를 알리는 콜백
  final Function(_NewInputFieldState)? onStateSet; // 상태를 저장하는 콜백

  const NewInputField({
    Key? key,
    required this.text,
    required this.image,
    required this.focus,
    required this.obscure,
    required this.inputtype,
    required this.onTextChanged,
    this.onStateSet,
  }) : super(key: key);

  @override
  _NewInputFieldState createState() => _NewInputFieldState();
}

class _NewInputFieldState extends State<NewInputField> {
  final TextEditingController _controller = TextEditingController();

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
      onChanged: (text) {
        // 입력된 텍스트를 알리는 콜백 호출
        widget.onTextChanged(text);
      },
    );
  }

  String getEnteredText() {
    return _controller.text;
  }

  @override
  void initState() {
    super.initState();
    // 상태를 저장하는 콜백이 있을 경우 호출
    widget.onStateSet?.call(this);
  }
}

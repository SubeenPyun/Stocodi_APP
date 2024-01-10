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
  final String initialText;

  const NewInputField({
    Key? key,
    required this.text,
    required this.image,
    required this.focus,
    required this.obscure,
    required this.inputtype,
    required this.onTextChanged,
    required this.initialText, // 생성자에 initialText 매개변수 추가
    this.onStateSet,
  }) : super(key: key);

  @override
  _NewInputFieldState createState() => _NewInputFieldState();
}

class _NewInputFieldState extends State<NewInputField> {
  late TextEditingController _controller;
  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initialText); // 초기값 설정
    // 나머지 initState 코드...

    _controller.addListener(() {
      // 컨트롤러 값이 변경될 때마다 입력된 텍스트를 알리는 콜백 호출
      widget.onTextChanged(_controller.text);
    });
    widget.onStateSet?.call(this);
  }

  @override
  void didUpdateWidget(covariant NewInputField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.initialText != widget.initialText) {
      // initialText 값이 변경될 때 컨트롤러의 텍스트를 업데이트
      _controller.text = widget.initialText;
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
      onChanged: (text) {
        // 입력된 텍스트를 알리는 콜백 호출
        widget.onTextChanged(text);
      },
    );
  }

  String getEnteredText() {
    return _controller.text;
  }
}

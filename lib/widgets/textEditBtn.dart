import 'package:flutter/material.dart';

class TextEditBtn extends StatefulWidget {
  final double frontboxsize;
  final String text;
  final double betweenboxsize;
  final TextInputType inputtype;
  final bool nosee;
  final double height;
  final IconData icon;

  const TextEditBtn({
    required this.icon,
    required this.betweenboxsize,
    required this.text,
    required this.frontboxsize,
    required this.inputtype,
    required this.nosee,
    required this.height,
    Key? key,
  }) : super(key: key);
  @override
  State<TextEditBtn> createState() => _TextEditBtnState();
}

class _TextEditBtnState extends State<TextEditBtn> {
  bool isTyping = false;
  TextEditingController controller = TextEditingController();
  Color ctnColor = const Color(0xFFEBEBEB);
  String coloricon = 'gray';

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      decoration: BoxDecoration(
        border: Border.all(
          color: ctnColor,
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(100),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: widget.frontboxsize,
          ),
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 200),
            child: isTyping
                ? Icon(
                    widget.icon,
                    color: Color(0xFF0ECB81),
                    size: 24,
                  )
                : Icon(
                    widget.icon,
                    color: Color(0xFFBEBEBE),
                    size: 24,
                  ),
          ),
          SizedBox(
            width: widget.betweenboxsize,
          ),
          Expanded(
            child: TextFormField(
              autofocus: true,
              obscureText: widget.nosee,
              keyboardType: widget.inputtype,
              style: const TextStyle(
                color: Color(0xFF191919),
                fontSize: 14,
                fontWeight: FontWeight.w400,
                fontFamily: 'Pretendard Variable',
              ),
              controller: controller,
              onChanged: (text) {
                setState(() {
                  isTyping = text.isNotEmpty;
                  // 사용자가 입력을 시작하면 컨테이너 색상을 변경
                  ctnColor = isTyping
                      ? const Color(0xFF0ECB81)
                      : const Color(0xFFEBEBEB);
                });
              },
              decoration: InputDecoration(
                hintText: widget.text,
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

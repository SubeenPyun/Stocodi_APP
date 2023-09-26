import 'package:flutter/material.dart';

class TextEditBtn extends StatefulWidget {
  final double frontboxsize;
  final String imgName;
  final String text;
  final double betweenboxsize;
  final TextInputType inputtype;
  final bool nosee;

  const TextEditBtn({
    required this.betweenboxsize,
    required this.imgName,
    required this.text,
    required this.frontboxsize,
    required this.inputtype,
    required this.nosee,
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
      height: 56,
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
                ? Image.asset(
                    'assets/images/green_${widget.imgName}.png',
                    width: 24,
                    height: 24,
                    fit: BoxFit.fill,
                  )
                : Image.asset(
                    'assets/images/gray_${widget.imgName}.png',
                    width: 24,
                    height: 24,
                    fit: BoxFit.fill,
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
                color: Color(0xFFBDBDBD),
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

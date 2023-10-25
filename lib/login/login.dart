import 'package:flutter/material.dart';
import 'package:stocodi_app/app.dart';
import '../home.dart';
import '../widgets/inputField.dart';
import 'package:stocodi_app/app.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool? _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(80.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppBar(
                  centerTitle: true,
                  backgroundColor: Colors.white,
                  elevation: 0,
                  leading: Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: IconButton(
                      icon: Image.asset(
                        'assets/images/back.png',
                        width: 10,
                        height: 20,
                      ),
                      onPressed: null,
                    ),
                  ),
                  title: Text(
                    "로그인",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
          body: SingleChildScrollView(
            child: Center(
              child: Container(
                margin: EdgeInsets.all(25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    InputField(
                      focus: true,
                      image: Icon(Icons.mail, size: 20),
                      text: "메일을 입력해주세요",
                      obscure: false,
                    ),
                    SizedBox(height: 12),
                    InputField(
                      focus: true,
                      image: Icon(Icons.lock, size: 20),
                      text: "비밀번호를 입력해주세요",
                      obscure: true,
                    ),
                    SizedBox(height: 12),
                    Padding(
                      padding: EdgeInsets.only(right: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Row(
                              children: [
                                Transform.scale(
                                  scale: 1.2,
                                  child: Checkbox(
                                    checkColor: Colors.white,
                                    activeColor: Color(0xFF9EB2AC),
                                    materialTapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap,
                                    value: _isChecked,
                                    onChanged: (value) {
                                      setState(() {
                                        _isChecked = value;
                                      });
                                    },
                                    side: BorderSide(
                                      color: Color(0xFF9EB2AC),
                                      strokeAlign: 0,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                  ),
                                ),
                                Text(
                                  "아이디 저장",
                                  style: TextStyle(
                                      color: Color(0xFF9EB2AC), fontSize: 14),
                                ),
                              ],
                            ),
                          ),
                          Text(
                            "아이디/비밀번호 찾기",
                            style: TextStyle(
                                color: Color(0xFF9EB2AC), fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 45,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => AppScreen()),
                        );
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Color(0xFF0ECB81)),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        elevation: MaterialStateProperty.all(0),
                      ),
                      child: Container(
                        width: double.infinity,
                        height: 60,
                        decoration: BoxDecoration(
                          color: Color(0xFF0ECB81),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "로그인",
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 45,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => AppScreen()),
                            );
                          },
                          child: Container(
                            width: 70,
                            height: 56,
                            padding: EdgeInsets.all(17),
                            margin: EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(color: Color(0xFFEBEBEB)),
                              image: DecorationImage(
                                image: AssetImage("assets/images/Google.png"),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => AppScreen()),
                            );
                          },
                          child: Container(
                            width: 70,
                            height: 56,
                            padding: EdgeInsets.all(17),
                            margin: EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(color: Color(0xFFEBEBEB)),
                              image: DecorationImage(
                                image: AssetImage("assets/images/Naver.png"),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => AppScreen()),
                            );
                          },
                          child: Container(
                            width: 70,
                            height: 56,
                            padding: EdgeInsets.all(17),
                            margin: EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(color: Color(0xFFEBEBEB)),
                              image: DecorationImage(
                                image:
                                    AssetImage("assets/images/KakaoTalk.png"),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("아직 계정이 없다면"),
                          SizedBox(width: 7),
                          Text(
                            "회원가입",
                            style: TextStyle(
                              color: Color(0xFF0ECB81),
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

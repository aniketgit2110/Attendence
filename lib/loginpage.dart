import 'package:attendence_taker/homeScreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'constant.dart';
import 'dart:core';

double pagewidth = 0;
double pageheight = 0;

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController idController = TextEditingController();
  TextEditingController passController = TextEditingController();
  Color primary = const Color(0xffeef444c);
  late SharedPreferences sharedPreferences;
  @override
  Widget build(BuildContext context) {
    final bool iskeyboardvisible =
        KeyboardVisibilityProvider.isKeyboardVisible(context);
    pagewidth = MediaQuery.of(context).size.height;
    pageheight = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          children: [
            iskeyboardvisible
                ? SizedBox(
                    height: pageheight / 30,
                  )
                : Container(
                    height: pageheight / 1.5,
                    width: pagewidth,
                    decoration: BoxDecoration(
                        color: primary,
                        borderRadius: const BorderRadius.only(
                            bottomRight: Radius.circular(70))),
                    child: Center(
                      child: Icon(Icons.person,
                          color: Colors.white, size: pagewidth / 8),
                    ),
                  ),
            Container(
              margin: EdgeInsets.only(top: pageheight / 15, bottom: 20),
              child: const Text(
                "Login",
                style: klogintextStyle,
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: pagewidth / 30),
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Student ID",
                      style: klogintextStyle.copyWith(
                        fontSize: 20,
                      )),
                  Loginbox("Enter the Student Id", idController, false),
                  const SizedBox(
                    height: 15,
                  ),
                  Text("Password",
                      style: klogintextStyle.copyWith(
                        fontSize: 20,
                      )),
                  Loginbox("Enter the Password", passController, true)
                ],
              ),
            ),
            GestureDetector(
              onTap: () async {
                FocusScope.of(context).unfocus();
                String Id = idController.text.trim();
                String Password = passController.text.trim();
                if (Id.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("Student Id is still Empty")));
                } else if (Password.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Password is still Empty")));
                } else {
                  QuerySnapshot snap = await FirebaseFirestore.instance
                      .collection("Student")
                      .where("Id", isEqualTo: Id)
                      .get();
                  try {
                    if (Password == snap.docs[0]["Password"]) {
                      sharedPreferences = await SharedPreferences.getInstance();
                      sharedPreferences.setString('StudentId', Id).then((_) {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomeScreen()));
                      });
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text("Password is incorrect!")));
                    }
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("Student Id does not exists!"),
                    ));
                  }
                }
              },
              child: Container(
                height: 60,
                width: pagewidth / 2.2,
                decoration: BoxDecoration(
                    color: primary,
                    borderRadius: BorderRadius.all(Radius.circular(32))),
                margin: EdgeInsets.only(top: 40),
                child: const Center(
                  child: Text(
                    "LOGIN",
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Loginbox extends StatelessWidget {
  final bool obscure;
  final String hint;
  final TextEditingController controller;
  Loginbox(this.hint, this.controller, this.obscure);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: pagewidth / 2.4,
      margin: EdgeInsets.only(top: 10),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(12)),
        boxShadow: [
          BoxShadow(color: Colors.black26, blurRadius: 10, offset: Offset(2, 2))
        ],
      ),
      child: TextField(
        obscureText: obscure,
        controller: controller,
        decoration: kTextFieldDecoration.copyWith(hintText: hint),
      ),
    );
  }
}
// InputDecoration(
// icon: Icon(Icons.person, color: Color(0xffee444e), size: 30),
// hintText: hint)

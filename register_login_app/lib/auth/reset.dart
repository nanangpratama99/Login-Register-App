import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

import '../constant/constant.dart';

class ResetPassScreen extends StatefulWidget {
  const ResetPassScreen({super.key});

  @override
  State<ResetPassScreen> createState() => _ResetPassScreenState();
}

class _ResetPassScreenState extends State<ResetPassScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          alignment: Alignment.bottomLeft,
          children: [
            Positioned(
              bottom: -350,
              right: -300,
              left: 0,
              child: Image.asset(
                "assets/oval.png",
                width: 900,
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Image.asset(
                "assets/reset.png",
                width: 900,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 35, left: 20, right: 20),
                  padding:
                      EdgeInsets.only(left: 30, right: 30, top: 45, bottom: 30),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: grey.withOpacity(0.3),
                          blurRadius: 30,
                          spreadRadius: 1,
                          offset: Offset(0, 0)),
                    ],
                  ),
                  child: Form(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _text("New Password"),
                        _passwordField(),
                        _text("Confirm New Password"),
                        _confirmPasswordField(),
                        _resetButton(),
                        _back(context),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // <----------------- Widgets ----------------->
  // text
  Widget _text(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10, top: 15),
      child: Text(
        text,
        style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black45),
      ),
    );
  }

  // password widget
  Widget _passwordField() {
    return TextFormField(
      obscureText: true,
      decoration: InputDecoration(
        label: Text("New Password"),
        hintText: "Input new password",
        suffixIcon: const Icon(Icons.remove_red_eye_outlined),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }

  // confirm password widget
  Widget _confirmPasswordField() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25),
      child: TextFormField(
        obscureText: true,
        decoration: InputDecoration(
          label: Text("Confirm New Password"),
          hintText: "Confirm password",
          suffixIcon: const Icon(Icons.remove_red_eye_outlined),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }

  // reset button
  Widget _resetButton() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          backgroundColor: primColor,
          padding: EdgeInsets.symmetric(vertical: 20),
          fixedSize: Size.fromWidth(MediaQuery.of(context).size.width),
        ),
        onPressed: () {},
        child: Text("Save"),
      ),
    );
  }

  // back
  Widget _back(context) {
    return GestureDetector(
      onTap: () => Navigator.pop(context),
      child: Row(
        children: const [
          Icon(IconlyLight.arrow_left),
          Text("Back"),
        ],
      ),
    );
  }
}

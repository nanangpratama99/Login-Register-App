import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:pinput/pinput.dart';
import 'package:register_login_app/auth/reset.dart';
import 'package:register_login_app/constant/constant.dart';

class ForgotScreen extends StatefulWidget {
  const ForgotScreen({super.key});

  @override
  State<ForgotScreen> createState() => _ForgotScreenState();
}

class _ForgotScreenState extends State<ForgotScreen> {
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
              left: -300,
              right: 0,
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
                "assets/otp.png",
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
                        _text("Enter your Email"),
                        _emailField(),
                        _forgot(),
                        _forgotButton(),
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
      padding: const EdgeInsets.only(bottom: 10),
      child: Text(
        text,
        style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black45),
      ),
    );
  }

  Widget _emailField() {
    return TextFormField(
      decoration: InputDecoration(
        label: Text("Email"),
        hintText: "your-email@email.com",
        suffixIcon: const Icon(Icons.email_outlined),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }

  Widget _forgot() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 20, top: 20),
          child: GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ForgotScreen()));
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _text("Enter your OTP Code"),
                Pinput(
                  length: 5,
                  defaultPinTheme: PinTheme(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      width: 55,
                      height: 55,
                      textStyle: TextStyle(fontSize: 25, color: Colors.grey)),
                ),
                SizedBox(height: 20),
                // resent code
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    Text("Don't receive code? "),
                    Text(
                      "Re Sent",
                      style: TextStyle(
                          fontWeight: FontWeight.w600, color: primColor),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _forgotButton() {
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
        onPressed: () {
          // route page
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => ResetPassScreen()));
        },
        child: Text("Sent"),
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

import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:pinput/pinput.dart';
import 'package:register_login_app/auth/register.dart';
import 'package:register_login_app/auth/register.dart';
import 'package:register_login_app/constant/constant.dart';

import '../screen/main_view.dart';
import 'forgot.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          child: Stack(
            alignment: Alignment.bottomLeft,
            children: [
              Positioned(
                top: -350,
                left: -300,
                right: 0,
                child: Image.asset(
                  "assets/oval.png",
                  width: 900,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    padding: EdgeInsets.only(
                        left: 30, right: 30, top: 45, bottom: 30),
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
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _emailField(),
                          _passwordField(),
                          _loginButton(),
                          _forgot(),
                          _divider(),
                          _sosmed(),
                          _register()
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              _loginUsingNumber()
            ],
          ),
        ),
      ),
    );
  }

  // <----------------- Widgets ----------------->
  Widget _emailField() {
    return TextFormField(
      decoration: InputDecoration(
        label: Text("Email"),
        hintText: "Input Email",
        suffixIcon: Icon(Icons.email_outlined),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }

  Widget _passwordField() {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 20),
      child: TextFormField(
        obscureText: true,
        decoration: InputDecoration(
          label: Text("Password"),
          hintText: "Input Password",
          suffixIcon: Icon(Icons.remove_red_eye_outlined),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }

  Widget _loginButton() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          backgroundColor: primColor,
          padding: EdgeInsets.symmetric(vertical: 20),
          fixedSize: Size.fromWidth(MediaQuery.of(context).size.width),
        ),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => MainView()));
        },
        child: Text("Login"),
      ),
    );
  }

  Widget _loginUsingNumber() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          side: BorderSide(
            color: grey,
          ),
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          padding: EdgeInsets.symmetric(vertical: 20),
          fixedSize: Size.fromWidth(MediaQuery.of(context).size.width),
        ),
        onPressed: () {
          showModalBottomSheet(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20))),
            isScrollControlled: true,
            context: context,
            builder: (context) {
              return Container(
                padding: EdgeInsets.symmetric(horizontal: 30),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25.0),
                    topRight: Radius.circular(25.0),
                  ),
                ),
                height: MediaQuery.of(context).size.height / 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Icon(IconlyLight.arrow_left),
                    ),
                    const Text(
                      "Login With Phone Number",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.black45),
                    ),
                    _form(),
                  ],
                ),
              );
            },
          );
        },
        child: const Text(
          "Login Using Phone Number",
          style: TextStyle(color: grey),
        ),
      ),
    );
  }

  Widget _divider() {
    return Row(children: const [
      Expanded(child: Divider(thickness: 1.5)),
      Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 5,
        ),
        child: Text("OR Login With"),
      ),
      Expanded(child: Divider(thickness: 1.5)),
    ]);
  }

  Widget _sosmed() {
    List<String> sosmed = [
      "assets/apple.png",
      "assets/google.png",
      "assets/facebook.png",
    ];

    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Image.asset(
            sosmed[0],
            width: 30,
          ),
          Image.asset(
            sosmed[1],
            width: 30,
          ),
          Image.asset(
            sosmed[2],
            width: 30,
          ),
        ],
      ),
    );
  }

  Widget _register() {
    return Row(
      children: [
        const Text("Don't have an account? "),
        GestureDetector(
          onTap: () => Navigator.push(context,
              MaterialPageRoute(builder: (context) => RegisterScreen())),
          child: const Text(
            "Register Now",
            style: TextStyle(fontWeight: FontWeight.w600, color: primColor),
          ),
        ),
      ],
    );
  }

  Widget _forgot() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ForgotScreen()));
            },
            child: const Text(
              "Forgot Password",
              style: TextStyle(color: Colors.black54),
            ),
          ),
        ),
      ],
    );
  }

  // LOGIN WITH PHONE NUMBER

  Widget _form() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Form(
          child: Column(
            children: [
              // input phone number
              TextFormField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    label: Text("Phone Number"),
                    prefixIcon: Icon(Icons.phone_android_rounded),
                    hintText: "Input Your Phone Number"),
              ),
              SizedBox(height: 20),
              // otp
              Pinput(
                length: 5,
                defaultPinTheme: PinTheme(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: grey,
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    width: 60,
                    height: 60,
                    textStyle: TextStyle(fontSize: 25, color: grey)),
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
        SizedBox(height: 25),
        // submit button
        ElevatedButton(
          onPressed: () {},
          child: Text("Login"),
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              padding: EdgeInsetsDirectional.symmetric(vertical: 20),
              fixedSize: Size.fromWidth(MediaQuery.of(context).size.width),
              backgroundColor: primColor),
        )
      ],
    );
  }
}

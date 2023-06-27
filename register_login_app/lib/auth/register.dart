import 'package:flutter/material.dart';

import '../constant/constant.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          child: Stack(
            children: [
              Positioned(
                top: -350,
                right: -300,
                left: 0,
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
                        left: 30, right: 30, top: 25, bottom: 30),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
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
                          _logo(),
                          _emailField(),
                          _passwordField(),
                          _confirmPassField(),
                          _registeButton(),
                          _register(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // <----------------- Widgets ----------------->
  Widget _logo() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Image.asset(
        "assets/logo.png",
        width: 100,
      ),
    );
  }

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

  Widget _confirmPassField() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25),
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

  Widget _registeButton() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          backgroundColor: primColor,
          padding: EdgeInsets.symmetric(vertical: 20),
          fixedSize: Size.fromWidth(MediaQuery.of(context).size.width),
        ),
        onPressed: () {},
        child: Text("Register"),
      ),
    );
  }

  Widget _register() {
    return Row(
      children: [
        Text("Already have an account! "),
        GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Text(
            "Login Now",
            style: TextStyle(fontWeight: FontWeight.w600, color: primColor),
          ),
        ),
      ],
    );
  }
}

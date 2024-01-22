import 'package:enchant_attire/screens/Authentication/Signup.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:enchant_attire/common_widgets/applogo_widgets.dart';
import 'package:enchant_attire/common_widgets/button.dart';
import 'package:enchant_attire/common_widgets/custom_widgets.dart';
import 'package:enchant_attire/consts/consts.dart';
import 'package:enchant_attire/screens/home.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key});

  @override
  State<LoginScreen> createState() => _LoginState();
}

class _LoginState extends State<LoginScreen> {
  GlobalKey<FormState> form_key = GlobalKey<FormState>();
  TextEditingController usercontroller = TextEditingController();
  TextEditingController passcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double textFieldWidth = MediaQuery.of(context).size.width * 0.9;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Form(
            key: form_key,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: appLogoWidget(),
                  ),
                ),
                const SizedBox(
                  height: 6,
                ),
                const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      'Login',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: enchant,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                customTextField(
                  hint: emailhint,
                  title: username,
                  textInputType: TextInputType.multiline,
                  controller: usercontroller,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter email';
                    }
                    if (!EmailValidator.validate(value)) {
                      return 'Please enter a valid email';
                    }

                    return null;
                  },
                ),
                customTextField(
                  hint: password,
                  title: password,
                  textInputType: TextInputType.multiline,
                  obscureText: true,
                  controller: passcontroller,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Enter password';
                    } else if (value.length < 6) {
                      return 'Password must be at least 6 characters';
                    } else if (!RegExp(r'^(?=.*?[a-zA-Z])(?=.*?[0-9]).{6,}$')
                        .hasMatch(value)) {
                      return 'Password must contain at least one letter and one number';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 15),
                CustomButton(context, textFieldWidth, login, onPressed: () {
                  if (form_key.currentState!.validate()) {
                    Get.off(Home());
                  }
                }),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text.rich(TextSpan(
                      text: "Forgot password",
                      style: const TextStyle(
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          // Navigate to Forgot Password screen.
                        },
                    ))
                  ],
                ),
                const SizedBox(height: 60),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don't have an account? ",
                      style: TextStyle(color: Colors.black),
                    ),
                    Text.rich(
                      TextSpan(
                        text: 'SignUp',
                        style: const TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Get.off(SignUp());
                          },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

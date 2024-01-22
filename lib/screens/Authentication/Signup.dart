import 'package:enchant_attire/common_widgets/button.dart';
import 'package:enchant_attire/common_widgets/custom_widgets.dart';
import 'package:enchant_attire/consts/consts.dart';
import 'package:enchant_attire/screens/Authentication/login_screen.dart';
import 'package:flutter/gestures.dart';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  GlobalKey<FormState> form_key = GlobalKey<FormState>();
  TextEditingController emailEditingController = TextEditingController();
  TextEditingController passEditingController = TextEditingController();
  TextEditingController cnpEditingController = TextEditingController();

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
                    child: Image.asset(
                      offllogo,
                      width: 200,
                      height: 200,
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Create your account',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                customTextField(
                  hint: emailhint,
                  title: username,
                  textInputType: TextInputType.multiline,
                  controller: emailEditingController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'enter email';
                    }
                    if (!EmailValidator.validate(value)) {
                      return 'Please enter a valid email';
                    }

                    return null;
                  },
                ),
                const SizedBox(height: 10),
                customTextField(
                    hint: passwordHint,
                    title: password,
                    textInputType: TextInputType.multiline,
                    obscureText: true,
                    controller: passEditingController,
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
                    }),
                const SizedBox(height: 10),
                customTextField(
                    hint: passwordHint,
                    title: cnfrm,
                    textInputType: TextInputType.multiline,
                    obscureText: true,
                    controller: cnpEditingController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Enter Password';
                      }
                      if (value != passEditingController)
                        return 'Password does not match';
                      return null;
                    }),
                const SizedBox(height: 10),
                CustomButton(context, textFieldWidth, signup, onPressed: () {
                  if (form_key.currentState!.validate()) {
                    //registrationController.registerwithEmail();
                  }
                }),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Have an account? ',
                      style: TextStyle(color: Colors.black),
                    ),
                    Text.rich(
                      TextSpan(
                        text: 'Login',
                        style: const TextStyle(
                          color: Colors.blue,
                          decoration: TextDecoration.underline,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const LoginScreen()));
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

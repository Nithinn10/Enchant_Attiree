import 'package:enchant_attire/common_widgets/applogo_widgets.dart';
import 'package:enchant_attire/consts/consts.dart';
import 'package:enchant_attire/screens/home.dart';
import 'package:enchant_attire/screens/Authentication/login_screen.dart';
import 'package:enchant_attire/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  changeScreen() {
    Future.delayed(Duration(seconds: 3), () {
      Get.to(() => Home());//change here when password is available
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    changeScreen();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Image.asset(icSplashBg, width: 100),
            ),
            appLogoWidget(),
            SizedBox(
              height: 10,
            ),
            Spacer(),
            credits.text.black.fontFamily(semibold).make(),
            SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
  }
}

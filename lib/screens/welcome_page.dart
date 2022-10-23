import 'package:drugs_app/screens/login_page.dart';
import 'package:drugs_app/utils/colors.dart';
import 'package:drugs_app/utils/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding:
              const EdgeInsets.only(left: 32, right: 32, bottom: 55, top: 114),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                MyImages.imageWelcome,
                width: 258,
                height: 258,
              ),
              const SizedBox(
                height: 34,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 35),
                child: Text(
                  "Welcome to MedTech",
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w700,
                      color: MyColors.c_090F47,
                      letterSpacing: 0.7),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 59),
                child: Text(
                  "Do you want some help with your health to get better life?",
                  style: TextStyle(
                      height: 1.5,
                      fontSize: 14,
                      color: MyColors.c_090F47.withOpacity(0.45),
                      fontWeight: FontWeight.w300,
                      letterSpacing: 0.7),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: 34,
              ),
              Container(
                width: 311,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(56),
                  color: MyColors.c_4157FF,
                ),
                child: const Center(
                  child: Text(
                    "SIGN UP WITH EMAIL",
                    style: TextStyle(
                        color: MyColors.c_FFFFFF,
                        fontSize: 16,
                        letterSpacing: 0.7,
                        fontWeight: FontWeight.w700),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: 311,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(56),
                  border: Border.all(width: 0.5, color: Colors.grey),
                ),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        MyImages.iconFacebook,
                        width: 18,
                        height: 18,
                      ),
                      const SizedBox(
                        width: 21,
                      ),
                      Text(
                        "CONTINUE WITH FACEBOOK",
                        style: TextStyle(
                            color: MyColors.c_090F47.withOpacity(0.75),
                            fontSize: 13,
                            letterSpacing: 0.7,
                            fontWeight: FontWeight.w700),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                width: 311,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(56),
                  border: Border.all(width: 0.5, color: Colors.grey),
                ),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        MyImages.iconGoogle,
                        width: 18,
                        height: 18,
                      ),
                      const SizedBox(
                        width: 19,
                      ),
                      Text(
                        "CONTINUE WITH GOOGLE",
                        style: TextStyle(
                            color: MyColors.c_090F47.withOpacity(0.75),
                            fontSize: 13,
                            letterSpacing: 0.7,
                            fontWeight: FontWeight.w700),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) => const LoginPage()));
                },
                child: Text("LOGIN",
                    style: TextStyle(
                        color: MyColors.c_090F47.withOpacity(0.45),
                        fontSize: 14,
                        letterSpacing: 0.7,
                        fontWeight: FontWeight.w400),
                    textAlign: TextAlign.center),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

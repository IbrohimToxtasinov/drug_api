import 'package:drugs_app/screens/category_Listing.dart';
import 'package:drugs_app/screens/onboarding_page.dart';
import 'package:drugs_app/utils/colors.dart';
import 'package:drugs_app/utils/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashPage1 extends StatefulWidget {
  const SplashPage1({super.key});

  @override
  State<SplashPage1> createState() => _SplashPage1State();
}

class _SplashPage1State extends State<SplashPage1> {
  @override
  void initState(){
    super.initState();
    Future.delayed(
      const Duration(seconds: 5),
      () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const OnboardingPage())),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  color: MyColors.c_2F80ED,
                  child: SvgPicture.asset(MyImages.iconBackground, fit: BoxFit.cover,),
                ),
                Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Positioned(
                        child: Container(
                          width: 100,
                          height: 100,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle
                          ),
                          child: Center(
                            child: SvgPicture.asset(MyImages.iconLighting, width: 50,height: 50,),
                          ),
                        ), 
                      ),
                      const SizedBox(height: 20,),
                      SvgPicture.asset(MyImages.iconMedtech, width: 120,height: 30,),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}



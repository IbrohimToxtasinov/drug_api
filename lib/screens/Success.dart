import 'package:drugs_app/screens/category_Listing.dart';
import 'package:drugs_app/utils/colors.dart';
import 'package:drugs_app/utils/images.dart';
import 'package:flutter/material.dart';

class SuccessPage extends StatefulWidget {
  const SuccessPage({super.key});

  @override
  State<SuccessPage> createState() => _SuccessPageState();
}

class _SuccessPageState extends State<SuccessPage> {
  void initState(){
    super.initState();
    Future.delayed(
      const Duration(seconds: 3),
      () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const DrugsPage())),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 180,),
              Image.asset(MyImages.imageSuccess, width: 245, height: 196,),
              const SizedBox(height: 57,),
              const Text("Thank you", style: TextStyle(color: MyColors.c_090F47, fontSize: 24, fontWeight: FontWeight.w700),),
              const SizedBox(height: 16,),
              const Padding(
                padding: EdgeInsets.only(right: 50, left: 50),
                child: Text("Your Order will be delivered with invoice #9ds69hs. You can track the delivery in the                                                      order section.", style: TextStyle(color: MyColors.c_090F47, fontSize: 14, fontWeight: FontWeight.w400),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
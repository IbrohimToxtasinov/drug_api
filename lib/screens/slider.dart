import 'package:drugs_app/utils/colors.dart';
import 'package:flutter/material.dart';

class SliderPage extends StatelessWidget {
  final String title;
  final String description;
  final String image;
  const SliderPage(
      {super.key,
      required this.title,
      required this.description,
      required this.image});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            image,
            width: width * 0.6,
          ),
          const SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 80),
            child: Text(
              title,
              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.w700, color: MyColors.c_090F47, letterSpacing: 0.7),textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 80),
            child: Text(
              description,
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
            height: 60,
          ),
        ],
      ),
    );
  }
}

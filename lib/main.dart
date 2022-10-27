import 'package:drugs_app/datas/shared_preferens.dart';
import 'package:drugs_app/models/drugs/korzinka_model.dart';
import 'package:drugs_app/screens/Success.dart';
import 'package:drugs_app/screens/cart_page.dart';
import 'package:drugs_app/screens/category_Listing.dart';
import 'package:drugs_app/screens/home_page.dart';
import 'package:drugs_app/screens/onboarding_page.dart';
import 'package:drugs_app/screens/splash_page1.dart';
import 'package:drugs_app/screens/welcome_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  StorageRepository.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: const SplashPage1(),
    );
  }
}

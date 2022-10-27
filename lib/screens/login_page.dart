import 'package:drugs_app/datas/shared_preferens.dart';
import 'package:drugs_app/screens/create_account.dart';
import 'package:drugs_app/screens/home_page.dart';
import 'package:drugs_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}
final _formkey = GlobalKey<FormState>();
final controller1 = TextEditingController();
final controller2 = TextEditingController();
class _LoginPageState extends State<LoginPage> {
  bool isvisiblity = true;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formkey,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            physics: const NeverScrollableScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.only(left: 29, top: 30, right: 32),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.arrow_back_sharp,
                      size: 30,
                      color: MyColors.c_090F47,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      "Welcome Back",
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 24,
                          color: MyColors.c_090F47),
                    ),
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  buildTextField("Username", Icons.person, false, false,
                      TextInputAction.next, "Enter your Username", controller1),
                  const SizedBox(
                    height: 50,
                  ),
                  buildTextField("Password", Icons.lock, true, isvisiblity,
                      TextInputAction.done, "Enter your Password", controller2),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(),
                      Text(
                        "Forgot?",
                        style: TextStyle(
                            color: MyColors.c_090F47.withOpacity(0.45),
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  InkWell(
                    onTap: () async {
                      if(_formkey.currentState!.validate()) {
                          print(controller1.text);
                          await StorageRepository.saveString("name", controller1.text);
                          await StorageRepository.saveString("password", controller1.text);
                        saveLogin(context);
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Successfully Logined')),
                        );
                      }
                    },
                    child: Container(
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                        color: MyColors.c_4157FF,
                        borderRadius: BorderRadius.circular(56),
                      ),
                      child: const Center(
                        child: Text(
                          "LOGIN",
                          style: TextStyle(
                              color: MyColors.c_FFFFFF,
                              fontSize: 16,
                              letterSpacing: 0.7,
                              fontWeight: FontWeight.w700),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Center(
                    child: TextButton(
                      onPressed: () {
                        //Navigator.pushReplacement(context,
                            //MaterialPageRoute(builder: (_) => const CreateAccountPage()));
                      },
                      child: Text("< Don’t have an account? Sign Up",
                          style: TextStyle(
                              color: MyColors.c_090F47.withOpacity(0.45),
                              fontSize: 14,
                              letterSpacing: 0.7,
                              fontWeight: FontWeight.w400),
                          textAlign: TextAlign.center),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTextField(String name, IconData icon, bool scht, bool obsecure,
      TextInputAction choose, String errorname,TextEditingController controller) {
    return TextFormField(
      controller: controller,
      style: const TextStyle(color: Colors.black),
      keyboardType: TextInputType.text,
      textInputAction: choose,
      obscureText: obsecure,
      validator: (value) {
            if(value == null || value.isEmpty) {
              return errorname;
            }
            return null;
          },
      decoration: InputDecoration(
        suffixIcon: scht
            ? IconButton(
                onPressed: () {
                  setState(() {
                    isvisiblity = !isvisiblity;
                  });
                },
                icon: isvisiblity
                    ? const Icon(Icons.visibility_off)
                    : const Icon(Icons.visibility))
            : const Icon(
                Icons.person_add_alt,
                color: Colors.white,
              ),
        prefixIcon: Icon(
          icon,
          color: MyColors.c_090F47,
          size: 30,
        ),
        hintText: name,
        hintStyle: TextStyle(color: MyColors.c_090F47.withOpacity(0.45)),
        enabledBorder: UnderlineInputBorder(
          borderSide:
              BorderSide(width: 2, color: MyColors.c_090F47.withOpacity(0.1)),
        ),
      ),
    );
  }
  void saveLogin(context) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setBool("LoginedIn", true);

    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const HomePage()));
  }
}

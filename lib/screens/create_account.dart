import 'package:drugs_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CreateAccountPage extends StatefulWidget {
  const CreateAccountPage({super.key});

  @override
  State<CreateAccountPage> createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  bool isvisiblity = true;
  final _formkey = GlobalKey<FormState>();
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
                    onPressed: (
                    ) {
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
                      "Create your account",
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 24,
                          color: MyColors.c_090F47),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  buildTextField("Your Name", false, false,
                      TextInputAction.next, "Enter your Name"),
                  const SizedBox(
                    height: 30,
                  ),
                  buildTextField("Mobile Number", false, false,
                      TextInputAction.next, "Enter your Mobile Number"),
                  const SizedBox(
                    height: 30,
                  ),
                  buildTextField("Email", false, false,
                      TextInputAction.next, "Enter your Email"),
                  const SizedBox(
                    height: 30,
                  ),
                  buildTextField("Password", true, isvisiblity,
                      TextInputAction.done, "Enter your Password"),
                  const SizedBox(
                    height: 24,
                  ),
                  InkWell(
                    onTap: () {
                      if(_formkey.currentState!.validate()){
                    
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
                          "CREATE ACCOUNT",
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
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const CreateAccountPage()));
                      },
                      child: Text("< Already have account?  Login",
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

  Widget buildTextField(String name, bool scht, bool obsecure,
      TextInputAction choose, String errorname) {
    return TextFormField(
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
        labelText: name,
        hintStyle: TextStyle(color: MyColors.c_090F47.withOpacity(0.45)),
        enabledBorder: UnderlineInputBorder(
          borderSide:
              BorderSide(width: 2, color: MyColors.c_090F47.withOpacity(0.1)),
        ),
      ),
    );
  }
}

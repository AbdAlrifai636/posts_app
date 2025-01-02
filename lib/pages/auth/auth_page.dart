import 'package:albarakah/models/auth/auth_model.dart';
import 'package:albarakah/pages/home_page.dart';
import 'package:albarakah/services/services.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
 late GlobalKey<FormState> formKey;
 late TextEditingController email;
 late TextEditingController password;
 late Services services ;
late bool passwordVisible;
 late RegExp regex;
@override
  void initState() {
    super.initState();
    formKey = GlobalKey<FormState>();
    email = TextEditingController();
    password = TextEditingController();
    services= Services();
    regex  = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    passwordVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                SizedBox(
                  height: 100.0,
                ),
                SizedBox(
                    height: 100,
                    width: 100,
                    child: Image(
                        image: NetworkImage(
                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcStWHLaNhJB5STL4cIPjyxVlbFY4KtOiSHrqw&s"))),
                SizedBox(
                  height: 50,
                ),
                SizedBox(
                    width: 280,
                    height: 80,
                    child: TextFormField(
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return 'Email cannot be empty';
                        } /*else if (!regex.hasMatch(text)) {
                          return 'Enter a valid email';
                        } */else {
                          return null;
                        }
                      },
                      controller: email,
                      cursorWidth: 1.0,
                      cursorColor: Color(0xff8A8D91),
                      cursorRadius: const Radius.circular(12),
                      decoration: InputDecoration(
                        hoverColor: Colors.green,
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color(0xff8A8D91), width: 1.0),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12)),
                        hintText: "Email or UserName",
                        hintStyle: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff8A8D91)),
                      ),
                    )),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                    width: 280,
                    height: 80,
                    child: TextFormField(
                      controller: password,
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return 'Password cannot be empty';
                        } else if (text.length < 8) {
                          return 'Password must be at least 8 characters long';
                        } else {
                          return null;
                        }
                      },
                      obscureText: !passwordVisible,
                      cursorWidth: 1.0,
                      cursorColor: Color(0xff8A8D91),
                      cursorRadius: const Radius.circular(12),
                      decoration: InputDecoration(
                        suffixIcon:IconButton(
                            onPressed: (){
                              setState(() {
                                passwordVisible =!passwordVisible;
                              });
                            },
                            icon: FaIcon(passwordVisible? FontAwesomeIcons.eye: FontAwesomeIcons.eyeSlash)) ,
                        hoverColor: Colors.green,
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              color: Color(0xff8A8D91), width: 1.0),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12)),
                        hintText: "Password",
                        hintStyle: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff8A8D91)),
                      ),
                    )),
                SizedBox(
                  height: 30,
                ),
                InkWell(
                  onTap: () async {
                    if (formKey.currentState!.validate()) {
                      final success = await services.logIn(AuthModel(
                          username: email.text, password: password.text));
                      if (success) {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => HomePage()));
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text("Failed try again"),
                          backgroundColor: Colors.red,
                        ));
                      }
                    }
                  },
                  child: Container(
                    width: 280,
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.amber),
                    child: Center(
                        child: Text(
                      "Login",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold),
                    )),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                InkWell(
                    onTap: () {},
                    child: Text(
                      "Forget Password ?",
                      style: TextStyle(
                          color: Colors.amber,
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                    )),
                SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  child: Divider(),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  width: 280,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.blueAccent,
                  ),
                  child: Center(
                      child: Text(
                    "Create new account",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:gasolinerapp/screens/home_screen.dart';
import 'package:gasolinerapp/screens/register_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  getIcon() {
    Icon(Icons.password);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          padding: EdgeInsets.only(top: 20),
          child: Column(
            children: [
              Image.asset("assets/logo.png"),
              const Padding(
                padding: EdgeInsets.only(right: 210, top: 30),
                child: Text(
                  "Login",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(right: 50, top: 20, left: 50),
                  child: TextFormField(
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.email, color: Colors.grey[700]),
                        hintText: 'Email ID',
                        hintStyle: const TextStyle(
                          fontWeight: FontWeight.bold,
                        )),
                  )),
              Padding(
                  padding: const EdgeInsets.only(right: 50, top: 20, left: 50),
                  child: TextFormField(
                    decoration: InputDecoration(
                        hintText: 'Password',
                        hintStyle: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                        prefixIcon:
                            Icon(Icons.password, color: Colors.grey[700]),
                        suffixText: "Forgot?"),
                  )),
              Container(
                margin: const EdgeInsets.only(top: 20),
                height: 50,
                width: 300,
                decoration: BoxDecoration(
                    color: Colors.red, borderRadius: BorderRadius.circular(20)),
                child: FlatButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => HomeScreen()));
                  },
                  child: Text(
                    'Login',
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                ),
              ),
              Container(
                height: 50,
                alignment: Alignment.center,
                child: Text(
                  "Or, login with",
                  style: TextStyle(
                    fontWeight: FontWeight.w100,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: Image.network(
                            "https://cdn.pixabay.com/photo/2015/12/11/11/43/google-1088004_1280.png")),
                    IconButton(
                        onPressed: () {},
                        icon: Image.network(
                            "https://e7.pngegg.com/pngimages/662/783/png-clipart-facebook-inc-social-media-computer-icons-social-network-facebook-blue-text.png")),
                    IconButton(
                        onPressed: () {},
                        icon: Image.network(
                            "https://w7.pngwing.com/pngs/755/534/png-transparent-apple-logo-apple-heart-logo-monochrome.png"))
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  Text("New on EnergiasBaratas?"),
                  TextButton(
                    onPressed: (){
                      Navigator.push(context,
                        MaterialPageRoute(builder: (_) => RegisterScreen()));
                    },
                    child: Text(
                      "Register",
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  )
                ],
              )
            ],
          )),
    );
  }
}

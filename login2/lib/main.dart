import 'package:login2/style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final ButtonStyle style =
        ElevatedButton.styleFrom(textStyle: const TextStyle(fontSize: 15));

    final TextStyle textStyleDefault = TextStyle(
        color: Colors.white, fontSize: 14.0, fontWeight: FontWeight.bold);

    // ignore: dead_code
    return Scaffold(
      body: Container(
        child: Stack(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: new BoxDecoration(
                  image: new DecorationImage(
                      image: new AssetImage(
                        "assets/images/fondo.png",
                        
                      ),
                      fit: BoxFit.cover)),
            ),
            Container(
                margin: EdgeInsets.only(top: 50, left: 330),
                
                child: TextButton(
                    child: Text(
                      'Skip',
                      style: DamStyle.textTitleCustom(
                        
                          DamStyle.primaryColor, DamStyle.textSizeSmall),
                    ),
                    onPressed: () {})),
            Container(
              padding: EdgeInsets.all(8.0),
              margin: EdgeInsets.all(100),
              width: 250,
              child: Image.network("https://i.pinimg.com/736x/88/9e/4e/889e4e0106ffe4105c297778dd6ff29d--animal-logo-red-bull.jpg"),
            ),
            Container(
              margin: const EdgeInsets.only(top: 250, left: 20),
              child: Text(
                "Sign in to get the most of",
                style: DamStyle.textTitleCustom(
                    DamStyle.primaryColor, DamStyle.textSizeBig),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 300, left: 120),
              child: Text(
                "Red Bull",
                style: DamStyle.textTitleCustom(
                    DamStyle.primaryColor, DamStyle.textSizeBig),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 350, left: 70),
              child: Text(
                "Create an account to save favorites and ",
                style: DamStyle.textTitleCustom(
                    DamStyle.primaryColor, DamStyle.textSizeSmall),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 370, left: 50),
              child: Text(
                "download videos to watch anytime you want.",
                style: DamStyle.textTitleCustom(
                    DamStyle.secondaryColor, DamStyle.textSizeSmall),
              ),
            ),
            Container(
                height: 40,
                margin: EdgeInsets.only(top: 470),
                child: Center(
                    child: SignInButton(
                  Buttons.Google,
                  text: "Continue with Google",
                  onPressed: () {},
                ))),
            Container(
                height: 40,
                margin: EdgeInsets.only(top: 420),
                child: Center(
                    child: SignInButton(
                  Buttons.Facebook,
                  text: "Continue with Facebook",
                  elevation: 2,
                  onPressed: () {},
                ))),
            Container(
                height: 40,
                margin: EdgeInsets.only(top: 520),
                child: RaisedButton(
                  padding: EdgeInsets.symmetric(vertical: 10.0),
                  textColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),

                  ),
                  color: Colors.black,
                  // ignore: avoid_print
                  onPressed: () => print("ey olvidonaaa"),
                  hoverColor:   Colors.black,

                  child: const Center(
                    child: Text("Continuar con gmail"),
                    widthFactor: 3,
                    
                  ),

                  

                    
                ))],
        ),
        )
    );
      
      
  }
}
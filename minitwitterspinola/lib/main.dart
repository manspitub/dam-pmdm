
import 'package:flutter/material.dart';
import 'package:minitwitterspinola/pages/LogInButton.dart';
import 'package:minitwitterspinola/pages/login_page.dart';
import 'package:minitwitterspinola/pages/register_page.dart';

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

    return Scaffold(
      
      body: SafeArea(
        
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                  ),
                  Image.network("http://assets.stickpng.com/images/580b57fcd9996e24bc43c53e.png", height: 200, width: 200,),
                  Text("Mira lo que pasa en el mundo ahora mismo", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),)
                ],
              ),
              Column(
                children: [

                    
                    
                      RoundedButton(
                      btnText: 'LOG IN',
                      onBtnPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginPage()));
                      }),
                  SizedBox(
                    height: 30,
                  ),
                  RoundedButton(
                     btnText: 'Create account',
                      onBtnPressed: () {
                       /* Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RegistrationScreen()));
                      */}),

                  
                ],
              )
            ],
          
          ),
          
        )
        ),

    );
  }
}



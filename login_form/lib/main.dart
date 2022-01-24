import 'package:flutter/material.dart';
import 'package:login_form/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Auth',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
        scaffoldBackgroundColor: Colors.grey[350]
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
 

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Stack(

      children: [
        Container(
          color: Colors.white,
          
        ),
         Container(
  height: double.infinity,
  width: double.infinity,
  decoration: BoxDecoration(
    color: Colors.grey[300],
    borderRadius: BorderRadius.only(
      bottomRight: Radius.circular(30),
      bottomLeft: Radius.circular(30),
      topLeft: Radius.circular(30),
      topRight: Radius.circular(30)
    ),
    boxShadow: [
      BoxShadow(
        color: Color(0xAA6EB1E6),
        offset: Offset(9, 9),
        blurRadius: 6,
      ),
    ],
  ),
  
),
 Container(
              height: 300,
              width: 360,
              margin: EdgeInsets.all(10),
              alignment: Alignment.topCenter,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(50),
                  bottomLeft: Radius.circular(50),
                  
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50)
                ),
                color: Colors.white12,
                
                
                image: new DecorationImage(

                  alignment: Alignment.center,
                  image: NetworkImage("https://cdn.dribbble.com/users/2220178/screenshots/9529760/media/435769847907f965b5e75d952b089281.jpg?compress=1&resize=400x300"),
                  fit: BoxFit.fill
                  ), 

   ),
  ) ,
  Center(
    child: Container(
      width: 250,
      margin: EdgeInsets.only(top: 200, left: 40,),
      child: Text("Discover your Dream job Here", style: TextStyle(color: Colors.black, decoration: TextDecoration.none, fontSize: 25, fontWeight: FontWeight.bold),),
    ),


    ),

    Center(
      child: Container(
      width: 290,
      margin: EdgeInsets.only(top: 320, left: 30,),
      child: Text("Explore all the most exciting job rules based on your  interest And study mayor", style: TextStyle(color: Colors.grey[700], decoration: TextDecoration.none, fontSize: 15, fontWeight: FontWeight.bold, fontFamily: 'Arial'),),
    ),
    ),

    Container(
  margin: EdgeInsets.only(top: 500, left: 40),
  width: 300,
  height: 50,
  alignment: Alignment.centerLeft,
  decoration: BoxDecoration(
    color: Colors.grey[200], //blue
    borderRadius: BorderRadius.circular(45),

  ),
  child: Container(
    width: 210,
    height: 90,
    decoration: BoxDecoration(
      color: Colors.white, //light blue
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(45),
        bottomLeft: Radius.circular(45),
      ),
    ),
    alignment: Alignment.center,
    child: Text(
      'Challenge',
      style: TextStyle(
        fontSize: 14,
        color: Colors.black,
        decoration: TextDecoration.none 
      ),
    ),
  ),
)
  ],


    
     
      
            
            
            
            
            
            
          
    );
  }
}

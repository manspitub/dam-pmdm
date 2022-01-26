import 'package:flutter/material.dart';

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
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.white,
        title: new Text("Erik Howell", style: TextStyle(color: Colors.black),),
    leading: new Padding(
      padding: const EdgeInsets.all(8.0),
      child: new Material(
        color: Colors.grey[300],
        child: Image.network("https://todonexus.com/wp-content/uploads/Que-significa-la-mujer-sin-rostro-de-WhatsApp-300x300.png", ),
        shape: new CircleBorder(),

    ),
  
    ),
    
    actions: [

      Container(
        margin: EdgeInsets.only(right: 15),
        child: CircleAvatar(
          backgroundImage: Image.network("https://elamigoinformaticoblog.files.wordpress.com/2019/01/cast-icon-chromecast.jpg").image,
          foregroundColor: Colors.grey,

        ) 
      )
    ],
    )
    );
  }
}

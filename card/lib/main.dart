import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

TabController controller;

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
      backgroundColor: Colors.grey,
      appBar: AppBar(
          flexibleSpace: FadeInImage(
            image: const AssetImage('assets/background.jpg'),
            fit: BoxFit.cover,
            placeholder: const AssetImage('assets/background.jpg'),
          ),
          leading: Builder(builder: (BuildContext) {
            return IconButton(
              onPressed: () => print('hey q ase'),
              icon: const Icon(Icons.arrow_back_ios),
            );
          }),
          title: const Text(
            'Viaje A Londres',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          actions: <Widget>[
            IconButton(
              onPressed: () => print('hey q ase'),
              icon: new Icon(Icons.share),
            )
          ]),
      body: Container(
          decoration: BoxDecoration(
              color: Colors.grey[600], borderRadius: BorderRadius.circular(20)),
          width: 200,
          height: 50,
          margin: EdgeInsets.only(left: 120, top: 40),
          child: new Center(
            child: new Text(
              "domingo 11 mar",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          )),
          drawer: TabBarView(
            controller: controller,
          ),
          
    );
   
   
  }
  
}

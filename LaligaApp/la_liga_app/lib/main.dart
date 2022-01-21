import 'package:flutter/material.dart';
import 'package:la_liga_app/fixture_screen.dart';
import 'package:la_liga_app/home_screen.dart';
import 'package:la_liga_app/profile_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      
      title: 'Liga Santander',
      theme: ThemeData.dark(),
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
  
  int _selected = 0;

  List<Widget> _widget = <Widget>[
    HomeScreen(),
    Fixture(),
    ProfileScreen()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selected = index;
    });
  }
  

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: _widget.elementAt(_selected),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.grey[800],
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.sports_soccer_outlined),
            label: 'Soccer',
            
            
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          
          ),

        ],
        currentIndex: _selected,
        selectedItemColor: Colors.red,
        onTap: _onItemTapped,
      ),
    );
  }
}

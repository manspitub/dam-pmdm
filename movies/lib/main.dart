import 'package:flutter/material.dart';
import 'package:movies/pages/home_screen.dart';
import 'package:movies/pages/popular_screen.dart';

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
  
  int _selected = 0;

  List<Widget> _widget = <Widget>[
    HomeScreen(),
    PopularScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selected = index;
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: _widget.elementAt(_selected),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.grey[800],
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.upcoming),
            label: 'Upcoming',
          
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.movie_sharp),
            label: 'Popular movies',
            
            
          ),
          

        ],
        currentIndex: _selected,
        selectedItemColor: Colors.red,
        onTap: _onItemTapped,
      ),
    );
  }
      
    
  
}

import 'dart:convert';

import 'package:evaluacion_flutter/detail.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'models/popular.dart';

void main() {
  runApp(const MyApp());
}

late Future<List<Popular>> items = fetchPopular();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: '/',
      routes: {'/home': (context) => const HomePage()},
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
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    Text('hey q ase migue')
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.image),
              label: 'Hola',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.black,
          onTap: _onItemTapped,
        ));
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    late Future<List<Popular>> items = fetchPopular();


    return Column(


      children: [
        
        SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 100,


          child: Container(
            alignment: Alignment.bottomLeft,
            padding: EdgeInsets.only(left: 20, right: 10),

            child: Text('Most popular Actors all over the world', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),textAlign: TextAlign.left,),
          ),

        ),
        SizedBox(
          height: 20,


          child: Container(
            alignment: Alignment.bottomLeft,
            padding: EdgeInsets.only(left: 20, right: 10),

            child: Text('March 2020', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 10, color: Colors.grey[600]),textAlign: TextAlign.left,),
          ),
          
        ),

        FutureBuilder<List<Popular>>(
          
          future: items,

          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return popularList(snapshot.data!);
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            return const CircularProgressIndicator();
          },
        ),
      ],
      
    );
  }
}



Future<List<Popular>> fetchPopular() async {
  const String apiKey = '6f3f957d9d8dc6a98fed68a333b8209c';

  final response = await http.get(Uri.parse(
      'https://api.themoviedb.org/3/person/popular?api_key=$apiKey&language=en-US&page=1'));

  if (response.statusCode == 200) {
    return PopularResponse.fromJson(jsonDecode(response.body)).results;
  } else {
    throw Exception('Failed to load Popular');
  }
}

Widget popularList(List<Popular> popular) {
  return SizedBox(
    height: 300,
    child: ListView.builder(
        itemCount: popular.length,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return popularItem(popular.elementAt(index), index, context);
          
        },
        ),
        
  );
}

Widget popularItem(Popular popular, int index, BuildContext context) {
  return Container(
    
      child: Padding(
        
          padding: EdgeInsets.all(3),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(140),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 10,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: CircleAvatar(

              
                radius: 97,
                backgroundImage: NetworkImage(
                    'https://image.tmdb.org/t/p/w500/${popular.profilePath}'),

              ),
            ),
            SizedBox(
              height: 5,
            ),

            TextButton(
             
              onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const DetailsPopular(),
              settings: RouteSettings(
                arguments: fetchPopular(),
              )));
            }, child:  Text(
              popular.name,
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  decoration: TextDecoration.none),
            ),
            ),
           
           
            SizedBox(
              height: 5,
            ),
            Text(
              
              popular.name,
              style: TextStyle(
                  color: Colors.grey[600],
                  decoration: TextDecoration.none,
                  fontSize: 15),
                  
            ),
            SizedBox(
              height: 20,
            ),
          ])));
}

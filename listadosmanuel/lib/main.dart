import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:listadosmanuel/cartel_principal.dart';
import 'package:listadosmanuel/models/personaje_response.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Listado pelis',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Listado pelis'),
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

  late Future<List<Person>> items = fetchPeople();

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.

    
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: <Widget>[
          Cartel(),
          SizedBox(
            height: 110.0,
            child: ListView(
              scrollDirection: Axis.horizontal,

              children:  <Widget>[
                
                Center(child: FutureBuilder<List<Person>>(
              future: items,
              builder: (context, snapshot){
                if(snapshot.hasData){
                  return _personajeList(snapshot.data!);
                } else if(snapshot.hasError){
                  return Text('${snapshot.error}');
                }

                return const CircularProgressIndicator();
              },
            
          ),)
               
              ],
            ),
          )
        ],
      ),
    );
  }

  Future<List<Person>> fetchPeople() async {
    final response = await http.get(Uri.parse('https://swapi.dev/api/people'));
    if (response.statusCode == 200) {
      return PeopleResponse.fromJson(jsonDecode(response.body)).results;
    } else {
      throw Exception('Failed to load people');
    }
  }
   Widget _personajeItem(Person person, int index) {
    String personId = person.url.split('/')[5];
    String personName = person.name;
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      textDirection: TextDirection.rtl,
      
      children: <Widget>[
        Container(
          height: 110.0,
          width: 110.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(110.0),
            border: Border.all(
              color: Colors.yellow,
              width: 2.0
            )
          ),
          child: ClipOval(
            child: Image.network('http://starwars-visualguide.com/assets/img/characters/$personId.jpg', fit: BoxFit.cover,),
          ),
        ),
        Text(personName, style: TextStyle(color: Colors.white, wordSpacing: 5, fontSize: 10),)
      ],
    );
  }
       Widget _personajeList(List<Person> peopleList) {
    return SizedBox(
      height: 270,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: peopleList.length,
        itemBuilder: (context, index) {
          return _personajeItem(peopleList.elementAt(index), index);
        },
      ),
    );
  }

  



}

import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:listadosmanuel/cartel_principal.dart';
import 'package:listadosmanuel/imgBottom.dart';
import 'package:listadosmanuel/models/personaje_response.dart';
import 'package:http/http.dart' as http;
import 'package:listadosmanuel/models/planets_response.dart';

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

  late Future<List<Planetas>> elementos = fetchPlanets();

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.

    
    return Scaffold(
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
             DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.black
              ),
              child: Text("Star Wars", style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),),
              
               ),
               ListTile(

                 title: Text("Planetas", style: TextStyle(color: Colors.black),),
                 onTap: () {
                   
                 },
               ),
               ListTile(
                 title: Text("Personajes", style: TextStyle(color: Colors.black),),
                 onTap: () {
                   Navigator.pop(context);
                 }
               )
          ],
        ),
      ),
      backgroundColor: Colors.black,
      body: ListView(
        children: <Widget>[
          Cartel(),
          
          SizedBox(
            height: 110.0,
            child: ListView(
              scrollDirection: Axis.horizontal,

              children:  <Widget>[

                Text("Personajes", style: TextStyle(color: Colors.white),),
                
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


            
          ),),
          
               
              ],
            ),
          ),
          Center(child: FutureBuilder<List<Planetas>>(
              future: elementos,
              builder: (context, snapshot){
                if(snapshot.hasData){
                  return _planetList(snapshot.data!);
                } else if(snapshot.hasError){
                  return Text('${snapshot.error}');
                }

                return const CircularProgressIndicator();
              },


            
          ),)
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
      
      
      
      children: <Widget>[
        Container(

        
          margin: EdgeInsets.only(left: 20, bottom: 20, right: 20),
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
        Text(personName, style: TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold),)
      ],
    );
  }
       Widget _personajeList(List<Person> peopleList) {
    return SizedBox(

      height: 270,
     
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

   Widget _planetList(List<Planetas> peopleList) {
    return SizedBox(

      height: 270,
     
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: peopleList.length,
        itemBuilder: (context, index) {
          return _planetItem(peopleList.elementAt(index), index);
        },
      ),
    );
  }

  Widget _planetItem(Planetas planet, int index) {
    String planetId = planet.url.split('/')[5];
    String personName = planet.name;
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      
      
      
      children: <Widget>[
        Container(

        
          margin: EdgeInsets.only(left: 20, bottom: 20, right: 20),
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
            
            child: Image.network('https://starwars-visualguide.com/assets/img/planets/$planetId.jpg', fit: BoxFit.cover,),
          ),
        ),
        Text(personName, style: TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold),)
      ],
    );
  }

  Future<List<Planetas>> fetchPlanets() async {
    final response = await http.get(Uri.parse('https://swapi.dev/api/planets'));
    if (response.statusCode == 200) {
      return PlanetasResponse.fromJson(jsonDecode(response.body)).results;
    } else {
      throw Exception('Failed to load planets');
    }





  



}
}
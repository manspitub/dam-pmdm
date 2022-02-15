import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'models/popular.dart';

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
  late Future<Popular> items = fetchPopular();
  @override
  Widget build(BuildContext context) {

    return Center(
      child: TextButton(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
        ),
        onPressed: () {
          Navigator.pushNamed(context, '/home');
        },
        child: Text('Popular'),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  
  const HomePage({Key? key}) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    return Container(child: Text('data'),);
  }
}

Future<Popular> fetchPopular() async{

  const String apiKey = '6f3f957d9d8dc6a98fed68a333b8209';

  final response = await http
  .get(Uri.parse('https://api.themoviedb.org/3/person/popular?api_key=$apiKey&language=en-US&page=1'));

  if(response.statusCode == 200){
    return Popular.fromJson(jsonDecode(response.body));
  } else{
    throw Exception('Failed to load Popular');
  }
}

Widget popularItem(Popular popular, int index){
  return Card(
    child: Text(popular.name),
  );
}


Widget popularList(Popular popular){
   return SizedBox(
     height: 160,
    child: ListView.builder(
      itemBuilder: (context, index) {
        return popularItem(popular, index);
      }
      ),
    

   );
   //No me ha dao tiempo :(
}

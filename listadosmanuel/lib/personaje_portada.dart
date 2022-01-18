import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:listadosmanuel/main.dart';
import 'package:listadosmanuel/models/personaje_response.dart';

import 'package:http/http.dart' as http;

class Personaje extends StatefulWidget {
  const Personaje({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  PersonajePortada createState() => PersonajePortada();
}

class PersonajePortada extends State<Personaje>{
  
    late Future<List<Results>> items = fetchPersonajes();

  @override
  void initState() {
    super.initState();
  }



  
  
  

  @override
  Widget build(BuildContext context) {
    return  
    Scaffold(

      body: Center(child: FutureBuilder<List<Results>>(
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
          
        );
      
    
  }

    Widget _personajeList(List<Results> pokemonList) {
    return ListView.builder(
      itemCount: pokemonList.length,
      itemBuilder: (context, index) {
        return _personajeItem(pokemonList.elementAt(index));
      },
    );
  }

  Widget _personajeItem(Results pokemon) {
    return ClipOval(child: Image.network(getPhotoUrl(pokemon), fit: BoxFit.cover,));
  }

  getPhotoUrl(Results person) {
    List<String> personId = person.url.split("/"[5]);

    String result = personId.join("");
    return "https://starwars-visualguide.com/assets/img/characters/"+result+".jpg";
  }

  Future<List<Results>> fetchPersonajes() async {
    final response =
        await http.get(Uri.parse('https://swapi.dev/api/people'));
    if (response.statusCode == 200) {
      return PersonajeResponse.fromJson(jsonDecode(response.body)).results;
    } else {
      throw Exception('Failed to load personajes');
    }
  }

 

  
  
}


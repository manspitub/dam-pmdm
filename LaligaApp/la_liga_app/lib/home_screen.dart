
import 'dart:convert';
import 'dart:html';
import 'dart:async';

import 'dart:io';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:la_liga_app/models/topscorers.dart';

class HomeScreen  extends StatelessWidget {
  

   late Future<List<TopScoresrs>> items = fetchPlayers();



  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height:  800,
        margin: EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              height: 395,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.white12,
                image: new DecorationImage(
                  image: NetworkImage("https://assets.laliga.com/assets/logos/laliga-santander-v-negativo/laliga-santander-v-negativo-1200x1200.jpg"),
                  fit: BoxFit.cover
                  ), 
                  

              ),
              child: Column(
                children: [
                  Container(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Center(
                          child: Text("TOP SCORER",
                        textAlign: TextAlign.center,

                        style: TextStyle(
                          color: Colors.amber, 
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 10,
                          
                        ),
                        ),),

                        Icon(Icons.notifications_on_rounded, size: 50, color: Colors.amber,)
                        
                        
                ],
                  )
              ),
              SizedBox(
                height: 30,
              ),
                      Center(child: FutureBuilder<List<TopScoresrs>>(
                        future: items,
                        builder: (context, snapshot){
                          if(snapshot.hasData){
                            return _playerList(snapshot.data!);

                          } else if(snapshot.hasError){
                              return Text('${snapshot.error}');
                          }
                          return const CircularProgressIndicator();
                        }
                      )
                      )],
                
              ),
             
        )])
            ),
          );

  }
}

  Future<List<TopScoresrs>> fetchPlayers() async {
    final response = await http.get(Uri.parse('https://api-football-beta.p.rapidapi.com/players/topscorers?season=2020&league=140'), Headers(HttpHeaders.a) ) ;
    

    if (response.statusCode == 200) {
      return TopScorersResponse.fromJson(jsonDecode(response.body)).response;
    } else {
      throw Exception('Failed to load players');
    }
  }

  Widget _playerItem(TopScoresrs topScoresrs, int index){
    return Text(topScoresrs.player.age.toString());
   
  }

Widget _playerList(List<TopScoresrs> topScorers) {
   return Container(
      margin: EdgeInsets.only(left: 20, right: 20),
      height: 85,
      decoration: BoxDecoration(
        color: Colors.amber,
        borderRadius: BorderRadius.circular(20),

      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Padding(
              padding: EdgeInsets.all(17.0),
              child: Container(
                padding: EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(13.0),
                  color: Colors.black87,

                ),

      
     
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemCount: topScorers.length,
        itemBuilder: (context, index) {
          return _playerItem(topScorers.elementAt(index), index);
        },
      ),
    ),
            ),
          ),
        ]
      )
      );
        
            
  }
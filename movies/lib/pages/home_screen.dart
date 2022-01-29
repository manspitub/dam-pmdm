import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:movies/models/upcoming.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:movies/services/api_service.dart';
import 'package:http/http.dart' as http;



class HomeScreen extends StatelessWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    late Future<List<Upcoming>> items = getUpcomingMovies();

    ApiService();
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Icon(Icons.menu, color: Colors.black,),
        title: Text("Movie DB".toUpperCase(), style: TextStyle(color: Colors.black45, fontSize: 20, fontWeight: FontWeight.bold, fontFamily: 'mali')),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 15),
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/images/logo.jpg'),
            ),
          )
        ],

        
      ),
      body: ListView(
        children: <Widget>[
          SizedBox(
            height: 110.0,
            child: ListView(
              scrollDirection: Axis.horizontal,

              children: <Widget>[
                Text("Upcoming movies", style: TextStyle(color: Colors.black),),

                Center(
                  child: FutureBuilder<List<Upcoming>>(
                    future: items,
                    builder: (context, snapshot){
                      if(snapshot.hasData){
                        return _buildBody(context, snapshot.data!);
                      } else if(snapshot.hasError){
                        return Text('${snapshot.error}');
                      }

                      return const CircularProgressIndicator();
                    },
                  ))
              ],
            ),
          ),
          
        ],
      )
    );
      
    
  }

  Widget _buildBody(BuildContext context, List<Upcoming> movies){
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints){
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListView.builder(
                      itemCount: movies.length,
                      itemBuilder: (context, index){
                        return _movieItem(movies.elementAt(index), index); 
                      } 
                        )
                  ],
                )
              ],
            ),
          ),
        );
      }
      );
  }

  Widget _movieItem(Upcoming movie, int index){
    return Stack(
      alignment: AlignmentDirectional.bottomCenter,
      children: <Widget>[
        ClipRRect(
          child: Image.network('https://image.tmdb.org/t/p/original/${movie.backdropPath}'),
          borderRadius: BorderRadius.all(
            Radius.circular(10),

          ),
        ),
        Padding(padding: EdgeInsets.only(
          bottom: 15,
          left: 15,
        ),
        child: Text(movie.title.toUpperCase(), 
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 18,
          fontFamily: 'muli'
        ),
        overflow: TextOverflow.ellipsis,
        ),


        ),
        
      ],
    );
  }

  final String baseUrl = 'https://api.themovie.org/3';
  final String apiKey = '6f3f957d9d8dc6a98fed68a333b8209c';

  Future<List<Upcoming>> getUpcomingMovies() async {
    
      final response = await http.get(Uri.parse('https://api.themoviedb.org/3/movie/upcoming?api_key=$apiKey&language=en-US&page=1'));
       if (response.statusCode == 200) {
      return UpcomingResponse.fromJson(jsonDecode(response.body)).results;
    } else {
      throw Exception('Failed to load people');
    }
    
  }
  


}
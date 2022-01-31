import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:movies/models/upcoming.dart';

import 'package:movies/services/api_service.dart';
import 'package:http/http.dart' as http;



class HomeScreen extends StatelessWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    late Future<List<Upcoming>> items = getUpcomingMovies();

    ApiService();
    
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Icon(Icons.menu, color: Colors.white,),
        title: Text("Movie DB".toUpperCase(), style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold, fontFamily: 'mali')),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 15),
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/images/logo.jpg'),
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 20),
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/images/logo.jpg'),
            ) ,
          )
        ],

        
      ),
      body: ListView(
        children: <Widget>[
          Row(
            
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(padding: EdgeInsets.all(30)),
              Text('Upcoming Movies', style: TextStyle(
                color: Colors.white,
                fontSize: 30, fontWeight: FontWeight.bold,
              ),),
              FloatingActionButton(
                hoverColor: Colors.blue,
                backgroundColor: Colors.black26,
                child: Text('View All', textAlign: TextAlign.center,),
                onPressed: () {}),
            ]),

            SizedBox(
              height: 300,
              child: ListView(
                padding: EdgeInsets.all(10.0),
                scrollDirection: Axis.horizontal,

                children: <Widget>[

                  Padding(padding: const EdgeInsets.all(10.0),),

                  Center(child: FutureBuilder<List<Upcoming>>(
              future: items,
              builder: (context, snapshot){
                if(snapshot.hasData){
                  return _movieList(snapshot.data!);
                } else if(snapshot.hasError){
                  return Text('${snapshot.error}');
                }

                return const CircularProgressIndicator();
              },)
                  )],
              ),
              
            ),
            Container(
              padding: EdgeInsets.all(10),
            ),

            SizedBox()
                
                  

                

                    

                    

                      
                    

                     
                  
                  
                
            ],
          
          

        
      ),
    );
      
    
  }

  Widget _movieList( List<Upcoming> movies){
    return SizedBox(
      
      height: 400,
      child: ListView.builder(
        padding: EdgeInsets.all(10.0),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: movies.length,
        itemBuilder: (context, index){
        
        return _movieItem(movies.elementAt(index), index);
      }),
    );
  }

  Widget _movieItem(Upcoming movie, int index){
     return Stack(
       
       alignment: AlignmentDirectional.bottomEnd,
       children: [

         Container(
         margin: EdgeInsets.all(10.0),
         padding: const EdgeInsets.all(10.0),
         alignment: AlignmentDirectional.bottomCenter,
         height: 300,
         width: 160,
         decoration: BoxDecoration(
           borderRadius: BorderRadius.circular(10),
           image: DecorationImage(
             fit: BoxFit.cover,
             image: NetworkImage(
               'https://image.tmdb.org/t/p/original/${movie.backdropPath}'
             ),
           )
         ),
         child: Text(movie.title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white, ),textAlign: TextAlign.center,),
         
       ),
       Row(
         
       ),
       Column(
         crossAxisAlignment: CrossAxisAlignment.center,
        
         children: [
           Icon(Icons.star, color: Colors.yellowAccent,),
           Text(movie.popularity.toString(), style: TextStyle(fontWeight: FontWeight.bold, color: Colors.yellowAccent, fontSize: 10),),
         ],
         )
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
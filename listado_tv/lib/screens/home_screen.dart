import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:listado_tv/models/serie.dart';
import 'package:listado_tv/models/series.dart';
import 'package:listado_tv/repository/serie_repository_impl.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:listado_tv/repository/series_repository_impl.dart';

import 'details_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<Results>> series = SeriesRepositoryImpl().fetchSeries();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.only(left: 20.0, right: 16.0),
            height: 48.0,
            child: Row(
              children: [
                const Expanded(
                  flex: 1,
                  child: Text(
                    'Series TV',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 16.0,
                      fontFamily: 'Muli',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const Icon(Icons.tv, color: Colors.blue),
    
              ],
            ),
          ),
          SizedBox(
            height: 400,
            child: ListView(
              children: [
                  Center(child: FutureBuilder<List<Results>>(
                future: series,
                builder: (context, snapshot){
                  if(snapshot.hasData){
                    return _serieList(snapshot.data!);
                  } else if(snapshot.hasError){
                    return Text('${snapshot.error}');
                  }
    
                  return const CircularProgressIndicator();
                },
                  ))],
              
                
    
              
              padding: const EdgeInsets.only(left: 16.0, right: 16.0),
              scrollDirection: Axis.horizontal,
             
        
            ),
          ),
        ],
      ),
    );
  }
  Widget _serieList(List<Results> resultados){
  return SizedBox(
    height: 400,

    child: ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: resultados.length,

      itemBuilder: (context, index) {
        return _serieItem(resultados.elementAt(index), index);
      }),
  );
}

Widget _serieItem(Results peli, int index){
  final width = MediaQuery.of(context).size.width / 2.6;
    return Container(
      width: 300,
      height: 300,
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Card(
        elevation: 10.0,
        borderOnForeground: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: SizedBox(
          
          width: 400,
          height: 900,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>  DetailsScreen( id: peli.id,)));
              },
              child: CachedNetworkImage(
                
                placeholder: (context, url) => const Center(
                  child: CircularProgressIndicator(),
                ),
                imageUrl: 'https://image.tmdb.org/t/p/w500${peli.posterPath}',
                width: width,
                height: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}




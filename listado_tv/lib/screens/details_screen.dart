import 'package:flutter/material.dart';
import 'package:listado_tv/models/serie.dart';
import 'package:listado_tv/models/serie_image.dart';
import 'package:listado_tv/models/serie_videos.dart';
import 'package:listado_tv/repository/serie_image_repository_impl.dart';
import 'package:listado_tv/repository/serie_repository_impl.dart';
import 'package:listado_tv/repository/serie_videos_repository_impl.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({Key? key, required this.id}) : super(key: key);

  final int id;

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  final _serieData = SerieRepositoryImpl();
  final _serieImageData = SerieImageRepositoryImpl();

  late SerieResponse? _serie = null;
  late SerieImageResponse? _serieImage = null;

  @override
  void initState() {
    super.initState();
    _init();
  }

  void _init() async {
    final serieResponse = await _serieData.fetchSerie(widget.id);
    final serieImageResponse = await _serieImageData.fetchSerieImage(widget.id);

    setState(() {
      _serie = serieResponse;
      _serieImage = serieImageResponse;
    });
  }

  /*_getSerie(){
    FutureBuilder<SerieResponse>(
      future: serie,
      builder: (context, snapshot){
        if (snapshot.hasData){
          return serie(context, snapshot.data!);
        } else if(snapshot.hasError){
            
          return Text('${snapshot.error}');

        }
          return const CircularProgressIndicator();
      },
    );
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.only(left: 20.0, right: 16.0),
          height: 48.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
            Expanded(
              flex: 1,
              child: Text(
                _serie!.name,
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 30.0,
                  fontFamily: 'Muli',
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Text(_serie!.firstAirDate), 
            const Icon(Icons.tv, color: Colors.blue),
          ])),
          SizedBox(
            height: 400,
            child: ListView(
              children: [

                
                
              
                
    
              
              padding: const EdgeInsets.only(left: 16.0, right: 16.0),
              scrollDirection: Axis.horizontal,
             
        
            ),
          ),

    ]));
  }
}

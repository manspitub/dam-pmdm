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
  late Future<SerieResponse> serie =
      SerieRepositoryImpl().fetchSerie(widget.id);

  late Future<SerieImageResponse> serieImage =
      SerieImageRepositoryImpl().fetchSerieImage(widget.id);
  late Future<SerieVideos> serieVideo =
      SerieVideosRepositoryImpl().fetchSerieVideos(widget.id);

  late SerieResponse? _serieResponse = null;
  late SerieImageResponse? _serieImageResponse = null;
  late SerieVideos? _serieVideos = null;

  void init() async {
    final serieResponse = await serie;
    final serieImagen = await serieImage; 
    final serieVideos = await serieVideo;
    setState(() {
      _serieResponse = serieResponse;
      _serieImageResponse = serieImagen;
      _serieVideos = serieVideos;
    });
  }

  @override
  Widget build(BuildContext context) {
    init();
    return Scaffold(body: _serieView(context));
  }

  Widget _serieView(BuildContext context) {
    return Column(children: [
      Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.only(left: 20.0, right: 16.0),
        height: 48.0,
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Text(
                _serieResponse!.name,
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
    ]);
  }
}

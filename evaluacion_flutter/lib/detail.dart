import 'package:evaluacion_flutter/models/popular.dart';
import 'package:flutter/material.dart';

class DetailsPopular extends StatelessWidget {
  const DetailsPopular({ Key? key }) : super(key: key);

  

  @override
  Widget build(BuildContext context) {
    final  popular = ModalRoute.of(context)!.settings.arguments as Future<List<Popular>>;
    return Scaffold();
  }
}
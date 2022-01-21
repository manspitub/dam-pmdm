
import 'dart:convert';


import 'package:flutter/material.dart';
import 'package:listadosmanuel/models/planets_response.dart';
import 'package:listadosmanuel/nav_bar_superior.dart';

class Cartel extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    
    return Column(
      children:  <Widget>[
        
        this.encabezado(),
        this.botonsitos(),
        
     
        
        

        
      ],
    );

  }

  Widget encabezado() {
    return  Stack(
          children: <Widget>[
            Image.network("https://wallpaper.org.es/walls/2015/04/fondo-pantalla-star-wars-7.jpg", height: 280, width: 400, fit: BoxFit.cover,),
            Container(
              width: double.infinity,
              height: 300.0,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.center,
                  end: Alignment.bottomCenter,
                  colors: <Color> [
                    Colors.black38,
                    Colors.black
                  ]
                )
              ),
            ),
            SafeArea(
              child: NavBarSuperior(),

              )
            
          ],
        );
  }

  Widget botonsitos() {
    return Row(

      mainAxisAlignment: MainAxisAlignment.spaceEvenly,

      children: <Widget>[
        Icon(Icons.check, color: Colors.white, ),
        SizedBox(
          height: 3.0,
        ),
        Text("Personajes List", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
        ButtonBar(children: [
          Icon(Icons.info_rounded, color: Colors.white,),
          Text("info", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),)
        ],),
        
        Icon(Icons.tv, color: Colors.white),
        Text("View on Tv", style: TextStyle(color: Colors.white, fontFamily: "Arial", fontWeight: FontWeight.bold),)
      ],
    );
  }
  
  
}
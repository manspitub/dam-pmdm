

import 'package:flutter/material.dart';

class NavBarSuperior extends StatelessWidget {
  const NavBarSuperior({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(

      mainAxisAlignment: MainAxisAlignment.spaceAround,

      children: <Widget>[
        Image.network("https://brandemia.org/sites/default/files/sites/default/files/icono_netflix_nuevo.jpg", width: 75, height: 75,),
        Text('Planetas', style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),),
        Text('Personajes', style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold))
      ],
    );
  }
  
}
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    
    return Container(
      height: 120.0,
      width: 120.0,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage("https://upload.wikimedia.org/wikipedia/commons/3/3c/IMG_logo_%282017%29.svg"),
          fit: BoxFit.fill,
        ),
        shape: BoxShape.circle,
      ),
    );
  }
}
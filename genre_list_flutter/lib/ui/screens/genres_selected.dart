import 'package:flutter/material.dart';

class GenresSelected extends StatefulWidget {
  
    
    List<int> idsSelected ;

   GenresSelected( { Key? key, required this.idsSelected }) : super(key: key);

  @override
  State<GenresSelected> createState() => _GenresSelectedState();
}

class _GenresSelectedState extends State<GenresSelected> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(widget.idsSelected.toString()+""),
      ),
    );
  }
}
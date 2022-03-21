import 'package:flutter/material.dart';

class LuzScreen extends StatefulWidget {
  const LuzScreen({ Key? key }) : super(key: key);

  @override
  State<LuzScreen> createState() => _LuzScreenState();
}

class _LuzScreenState extends State<LuzScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.only(top: 15),
        child: Column(
          children: [
            Row(
              children: [
                Text("Compañías Eléctricas", style: TextStyle(fontSize: 20, color: Colors.blue[600], letterSpacing: 2),),
                Icon(Icons.arrow_circle_down, size: 40,)
              ],
            )
          ],
        ),
      ),
    );
  }
}
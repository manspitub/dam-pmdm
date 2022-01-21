
import 'package:flutter/material.dart';

class HomeScreen  extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height:  800,
        margin: EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              height: 395,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.white12,
                image: new DecorationImage(
                  image: NetworkImage("https://assets.laliga.com/assets/logos/laliga-santander-v-negativo/laliga-santander-v-negativo-1200x1200.jpg"),
                  fit: BoxFit.cover
                  ), 
                  

              ),
              child: Column(
                children: [
                  Container(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Player",
                        style: TextStyle(
                          color: Colors.amber, 
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                        ),
                        ),
                        Text("of the month",
                        style: TextStyle(
                          color: Colors.white, 
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                        
                        ],
                    ),
                  )
                ],
              ),
            )
          ],
          ),
      ),
    );
  }
}
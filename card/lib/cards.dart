import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class CardHome extends StatefulWidget {

    Cards createdState()=> Cards();

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }

  }
  
  
}

class Cards extends State<CardHome> {
  @override
  Widget build(BuildContext context) {
    
   return Scaffold(
        body: ListView.builder(
            itemExtent: 10,
            shrinkWrap: true,
            itemBuilder: (BuildContext context, int index) => Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.0,
                    vertical: 5.0,
                  ),
                  child: Card(
                    elevation: 5.0,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(0.0),
                        side: BorderSide.none),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                width: 55.0,
                                height: 55.0,
                                color: Colors.green,
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                )));
  }
  
}


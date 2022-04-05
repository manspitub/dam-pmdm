import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gasolinerapp/data/mock.dart';
import 'package:gasolinerapp/screens/luz_horas_screen.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;

import '../models/light.dart';
import 'package:http/http.dart' as http;

class LuzScreen extends StatefulWidget {
  const LuzScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<LuzScreen> createState() => _LuzScreenState();
}

class _LuzScreenState extends State<LuzScreen> {
  int selectedIndex = -1;

  getIcon(index) {
    if (companiasLuz[index].price > 0.25) {
      return Icon(
        Icons.arrow_drop_up,
        size: 40.0,
        color: Colors.green,
      );
    } else {
      return Icon(
        Icons.arrow_drop_down,
        size: 40.0,
        color: Colors.red,
      );
    }
  }

  late Future<List<PrecioLuz>> items = fetchLuz();

  /*List precios = await fetchLuz();
  
  
  //Problemas para hacer la media de los precios

  getMedia() {
    for (var i = 0; i < count; i++) {
      
    }
  }*/

  String nowFormatted = DateFormat('dd MMMM').format(DateTime.now());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.only(
          top: 15,
        ),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  "Compañías Eléctricas",
                  style: TextStyle(
                      fontSize: 20, color: Colors.blue[600], letterSpacing: 2),
                ),
                Icon(
                  Icons.arrow_circle_down,
                  size: 40,
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Card(
                    color: Colors.orange,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              "Precio Medio",
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            Padding(
                              padding: EdgeInsets.all(15.0),
                              child: Container(
                                child: ElevatedButton.icon(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (_) =>
                                                  LuzHorasScreen()));
                                    },
                                    icon: Icon(Icons.arrow_drop_down),
                                    label: Text(
                                      "0.40",
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    )),
                                width: 100,
                                height: 20,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              nowFormatted,
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height,
              child: GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: companiasLuz.length,
                itemBuilder: ((context, index) {
                  return SizedBox(
                    height: 200,
                    child: Card(
                      shape: (selectedIndex == index)
                          ? RoundedRectangleBorder(
                              side: BorderSide(color: Colors.green))
                          : null,
                      elevation: 5,
                      child: InkWell(
                        onTap: () => setState(() => selectedIndex = index),
                        child: SizedBox(
                            width: 100,
                            height: 50,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(15.0),
                                  child: Image.asset(
                                    'assets/${companiasLuz[index].logo}',
                                    width: 89,
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.all(15.0),
                                      child: Container(
                                        child: ElevatedButton.icon(
                                            onPressed: () {
                                              print(
                                                  "Estás interesado en esta compañía?");
                                            },
                                            icon: getIcon(index),
                                            label: Text(
                                              companiasLuz[index]
                                                  .price
                                                  .toString(),
                                              style: TextStyle(
                                                  fontSize: 25,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold),
                                            )),
                                        width: 150,
                                        height: 40,
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Column(
                                      children: [
                                        ElevatedButton.icon(
                                            style: ButtonStyle(
                                                backgroundColor:
                                                    MaterialStateProperty.all(
                                                        Colors.red)),
                                            onPressed: () {
                                              showDialog(
                                                  context: context,
                                                  builder: (BuildContext
                                                          context) =>
                                                      new AlertDialog(
                                                        title: new Text(
                                                            "Llamar..."),
                                                        content: new Text(
                                                          '¿Estas seguro que quieres llamar a ${companiasLuz[index].phone}?',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                        actions: <Widget>[
                                                          new IconButton(
                                                              onPressed: () {
                                                                UrlLauncher.launch(
                                                                    'tel://${companiasLuz[index].phone}');
                                                              },
                                                              icon: new Icon(
                                                                Icons.phone,
                                                                color: Colors
                                                                    .green,
                                                              )),
                                                          new IconButton(
                                                              onPressed: () {
                                                                Navigator.pop(
                                                                    context);
                                                              },
                                                              icon: new Icon(
                                                                Icons.phone,
                                                                color:
                                                                    Colors.red,
                                                              )),
                                                        ],
                                                      ));
                                            },
                                            icon: Icon(
                                              Icons.phone,
                                              size: 10,
                                              color: Colors.blue,
                                            ),
                                            label: Text(
                                              companiasLuz[index]
                                                  .phone
                                                  .toString(),
                                              style: TextStyle(
                                                  fontSize: 10,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold),
                                            )),
                                        Text(
                                          companiasLuz[index].workTime,
                                          style: TextStyle(
                                              fontSize: 8,
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    )
                                  ],
                                )
                              ],
                            )),
                      ),
                    ),
                  );
                }),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

Future<List<PrecioLuz>> fetchLuz() async {
  final response = await http.get(
    Uri.parse("https://minitwitter.com/precioluz.json"),
  );
  if (response.statusCode == 200) {
    return LuzResponse.fromJson(jsonDecode(response.body)).indicator.values;
  } else {
    throw Exception('Failed to load light');
  }
}

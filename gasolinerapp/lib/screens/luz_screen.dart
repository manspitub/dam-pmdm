import 'package:flutter/material.dart';
import 'package:gasolinerapp/data/mock.dart';

class LuzScreen extends StatefulWidget {
  const LuzScreen({
    Key? key,
  }) : super(key: key);

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
            SizedBox(
              height: MediaQuery.of(context).size.height,
              child: GridView.builder(
                itemCount: companiasLuz.length,
                itemBuilder: ((context, index) {
                  return SizedBox(
                    height: MediaQuery.of(context).size.height,
                    child: Card(
                      child: InkWell(
                        splashColor: Colors.blue.withAlpha(30),
                        onTap: () {
                          debugPrint('Card tapped.');
                        },
                        child: SizedBox(
                            width: 100,
                            height: 50,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.all(15.0),
                                      child: Text(companiasLuz[index].name,
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.blue.shade800,
                                              fontWeight: FontWeight.bold)),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(15.0),
                                      child: Image.asset(
                                        companiasLuz[index].logo, width: 70,

                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.all(15.0),
                                      child: Container(
                                        child: ElevatedButton.icon(
                                            onPressed: () {},
                                            icon: Icon(
                                              Icons.arrow_drop_down,
                                              size: 40.0,
                                              color: Colors.red,
                                            ),
                                            label: Text(
                                              companiasLuz[index].price.toString(),
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
                                              backgroundColor: MaterialStateProperty.all(Colors.red)
                                            ),
                                            onPressed: () {},
                                            icon: Icon(
                                              Icons.phone,
                                              size: 10,
                                              color: Colors.blue,
                                            ),
                                            label: Text(
                                              companiasLuz[index].toString(),
                                              style: TextStyle(
                                                  fontSize: 10,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold),
                                            )),
                                            
                                        Text(
                                          companiasLuz[index].workTime,
                                          style: TextStyle(
                                              fontSize: 10,
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

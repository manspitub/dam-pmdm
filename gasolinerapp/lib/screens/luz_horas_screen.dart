import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gasolinerapp/models/light.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class LuzHorasScreen extends StatefulWidget {
  const LuzHorasScreen({Key? key}) : super(key: key);

  @override
  State<LuzHorasScreen> createState() => _LuzHorasScreenState();
}

class _LuzHorasScreenState extends State<LuzHorasScreen> {
  late Future<List<PrecioLuz>> items = fetchLuz();
  bool isSearching = false;

  

  
  List<PrecioLuz> geos = [];
  List<PrecioLuz> filteredGeos = [];



  
  
  double filtroWidth = 15;
  Color _colorContainer = Colors.grey.shade800;
  Color _colorText = Colors.white;
  bool selec = false;
  int selectedIndex = -1;

  

  @override
  void initState() {
    fetchLuz().then(((data) {
      setState(() {
        geos = data;
        filteredGeos = data;
      });
    }));

    super.initState();
  }

  void filterGeos(value){
      filteredGeos = geos;
      setState(() {
        filteredGeos = geos.where((element) => element.geoName.toLowerCase().contains(value.toString().toLowerCase())).toList();
        filteredGeos.sort((a, b) => a.value.compareTo(b.value));
      });
  }

 

  getIcon(double price) {
    if (price > 270) {
      return Icon(
        Icons.arrow_drop_up,
        color: Colors.red,
        size: 30,
      );
    } else {
      return Icon(
        Icons.arrow_drop_down,
        color: Colors.green,
        size: 30,
      );
    }
  }

  onItemTapped(int index){
    setState(() {
      selectedIndex = index;
      _colorContainer = Colors.white;
      _colorText = Colors.black;
    });
  }

  changeContainer(int index){
    if(selectedIndex == index){
      _colorContainer = Colors.white;
    }
  }

  changeText(int index){
    if(selectedIndex == index){
      _colorText = Colors.black;
    }
  }



  static final DateTime now = DateTime.now();
  static final DateFormat formatter = DateFormat('dd MMMM');
  final String formatted = formatter.format(now);

  List<String> _geos = <String>["Península", "Canarias", "Ceuta", "Melilla", "Baleares"];

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Listado precios Luz',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.orange,
          actions: [
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child:
                    TextButton(onPressed: () {}, child: Icon(Icons.flash_on)))
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(vertical: 15),
                height: 40,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _geos.length,
                  itemBuilder: (context, index) {
                    return Ink(
                      
                      child: InkWell(
                        
                        
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(18.0),
                              color: (selectedIndex == index)
                              ? Color.fromRGBO(0, 0, 0, 1) : 
                               Colors.white),
                          padding:
                              EdgeInsets.symmetric(horizontal: filtroWidth),
                          margin: EdgeInsets.only(right: 10, left: 15),
                          child: TextButton(
                            onPressed: () {
                              setState(() => selectedIndex = index );
                              filterGeos(_geos[index]);
                            },
                            child: Text(
                              _geos[index],
                              style: TextStyle(color: (selectedIndex == index)
                              ? Colors.white : 
                               Color.fromRGBO(0, 0, 0, 1)),
                            ),
                          ),
                        ),
                        onTap: (){}
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height,
                child:  GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                        ),
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: filteredGeos.length,
                        itemBuilder: (BuildContext context, int index) {
                          return SizedBox(
                            height: 207,
                            child: Card(
                              
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Image(
                                        height: 30,
                                        width: 30,
                                        image: NetworkImage(
                                            'https://e7.pngegg.com/pngimages/750/9/png-clipart-emoji-sticker-incandescent-light-bulb-social-media-text-messaging-bulb-angle-electric-light.png')),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Expanded(
                                        child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          filteredGeos[index].geoName,
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          filteredGeos[index].value.toString() + '€',
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Align(
                                          alignment: Alignment.centerRight,
                                          child: InkWell(
                                            onTap: () {},
                                            child: Container(
                                              height: 35,
                                              width: 100,
                                              decoration: BoxDecoration(
                                                  color: Colors.transparent,
                                                  borderRadius:
                                                      BorderRadius.circular(5)),
                                              child: Center(
                                                child:
                                                    getIcon(filteredGeos[index].value),
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ))
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ))
            ])));
            
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

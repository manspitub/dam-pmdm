import 'package:flutter/material.dart';
import 'package:gasolinerapp/screens/gas_screen.dart';
import 'package:gasolinerapp/screens/gasolinera_screen.dart';
import 'package:gasolinerapp/screens/luz_screen.dart';
import 'package:gasolinerapp/screens/solar_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  List<Color> _colors = <Color>[
    Colors.orange,
    Colors.red,
    Colors.green,
    Colors.yellow
  ];

  Color colorSelected = Colors.orange;

  List<String> _titles = <String>["Luz", "Gas", "Gasolina", "Solar"];
  String titleSelected = "";
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    LuzScreen(),
    GasScreen(),
    GasolineraScreen(),
    SolarScreen()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      colorSelected = _colors[index];
      titleSelected = _titles[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          titleSelected,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: colorSelected,
        actions: [
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: TextButton(
                  onPressed: () {},
                  child: Icon(Icons.schedule)
               ) )],
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.flash_on),
            label: 'Luz',
            backgroundColor: Colors.red,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_fire_department),
            label: 'Gas',
            backgroundColor: Colors.blueAccent,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_gas_station),
            label: 'Gasolina',
            backgroundColor: Colors.yellow,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.sunny),
            label: 'Solar',
            backgroundColor: Colors.pink,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: colorSelected,
        onTap: _onItemTapped,
      ),
    );
  }
}

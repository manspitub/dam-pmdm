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

 List <String> _titles =  <String>[
   "Luz",
   "Gas",
   "Gasolina",
   "Solar"
 ];
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
        title:  Text(titleSelected, style: TextStyle(fontWeight: FontWeight.bold),),
        backgroundColor: colorSelected,
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),

      ),
      drawer: Drawer(
        
        child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text(
              'Side menu',
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
            decoration: BoxDecoration(
                color: Colors.green,
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('assets/images/cover.jpg'))),
          ),
          ListTile(
            leading: Icon(Icons.input),
            title: Text('Welcome'),
            onTap: () => {},
          ),
          ListTile(
            leading: Icon(Icons.verified_user),
            title: Text('Profile'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.border_color),
            title: Text('Feedback'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Logout'),
            onTap: () => {Navigator.of(context).pop()},
          ),
        ],
      ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items:  <BottomNavigationBarItem>[
       
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
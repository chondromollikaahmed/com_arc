import 'package:com_arc/screens/home.dart';
import 'package:flutter/material.dart';

import '../screens/Category.dart';


class  CustomerHome extends StatefulWidget {
  const CustomerHome({Key? key}) : super(key: key);

  @override
  State<CustomerHome> createState() => _CustomerHomeState();
}

class _CustomerHomeState extends State<CustomerHome> {

  int _selected_index = 0;

  final List<Widget> _tabs = const[
    HomeScreen(),
    CategoryScreen(),
    Center(child: Text('Cart')),
    Center(child:  Text('Profile')),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: _tabs[_selected_index],

      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selected_index,
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: TextStyle(fontSize: 20),
        selectedItemColor: Colors.amber[800],
       elevation: 1,
       // unselectedItemColor: Colors.grey[600],
        onTap: (int index) {
          setState(() {

            _selected_index = index;
          });
        },
      ),
    );
  }
}

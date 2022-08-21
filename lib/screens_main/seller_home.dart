import 'package:com_arc/screens/home.dart';
import 'package:com_arc/screens_main/testscreen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../screeen_seller/seller_dashboard.dart';
import '../screens/Category.dart';
import '../screens/cart.dart';


class  SellerHome extends StatefulWidget {
  const SellerHome({Key? key}) : super(key: key);

  @override
  State<SellerHome> createState() => _SellerHomeState();
}

class _SellerHomeState extends State<SellerHome> {

  int _selected_index = 0;

  final List<Widget> _tabs = const[
    HomeScreen(),
    CategoryScreen(),
    Text('Cart'),
    SellerDashboard(),
    Center(child:  Text('Profile')),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: _tabs[_selected_index],
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>  testscreen()));
        },
        child: const Icon(Icons.home),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.houseUser),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Category',
          ),
          BottomNavigationBarItem(icon: FaIcon(FontAwesomeIcons.store), label: 'Store'),
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard_sharp),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_pin),
            label: 'Upload',
          ),
        ],
        currentIndex: _selected_index,

        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: const TextStyle(fontSize: 20),
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

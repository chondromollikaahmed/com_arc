import 'package:com_arc/Customer/customer_profile.dart';
import 'package:com_arc/screens/home.dart';
import 'package:com_arc/screens_main/seller_home.dart';
import 'package:com_arc/screens_main/test_home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../screens/Category.dart';
import '../screens/cart.dart';


class  CustomerHome extends StatefulWidget {
  const CustomerHome({Key? key}) : super(key: key);

  @override
  State<CustomerHome> createState() => _CustomerHomeState();
}

class _CustomerHomeState extends State<CustomerHome> {

  int _selected_index = 0;

  final List<Widget> _tabs = [
    HomeScreen(),
    HomeScreenAlt(),
    CategoryScreen(),
    CartScreen(),
    CustomerProfile(documentId: FirebaseAuth.instance.currentUser!.uid,),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: _tabs[_selected_index],
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const SellerHome()));
        },
        child: const Icon(Icons.sell),
      ),

      bottomNavigationBar: BottomNavigationBar(

        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.tableList),
            label: 'Category',
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

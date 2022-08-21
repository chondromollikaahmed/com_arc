///File download from FlutterViz- Drag and drop a tools. For more details visit https://flutterviz.io/

///File download from FlutterViz- Drag and drop a tools. For more details visit https://flutterviz.io/

import 'package:com_arc/screens_main/test_home.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';


class testscreen extends StatefulWidget {
  @override
  State<testscreen> createState() => _testscreenState();
}

class _testscreenState extends State<testscreen> {

  final List<Widget> _tabs = [
    HomeScreenAlt(),
    Center(child:  Text('Profile')),
  ];
  int _selected_index = 0;

  List<
      FlutterVizBottomNavigationBarModel> flutterVizBottomNavigationBarItems = [
    FlutterVizBottomNavigationBarModel(icon: Icons.home, label: "Home"),
    FlutterVizBottomNavigationBarModel(
        icon: Icons.account_circle, label: "Account"),
    FlutterVizBottomNavigationBarModel(icon: Icons.home, label: "Home"),
    FlutterVizBottomNavigationBarModel(icon: Icons.home, label: "Account")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      bottomNavigationBar: BottomNavigationBar(
        items: flutterVizBottomNavigationBarItems.map((
            FlutterVizBottomNavigationBarModel item) {
          return BottomNavigationBarItem(
            icon: Icon(item.icon),
            label: item.label
            ,);
        }).toList(),
        backgroundColor: const Color(0xffffffff),
        currentIndex: _selected_index,
        elevation: 0,
        iconSize: 24,
        selectedItemColor: const Color(0xff3a57e8),
        unselectedItemColor: const Color(0xff9e9e9e),
        selectedFontSize: 14,
        unselectedFontSize: 14,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        onTap: (value) {
          setState((){
            _selected_index = value;
          });
        },
      ),
      body: _tabs[_selected_index],
    )
    ;
  }
}



class FlutterVizBottomNavigationBarModel {
  IconData icon;
  String label;

  FlutterVizBottomNavigationBarModel({required this.icon, required this.label});
}



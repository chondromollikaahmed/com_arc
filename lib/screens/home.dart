import 'package:com_arc/gallery/men_gallery.dart';
import 'package:com_arc/temp/Grid.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../sub_screens/Search.dart';
import '../widgets/SearchButton.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          title:  SearchButton(),
          backgroundColor: Colors.white,
          elevation: 0,
          bottom: const TabBar(
            indicatorColor: Colors.amber,
            indicatorWeight: 5,

            isScrollable: true,
            tabs : [
              CustomizedTab(label: 'Men',),
              CustomizedTab(label: 'Women',),
              CustomizedTab(label: 'Child',),
              CustomizedTab(label: 'Gadgets'),
              CustomizedTab(label: 'Electronics'),

             // Tab (child: Text('',style: TextStyle(color: Colors.grey.shade600),),),

            ]
          ),

        ),
        body: const TabBarView(children: [
          MenGallery(label: 'men',),
          MenGallery(label: 'women'),
          MenGallery(label: 'kids'),
          MenGallery(label: 'accessories'),
          MenGallery(label: 'beauty'),
        ]),


      ),
    );
  }
}


class CustomizedTab extends StatelessWidget {
  final String label;
  const CustomizedTab({
    Key? key, required this.label
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Tab (child: Text(label,style: TextStyle(color: Colors.grey.shade600),),);
  }
}

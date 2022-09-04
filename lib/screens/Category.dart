import 'package:com_arc/Categories/men_category.dart';
import 'package:com_arc/temp_list/temp_list.dart';
import 'package:com_arc/widgets/SearchButton.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../categories/sub_category.dart';
import '../helper/screen_details.dart';
import '../widgets/customs_category_sub.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

List<ItemData> items = [
  ItemData(label: 'Men', image: 'images/men/men'),
  ItemData(label: 'Women', image: 'images/women/women'),
  ItemData(label: 'Kids', image: 'images/kids/kids'),
  ItemData(label: 'Home Garden', image: 'images/homegarden/home'),
  ItemData(label: 'Shoes', image: 'images/shoes/shoes'),
  ItemData(label: 'Beauty', image: 'images/beauty/beauty'),
  ItemData(label: 'Accessories', image: 'images/accessories/accessories'),
  ItemData(label: 'Bags', image: 'images/bags/bags'),
  ItemData(label: 'Electronics', image: 'images/electronics/electronics'),
];

class _CategoryScreenState extends State<CategoryScreen> {
  final PageController _pageController = PageController();

  @override
  void initState() {
    // TODO: implement initState

    for (var item in items) {
      item.isSelected = false;
    }
    items[0].isSelected = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const SearchButton(),
      ),
      body: Stack(children: [
        Positioned(
          bottom: 0,
          left: 0,
          child: sideView(context),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: categoryView(context),
        )
      ]),
    );
  }

  Container sideView(BuildContext context) {
    return Container(
      height: getHeight(context) * 0.8,
      width: getWidth(context) * 0.2,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          //  topRight: Radius.circular(30),
          bottomLeft: Radius.circular(30),
          //bottomRight: Radius.circular(30),
        ),
      ),
      child: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                setState(() {
                  _pageController.animateToPage(index,
                      duration: const Duration(milliseconds: 100),
                      curve: Curves.elasticInOut);
                });
              },
              child: Container(
                height: 80,
                decoration: BoxDecoration(
                  color: items[index].isSelected ? Colors.amber : Colors.white,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade200,
                      blurRadius: 10,
                      spreadRadius: 5,
                    ),
                  ],
                ),
                child: Center(child: Text(items[index].label,style: GoogleFonts.oleoScriptSwashCaps(),)),
              ),
            );
          }),
    );
  }

  double getWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  double getHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  Widget categoryView(BuildContext context) {
    return Container(
      height: getHeight(context) * 0.8,
      width: getWidth(context) * 0.8,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          //topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
          // bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: PageView.builder(
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return SubCategory(categoryName: category[index],
            subLists: combined[index],
            imageSuffix: items[index].image,);
        },
        controller: _pageController,
        itemCount: items.length,
        onPageChanged: (value) {
          setState(() {
            for (var item in items) {
              item.isSelected = false;
            }
            items[value].isSelected = true;
          });
        },
      ),
    );
  }
}



class ItemData {
  String label;
  bool isSelected;
  String image;

  ItemData({required this.label, this.isSelected = false, required this.image});
}

//Garbase
//
// [
// Positioned(
// top: MediaQuery.of(context).size.height * 0.1,
// left: MediaQuery.of(context).size.width * 0.1,
// child: Container(
// height: MediaQuery.of(context).size.height * 0.8,
// width: MediaQuery.of(context).size.width * 0.8,
// decoration: BoxDecoration(
// color: Colors.white,
// borderRadius: BorderRadius.circular(20),
// boxShadow: [
// BoxShadow(
// color: Colors.black.withOpacity(0.1),
// blurRadius: 20,
// offset: Offset(0, 10),
// ),
// ],
// ),
// ),
// ),
// Positioned(
// top: MediaQuery.of(context).size.height * 0.2,
// left: MediaQuery.of(context).size.width * 0.2,
// child: Container(
// height: MediaQuery.of(context).size.height * 0.6,
// width: MediaQuery.of(context).size.width * 0.6,
// decoration: BoxDecoration(
// color: Colors.white,
// borderRadius: BorderRadius.circular(20),
// boxShadow: [
// BoxShadow(
// color: Colors.black.withOpacity(0.1),
// blurRadius: 20,
// offset: Offset(0, 10),
// ),
// ],
// ),
// ),
// ),
// ]

//original code

//
// PageView(
// controller: _pageController,
// onPageChanged: (value) {
// setState(() {
// for (var item in items)
// {
// item.isSelected=false;
// }
// items[value].isSelected = true;
// });
// },
// scrollDirection: Axis.vertical,
// children: const [
// MenCategory(),
// Center(child: Text('Women')),
// Center(child: Text('Child')),
// Center(child: Text('Bag')),
// Center(child: Text('Home')),
// Center(child: Text('Kids')),
//
// ],
// )

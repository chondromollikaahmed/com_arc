import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../customs/com_arc_customs.dart';



class ProductsBySubCategory extends StatelessWidget {
  final String subCategory;
  final String category;
  const ProductsBySubCategory({Key? key,required this.subCategory,required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(


      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: const ComArcBackButton(),
        title: ComArcTitle(title: subCategory)
      ),
      body: Center
      (
        child: Text('$category>$subCategory'),
      ),
    );
  }
}

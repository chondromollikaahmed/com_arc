import 'package:flutter/material.dart';

import '../helper/screen_details.dart';
import '../sub_screens/product_sub_category.dart';





class CustomSlider extends StatelessWidget {

  final String label ;
  const CustomSlider({
    Key? key, required this.label
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: ScreenDetails.getHeight(context)*0.8,
      width: ScreenDetails.getWidth(context)*0.05,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Container
          (
          decoration:  BoxDecoration(
            color: Colors.greenAccent,
            borderRadius: BorderRadius.circular(50),

          ),
          child: RotatedBox(quarterTurns: 3, child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children:  [

              const Text('<<',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 10,
                ),),
              Text(label.toUpperCase(),
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 10
                ),),
              const Text('>>',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 10
                ),),


            ],
          ),),
        ),
      ),
    );
  }
}

class SubGridMaker extends StatelessWidget {

  final String mainSection;
  final String subSection;
  final String assetName;
  //final String mainSection;

  const SubGridMaker({
    Key? key, required this.mainSection, required this.subSection ,required this.assetName
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(context, MaterialPageRoute(builder:
          (context)=>
          ProductsBySubCategory(subCategory:subSection ,category: mainSection,))),
      child: Column(
        children: [
          SizedBox(
            height: 70,
            width: 70,
            child: Image(
              image: AssetImage(assetName),
            ),
          ),

          Text(subSection),
        ],
      ),
    );
  }
}

class HeaderLabel extends StatelessWidget {

  final String label;
  const HeaderLabel({
    Key? key,
    required this.label
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.all(30.0),
      child: Text(label,style: const TextStyle( fontSize: 24,fontWeight:FontWeight.bold,letterSpacing: 1.5 ),),
    );
  }
}

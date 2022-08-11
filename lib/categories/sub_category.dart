import 'package:flutter/material.dart';

import '../helper/screen_details.dart';
import '../widgets/customs_category_sub.dart';





class SubCategory extends StatelessWidget {
  final String categoryName;
  final List<String> subLists;
  final String imageSuffix;
  const SubCategory({
    Key? key, required this.categoryName, required this.subLists, required this.imageSuffix,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Stack(children: [
        Positioned(
          left: 0,
          bottom: 0,
          child: SizedBox(
            height: ScreenDetails.getHeight(context) * 0.8,
            width: ScreenDetails.getWidth(context) * 0.75,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HeaderLabel(
                  label: categoryName,
                ),
                SizedBox(
                  height: ScreenDetails.getHeight(context) * 0.68,
                  child: GridView.count(
                      mainAxisSpacing: 40,
                      crossAxisSpacing: 10,
                      crossAxisCount: 3,
                      children: List.generate(
                        subLists.length,
                            (index) => SubGridMaker(
                          mainSection: categoryName,
                          subSection: subLists[index],
                          assetName: '$imageSuffix$index.jpg',
                        ),
                      )),
                )
              ],
            ),
          ),
        ),
        Positioned(
            bottom: 0,
            right: 0,
            child: CustomSlider(
              label: categoryName,
            ))
      ]),
    );
  }
}

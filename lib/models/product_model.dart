import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../temp/ProductDetails.dart';




class ProductModel extends StatelessWidget {

  final dynamic productData;
  const ProductModel({
    Key? key,
    required this.productData
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(

      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetails(specificProduct: productData,))),
      child: Container(
        margin: EdgeInsets.all(0),
        padding: EdgeInsets.all(0),
        width: 200,
        height: 260,
        decoration: BoxDecoration(
          color: Color(0xffffffff),
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Color(0x29000000),
              offset: Offset(0, 3),
              blurRadius: 6,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Stack(
              alignment: Alignment.topRight,
              children: [
                ///***If you have exported images you must have to copy those images in assets/images directory.

                ClipRRect(

                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),

                  child: Image(
                    image: NetworkImage(productData['productImages'][0]),

                    height: MediaQuery.of(context).size.height * 0.2,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                  ),
                ),

                productData['sid']!=FirebaseAuth.instance.currentUser!.uid ?Container(
                  margin: EdgeInsets.fromLTRB(0, 8, 8, 0),
                  padding: EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: Color(0xffa0a0a0),
                    shape: BoxShape.circle,
                    border: Border.all(
                        color: Color(0x4d9e9e9e), width: 1),
                  ),
                  child: Icon(
                    Icons.favorite,
                    color: Color(0xffffffff),
                    size: 18,
                  ),
                ):Container(
                  margin: EdgeInsets.fromLTRB(0, 8, 8, 0),
                  padding: EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: Color(0xffa0a0a0),
                    shape: BoxShape.circle,
                    border: Border.all(
                        color: Color(0x4d9e9e9e), width: 1),
                  ),
                  child: Icon(
                    Icons.edit,
                    color: Color(0xffffffff),
                    size: 18,
                  ),
                ),
              ],
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.fromLTRB(0, 8, 0, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      productData['productName'],
                      textAlign: TextAlign.start,
                      maxLines: 1,
                      overflow: TextOverflow.clip,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.normal,
                        fontSize: 14,
                        color: Color(0xff000000),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(0, 4, 0, 8),
                      child: RatingBar.builder(
                        initialRating: 3,
                        unratedColor: Color(0xff9e9e9e),
                        itemBuilder: (context, index) => Icon(
                            Icons.star,
                            color: Color(0xffffc107)),
                        itemCount: 5,
                        itemSize: 20,
                        direction: Axis.horizontal,
                        allowHalfRating: false,
                        onRatingUpdate: (value) {},
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Price:",
                          textAlign: TextAlign.start,
                          overflow: TextOverflow.clip,
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.normal,
                            fontSize: 14,
                            color: Color(0xff393939),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(4, 0, 0, 0),
                          child: Text(
                            "BDT. ${productData['productPrice']}",
                            textAlign: TextAlign.start,
                            maxLines: 1,
                            overflow: TextOverflow.clip,
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontStyle: FontStyle.normal,
                              fontSize: 14,
                              color: Color(0xff3a57e8),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

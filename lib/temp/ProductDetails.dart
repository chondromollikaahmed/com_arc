///File download from FlutterViz- Drag and drop a tools. For more details visit https://flutterviz.io/

///File download from FlutterViz- Drag and drop a tools. For more details visit https://flutterviz.io/

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:com_arc/Customer/customer_profile.dart';
import 'package:com_arc/customs/com_arc_customs.dart';
import 'package:com_arc/helper/ca_snackbar.dart';
import 'package:com_arc/provider/wishlist_provider.dart';
import 'package:com_arc/screeen_seller/seller_store_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:provider/provider.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';

import '../models/product_model.dart';
import '../provider/cart_provider.dart';
import '../screens/cart.dart';

import 'package:collection/collection.dart';

import 'package:badges/badges.dart';

class ProductDetails extends StatefulWidget {

  final dynamic specificProduct;

  const ProductDetails({Key? key, required this.specificProduct}) : super(key: key);

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {


  final GlobalKey<ScaffoldMessengerState> _scaffoldKey = GlobalKey<ScaffoldMessengerState>();


  late List<dynamic> imageList= widget.specificProduct['productImages'];

  @override
  Widget build(BuildContext context) {


final Stream<QuerySnapshot> _productStream =
FirebaseFirestore.instance.collection('products').where('productCategory',
isEqualTo: widget.specificProduct['productCategory']).where('SubCategory',isEqualTo: widget.specificProduct['SubCategory']).snapshots();
    return ScaffoldMessenger(
      key: _scaffoldKey,
      child: Scaffold(
        backgroundColor: Color(0xffffffff),
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          automaticallyImplyLeading: false,
          backgroundColor: Color(0xffffffff),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.zero,
          ),
          title: Text(
            "Details",
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontStyle: FontStyle.normal,
              fontSize: 20,
              color: Color(0xff000000),
            ),
          ),
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: Color(0xff000000),
              size: 24,
            ),
          ),
          actions: [
            Icon(Icons.share, color: Color(0xff212435), size: 24),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              Padding(
                  padding: EdgeInsets.all(16),
                  child:

                      ///***If you have exported images you must have to copy those images in assets/images directory.
                      SizedBox(
                    height: MediaQuery.of(context).size.height * 0.4,
                    child: Swiper(
                      itemBuilder: (context, index) {
                        return Image(
                          image: NetworkImage(
                              imageList[index]),
                          height: MediaQuery.of(context).size.height *
                              0.35000000000000003,
                          width: MediaQuery.of(context).size.width,
                          fit: BoxFit.cover,
                        );
                      },
                      pagination: SwiperPagination(
                        builder: DotSwiperPaginationBuilder(
                          color: Colors.grey,
                          activeColor: Colors.white,
                          size: 8,
                          activeSize: 8,
                        ),
                      ),
                      itemCount: imageList.length,
                    ),
                  )),
              Container(
                margin: EdgeInsets.all(0),
                padding: EdgeInsets.all(0),
                width: MediaQuery.of(context).size.width,
                height: 100,
                decoration: BoxDecoration(
                  color: Color(0xffffffff),
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.zero,
                ),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.all(16),
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  children: [
                    ///***If you have exported images you must have to copy those images in assets/images directory.
                    Image(
                      image: NetworkImage(
                          "https://cdn.pixabay.com/photo/2017/08/06/15/44/house-2593570_960_720.jpg"),
                      height: 30,
                      width: 70,
                      fit: BoxFit.cover,
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(16, 0, 0, 0),
                      child:

                          ///***If you have exported images you must have to copy those images in assets/images directory.
                          Image(
                        image: NetworkImage(
                            "https://cdn.pixabay.com/photo/2017/08/02/01/01/living-room-2569325_960_720.jpg"),
                        height: 60,
                        width: 70,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(16, 0, 0, 0),
                      child:

                          ///***If you have exported images you must have to copy those images in assets/images directory.
                          Image(
                        image: NetworkImage(
                            "https://cdn.pixabay.com/photo/2019/04/23/09/04/indoor-4148898_960_720.jpg"),
                        height: 60,
                        width: 70,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(16, 0, 0, 0),
                      child:

                          ///***If you have exported images you must have to copy those images in assets/images directory.
                          Image(
                        image: NetworkImage(
                            "https://cdn.pixabay.com/photo/2018/01/23/16/22/indoors-3101776_960_720.jpg"),
                        height: 70,
                        width: 70,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 0, horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: Text(
                        widget.specificProduct['productName'],
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.clip,
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                          fontSize: 16,
                          color: Color(0xff000000),
                        ),
                      ),
                    ),
                    RatingBar.builder(
                      initialRating: 2.75,
                      unratedColor: Color(0xff9e9e9e),
                      itemBuilder: (context, index) =>
                          Icon(Icons.star, color: Color(0xffffc107)),
                      itemCount: 5,
                      itemSize: 16,
                      direction: Axis.horizontal,
                      allowHalfRating: false,
                      onRatingUpdate: (value) {},
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(16, 16, 16, 0),
                child: Text(widget.specificProduct['productDescription'],
                  textAlign: TextAlign.left,
                  overflow: TextOverflow.clip,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.normal,
                    fontSize: 14,
                    color: Color(0xff000000),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    widget.specificProduct['productPrice'].toStringAsFixed(2)+' BDT',
                    textAlign: TextAlign.start,
                    overflow: TextOverflow.clip,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.normal,
                      fontSize: 20,
                      color: Color(0xff000000),
                    ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(


                     decoration: BoxDecoration(
                       color: Color(0xff0f95d9),
                       shape: BoxShape.rectangle,
                       borderRadius: BorderRadius.zero,
                     ),
                    child: Center(child: Text(widget.specificProduct['inStock'].toString()+ '  are available in stock',style: TextStyle(color: Colors.white),))),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 16, 0),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: MaterialButton(
                    onPressed: () {


                      context.read<WishList>().wishItems.firstWhereOrNull((product) =>
                      product.documentId==widget.specificProduct['productId']) != null?
                      CA_SnackBar.showSnackBar(_scaffoldKey, 'Already Added To Wish List'):
                      context.read<WishList>().addWishItem(widget.specificProduct['productName'],
                          widget.specificProduct['productPrice'], 1,
                          widget.specificProduct['inStock'],
                          widget.specificProduct['productImages'], widget.specificProduct['productId'], widget.specificProduct['sid']);


                    },
                    color: Color(0xff3a57e8),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    padding: EdgeInsets.all(16),
                    child: Text(
                      "Add to WishList",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.normal,
                      ),
                    ),
                    textColor: Color(0xffffffff),
                    height: 40,
                    minWidth: 140,
                  ),
                ),
              ),

              ComArcHeaderLabel(title: 'Similar Products'),

              SingleChildScrollView(
                child: SizedBox(
                  height: 1000,
                  child: StreamBuilder<QuerySnapshot>(
                    stream: _productStream,
                    builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.hasError) {
                        return Text('Something went wrong');
                      }

                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      }

                      if(snapshot.data!.docs.isEmpty){
                        return const Center(child: Text('No Product Found Of This Category'));
                      }

                      return  StaggeredGridView.countBuilder(
                        physics: const NeverScrollableScrollPhysics(),
                        crossAxisCount: 2,
                        itemCount: snapshot.data!.docs.length,

                        itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ProductModel(productData: snapshot.data!.docs[index],),
                        ),
                        staggeredTileBuilder: (context) => StaggeredTile.fit(1),);



                      /*ListView(
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
                Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
                return StaggeredGridView.countBuilder(crossAxisCount: 2,

                    itemBuilder: (context, index) => Container(
                      color: Colors.green,
                      child: Center(
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Text('$index'),
                        ),
                      ),
                    ),
                    staggeredTileBuilder: (context) => StaggeredTile.fit(1),);




                *//*ListTile(
                  leading: Image.network(data['productImages'][0]),
                  title: Text(data['productName']),
                  subtitle: Text(data['productPrice'].toString()),
                );*//*
            }).toList(),
          );*/
                    },
                  ),
                ),
              )
            ],
          ),
        ),

        bottomSheet: Container(
          height: 60,
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () {

                  Navigator.push(context, MaterialPageRoute(builder: (context)=>SellerStoreDetails(sellerId: widget.specificProduct['sid'])));
                },
                icon: Icon(
                  Icons.store,
                  color: Color(0xff3a57e8),
                ),
              ),
              IconButton(
                onPressed: () {

                  Navigator.push(context, MaterialPageRoute(builder: (context)=>CartScreen(back: ComArcBackButton(),)));
                },
                icon: Badge(
                  badgeContent: Text(context.watch<Cart>().cartItems.length.toString()),
                  child: Icon(
                    Icons.shopping_cart,
                    color: Color(0xff3a57e8),
                  ),
                ),
              ),

              MaterialButton(
                onPressed: () {

                  context.read<Cart>().cartItems.firstWhereOrNull((product) =>
                  product.documentId==widget.specificProduct['productId']) != null?
                  CA_SnackBar.showSnackBar(_scaffoldKey, 'Already Added To Cart'):
                  context.read<Cart>().addItem(widget.specificProduct['productName'],
                      widget.specificProduct['productPrice'], 1,
                      widget.specificProduct['inStock'],
                      widget.specificProduct['productImages'], widget.specificProduct['productId'], widget.specificProduct['sid']);

                },
                color: Color(0xff3a57e8),
                elevation: 0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
                padding: EdgeInsets.all(16),
                child: Text(
                  "Add to Cart",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal,
                  ),
                ),
                textColor: Color(0xffffffff),
                height: 40,
                minWidth: 140,
              )

            ],
          ),
        ),
      ),
    );
  }
}

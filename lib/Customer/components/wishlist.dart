import 'package:com_arc/customs/com_arc_customs.dart';
import 'package:com_arc/helper/screen_details.dart';

import 'package:com_arc/provider/wishlist_provider.dart';
import 'package:com_arc/screens_main/customer_home.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../../provider/cart_provider.dart';

import 'package:collection/collection.dart';


class CustomerWishList extends StatefulWidget {
  final Widget? back;

  const CustomerWishList({Key? key, this.back}) : super(key: key);

  @override
  State<CustomerWishList> createState() => _CustomerWishListState();
}

class _CustomerWishListState extends State<CustomerWishList> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            leading: ComArcBackButton(),
            title: const Center(child: ComArcTitle(title: 'Wish List')),
            actions: [
              IconButton(
                icon: const Icon(Icons.delete_forever_rounded),
                onPressed: () {

                  //wish.clearCart();
                  context.read<WishList>().clearWishList();
                },
                color: Colors.black,
              ),
            ],
          ),
          body:
          Provider.of<WishList>(context,listen: true).wishItems.isNotEmpty?

          Consumer<WishList>(builder: (context,wish,child){

            return ListView.builder(itemCount:wish.wishItemsCount,
                itemBuilder: (context,index){

              final product = wish.wishItems[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                        child : SizedBox(
                          height: 120,

                          child: Row(
                            children: [
                              SizedBox(
                                height: 120,
                                width: 120,
                                child: Image.network(wish.wishItems[index].imageUrls[0]),
                              ),
                              Flexible(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      Text(wish.wishItems[index].name,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,

                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold
                                        ),),
                                      Row(

                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(wish.wishItems[index].price.toString(),

                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.red
                                            ),),
                                          Text(wish.wishItems[index].quantity.toString(),style: TextStyle(
                                            fontSize: 6,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.blueGrey
                                          ),),

                                            Row(children: [

                                              IconButton(onPressed: (){}, icon: const Icon(Icons.delete_forever_rounded)),
                                              SizedBox(width: 10,),
                                              IconButton(onPressed: (){



                                                context.read<Cart>().cartItems.firstWhereOrNull(

                                                        (element) =>
                                                element.documentId==product.documentId) != null?
                                                print('already in cart'):
                                                context.read<Cart>().addItem(product.name,
                                                product.price, 1,
                                                product.quantity,
                                                product.imageUrls, product.documentId, product.sellerId);




                                              }, icon: const Icon(Icons.add_shopping_cart_rounded)),

                                            ],),

                                        ],
                                      ),

                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),



                        )
                    ),
                  );

                });
          },) :
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Your wish is empty',
                  style: TextStyle(fontSize: 30),
                ),
                SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),

        ),
      ),
    );
  }
}

import 'package:com_arc/customs/com_arc_customs.dart';
import 'package:com_arc/helper/screen_details.dart';
import 'package:com_arc/provider/cart_provider.dart';
import 'package:com_arc/screens/place_order.dart';
import 'package:com_arc/screens_main/customer_home.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import 'home.dart';

class CartScreen extends StatefulWidget {
  final Widget? back;

  const CartScreen({Key? key, this.back}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            leading: widget.back,
            title: const Center(child: ComArcTitle(title: 'Cart')),
            actions: [
              IconButton(
                icon: const Icon(Icons.delete_forever_rounded),
                onPressed: () {

                  //cart.clearCart();
                  context.read<Cart>().clearCart();
                },
                color: Colors.black,
              ),
            ],
          ),
          body:
          Provider.of<Cart>(context,listen: true).cartItems.isNotEmpty?

          Consumer<Cart>(builder: (context,cart,child){

            return ListView.builder(itemCount:cart.cartItemsCount,
                itemBuilder: (context,index){
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            child : SizedBox(
                              height: 100,

                              child: Row(
                                children: [
                                  SizedBox(
                                    height: 100,
                                    width: 120,
                                    child: Image.network(cart.cartItems[index].imageUrls[0]),
                                  ),
                                  Flexible(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: [
                                          Text(cart.cartItems[index].name,
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,

                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold
                                          ),),
                                          Row(

                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(cart.cartItems[index].price.toString(),

                                              style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                  color: Colors.red
                                              ),),
                                              Text(cart.cartItems[index].quantity.toString()),

                                              Container(
                                                height: 35,
                                                decoration: BoxDecoration(
                                                  color: Colors.red,
                                                  borderRadius: BorderRadius.circular(15)
                                                ),
                                                child: Row(
                                                  children: [
                                                    cart.cartItems[index].qty==1?
                                                    IconButton(
                                                      icon:  const Icon(Icons.delete_forever_rounded,color: Colors.white,size: 18,),
                                                      onPressed: (){

                                                        //cart.decrement(cart.cartItems[index]);
                                                        cart.removeItem(cart.cartItems[index]);
                                                      },
                                                      color: Colors.white,
                                                    ):
                                                    IconButton(
                                                      icon:  const Icon(FontAwesomeIcons.minus,color: Colors.white,size: 18,),
                                                      onPressed: (){

                                                        cart.decrement(cart.cartItems[index]);
                                                      },
                                                      color: Colors.white,
                                                    ),
                                                    Text(cart.cartItems[index].qty.toString(),

                                                    style: TextStyle(
                                                      color: cart.cartItems[index].qty==cart.cartItems[index].quantity?Colors.white:Colors.black,
                                                    ),),
                                                    IconButton(
                                                      icon: const Icon(FontAwesomeIcons.plus,color: Colors.white,size: 18,),
                                                      onPressed:cart.cartItems[index].qty==cart.cartItems[index].quantity?null: (){

                                                        cart.increment(cart.cartItems[index]);
                                                      },
                                                      color: Colors.white,
                                                    ),
                                                  ],
                                                ),
                                              ),

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
                  'Your cart is empty',
                  style: TextStyle(fontSize: 30),
                ),
                SizedBox(
                  height: 50,
                ),
                Material(
                  color: Colors.deepOrangeAccent,
                  borderOnForeground: true,
                  borderRadius: BorderRadius.circular(30),
                  child: MaterialButton(
                    minWidth: ScreenDetails.getWidth(context) * 0.6,
                    // 60% of screen width,
                    onPressed: () {
                      Navigator.canPop(context)?
                      Navigator.pop(context):
                          Navigator.pushReplacementNamed(context, '/customer_home');
                    },
                    child:  Text(
                      'Continue Shopping',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                )
              ],
            ),
          ),
          bottomSheet: Padding(
            padding:  EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children:  [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        'Total',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    Text(context.watch<Cart>().totalAmount.toString() +'/-',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.blueGrey,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Container(
                  height: 30,
                  decoration: BoxDecoration(
                    color: Colors.teal,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: MaterialButton(
                    minWidth: ScreenDetails.getWidth(context) * 0.4,
                    // 60% of screen width,

                    onPressed: () {

                      context.read<Cart>().totalAmount==0?null:
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>PlaceOrder()));



                    },
                    child: const Text(
                      'Checkout',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

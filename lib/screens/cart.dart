import 'package:com_arc/customs/com_arc_customs.dart';
import 'package:com_arc/helper/screen_details.dart';
import 'package:com_arc/screens_main/customer_home.dart';
import 'package:flutter/material.dart';

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
                onPressed: () {},
                color: Colors.black,
              ),
            ],
          ),
          body: Center(
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
                    child: const Text(
                      'Continue Shopping',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                )
              ],
            ),
          ),
          bottomSheet: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        'Total',
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    Text(
                      '0.00/-',
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

                    onPressed: () {},
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

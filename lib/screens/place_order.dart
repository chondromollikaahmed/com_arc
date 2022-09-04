import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:com_arc/customs/com_arc_customs.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

import '../provider/cart_provider.dart';

class PlaceOrder extends StatefulWidget {
  const PlaceOrder({Key? key}) : super(key: key);

  @override
  State<PlaceOrder> createState() => _PlaceOrderState();
}

class _PlaceOrderState extends State<PlaceOrder> {

  CollectionReference users = FirebaseFirestore.instance.collection('customers');
  @override
  Widget build(BuildContext context) {


    return FutureBuilder<DocumentSnapshot>(
        future: users.doc(FirebaseAuth.instance.currentUser!.uid).get(),
    builder:
    (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {

    if (snapshot.hasError) {
    return Text("Something went wrong");
    }

    if (snapshot.hasData && !snapshot.data!.exists) {
    // Navigator.pushNamed(context, '/login');
    return const Text("Document does not exist");
    }

    if (snapshot.connectionState == ConnectionState.done) {
    Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
    return /*Text("Full Name: ${data['full_name']} ${data['last_name']}");*/
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text('Place Order',style: TextStyle(color: Colors.black),),
          leading: ComArcBackButton(),
        ),


        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(height: 100,

              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 5.0,
                    spreadRadius: 1.0,
                    offset: Offset(0.0, 0.0), // shadow direction: bottom right
                  )
                ],
              ),

                child: Column(

                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text('Name:'),
                        Text('Full Name: ${data['name']} '),
                      ],
                    ),
                    Row(
                      children:  [

                        Text('Phone: ${data['phone']}'),
                      ],
                    ),
                    Row(
                      children:  [

                        Text('Address: ${data['address']}'),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10,),
              Container(
                height: 500,

                decoration: BoxDecoration(

                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 5.0,
                      spreadRadius: 1.0,
                      offset: Offset(0.0, 0.0), // shadow direction: bottom right
                    )
                  ],
                ),

                child: Consumer<Cart>(builder: (context,cart,child){
                  return ListView.builder(itemCount:cart.cartItemsCount,
                      itemBuilder: (context,index){
                        return Container(
                          height: 100,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.grey),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.grey,
                                blurRadius: 5.0,
                                spreadRadius: 1.0,
                                offset: Offset(0.0, 0.0), // shadow direction: bottom right
                              )
                            ],
                          ),

                          child: Row(
                            children: [
                              Container(
                                height: 100,
                                width: 100,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(cart.cartItems[index].imageUrls[0]),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              SizedBox(width: 10,),
                              Flexible(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(cart.cartItems[index].name,maxLines: 2,overflow: TextOverflow.ellipsis,),
                                    Text('Price: ${cart.cartItems[index].price}'),
                                    Text('Qty: ${cart.cartItems[index].qty}'),
                                    Text('Total: ${cart.cartItems[index].price * cart.cartItems[index].qty}'),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      });
                }),
              ),
            ],
          ),
        ),
        bottomSheet: Container(
          height: 50,
          width: double.infinity,
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Total:'),
               Text('BDT.'+context.watch<Cart>().totalAmount.toString()),
              ElevatedButton(onPressed: () async{

                for (var i = 0; i < context.read<Cart>().cartItemsCount; i++) {

                  String orderId=const Uuid().v4();
                  await FirebaseFirestore.instance.collection('orders').doc().set({
                    'customer_id':data['cid'],
                    'customer_name':data['name'],
                    'customer_phone':data['phone'],
                    'customer_address':data['address'],
                    'customer_email':data['email'],

                    'order_id':orderId,
                    'name': context.read<Cart>().cartItems[i].name,
                    'price': context.read<Cart>().cartItems[i].price,
                    'qty': context.read<Cart>().cartItems[i].qty,
                    'total': context.read<Cart>().cartItems[i].price * context.read<Cart>().cartItems[i].qty,
                    'imageUrls': context.read<Cart>().cartItems[i].imageUrls,
                    'sellerId': context.read<Cart>().cartItems[i].sellerId,
                    'delivery_status': 'pending',
                    'createdAt': DateTime.now(),
                    'payment_status': 'pending',
                    'payment_method': 'cash on delivery',
                    'delivery_charge': 0,
                    'delivery_date': DateTime.now(),
                  });
                }



              }, child: const Text('Place Order'))
            ],
          ),
        ),
      ),
    );

    }

    return Text('');
}
);
  }

}

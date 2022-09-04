import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:com_arc/welcome/onboarding.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';

import '../models/product_model.dart';

class SellerStoreDetails extends StatefulWidget {


  final String sellerId;
  const SellerStoreDetails({Key? key, required this.sellerId}) : super(key: key);

  @override
  State<SellerStoreDetails> createState() => _SellerStoreDetailsState();
}

class _SellerStoreDetailsState extends State<SellerStoreDetails> {

  bool follow = false;
  @override
  Widget build(BuildContext context) {


    final Stream<QuerySnapshot> _productStream = FirebaseFirestore.instance.collection('products').where('sid',isEqualTo: widget.sellerId).snapshots();
    CollectionReference sellers = FirebaseFirestore.instance.collection('sellers');

    return FutureBuilder<DocumentSnapshot>(
      future: sellers.doc(widget.sellerId).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {

        if (snapshot.hasError) {
          return Text("Something went wrong");
        }

        if (snapshot.hasData && !snapshot.data!.exists) {
          return Text("Document does not exist");
        }

        if(snapshot.connectionState == ConnectionState.waiting){
          return Material(child: const Center(child: CircularProgressIndicator()));
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
          return Scaffold(

            appBar: AppBar(
              toolbarHeight: 150,
              flexibleSpace: Image.asset('images/inapp/coverimage.jpg',
              fit: BoxFit.cover,),




              title: Column(
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundImage: NetworkImage(data['storeLogo']),
                      ),
                      const SizedBox(width: 10,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                         Text(data['storeName'],style: const TextStyle(fontSize: 20),),
                          Text(data['email'],style: const TextStyle(fontSize: 15),),
                        ],
                      )
                    ],
                  ),

                  Padding(
                    padding: const EdgeInsets.only(left: 60),
                    child:data['sid']!=FirebaseAuth.instance.currentUser!.uid ? ComArcButton(text: follow==false?'Follow':'Unfollow', icon: follow==false?Icons.add:Icons.remove_circle_outline, onPressed: (){

                      setState(() {
                        follow = !follow;
                      });
                    },):
                    ComArcButton(text: 'Edit', icon: Icons.edit),
                  ),
                ],
              ),

            ),

            body: StreamBuilder<QuerySnapshot>(
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

         floatingActionButton: FloatingActionButton(

           backgroundColor: Colors.green,
           onPressed: (){

           },
           child: const Icon(FontAwesomeIcons.whatsapp),
          ),
          );
        }

        return Text("loading");
      },
    );
  }
}

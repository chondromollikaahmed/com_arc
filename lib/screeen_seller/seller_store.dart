import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:com_arc/customs/com_arc_customs.dart';
import 'package:com_arc/screeen_seller/seller_store_details.dart';
import 'package:flutter/material.dart';


class SellerStore extends StatefulWidget {
  const SellerStore({Key? key}) : super(key: key);

  @override
  State<SellerStore> createState() => _SellerStoreState();
}

class _SellerStoreState extends State<SellerStore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Center(child: ComArcTitle(title: 'Stores')),
      ),

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('sellers').snapshots(),
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return Text('Something went wrong');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            return GridView.builder(


                itemCount: snapshot.data!.docs.length,
                gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisSpacing: 10,crossAxisSpacing: 10),

                itemBuilder: (context,index){

                 return GestureDetector(

                   onTap: (){
                     Navigator.push(context, MaterialPageRoute(builder: (context)=>SellerStoreDetails(sellerId: snapshot.data!.docs[index]['sid'],)));
                   },
                   child: Column(
                     children: [
                       SizedBox(
                         child: Image.network(snapshot.data!.docs[index]['storeLogo']),
                         height: 120,
                         width: 120,
                       ),

                       Text(snapshot.data!.docs[index]['storeName'])
                     ],
                   ),
                 );
                });
          },
        ),
      ),
    );
  }
}

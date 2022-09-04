import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';

import '../models/product_model.dart';



class MenGallery extends StatefulWidget {

  final String label;
  const MenGallery({Key? key, required this.label}) : super(key: key);

  @override
  State<MenGallery> createState() => _MenGalleryState();
}

class _MenGalleryState extends State<MenGallery> {






  @override
  Widget build(BuildContext context) {

    final Stream<QuerySnapshot> _productStream = FirebaseFirestore.instance.collection('products').where('productCategory',isEqualTo: widget.label).snapshots();

    return StreamBuilder<QuerySnapshot>(
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
    );
  }
}

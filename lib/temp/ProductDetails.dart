///File download from FlutterViz- Drag and drop a tools. For more details visit https://flutterviz.io/

///File download from FlutterViz- Drag and drop a tools. For more details visit https://flutterviz.io/

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';


class ProductDetails extends StatelessWidget {

@override
Widget build(BuildContext context) {
return Scaffold(
backgroundColor: Color(0xffffffff),
appBar: 
AppBar(
elevation:0,
centerTitle:true,
automaticallyImplyLeading: false,
backgroundColor:Color(0xffffffff),
shape:RoundedRectangleBorder(
borderRadius:BorderRadius.zero,
),
title:Text(
"Details",
style:TextStyle(
fontWeight:FontWeight.w700,
fontStyle:FontStyle.normal,
fontSize:20,
color:Color(0xff000000),
),
),
leading: InkWell(
  onTap: (){Navigator.pushReplacementNamed(context, '/customer_home');},
  child:   Icon(
  Icons.arrow_back_ios,
  color:Color(0xff000000),
  size:24,
  ),
),
actions:[
Icon(Icons.search,color:Color(0xff212435),size:24),
],
),
body:SingleChildScrollView(
child:
Column(
mainAxisAlignment:MainAxisAlignment.start,
crossAxisAlignment:CrossAxisAlignment.center,
mainAxisSize:MainAxisSize.max,
children: [
Padding(
padding:EdgeInsets.all(16),
child:///***If you have exported images you must have to copy those images in assets/images directory.
Image(
image:NetworkImage("https://cdn.pixabay.com/photo/2017/08/06/15/44/house-2593570_960_720.jpg"),
height:MediaQuery.of(context).size.height * 0.35000000000000003,
width:MediaQuery.of(context).size.width,
fit:BoxFit.cover,
),
),
Container(
margin:EdgeInsets.all(0),
padding:EdgeInsets.all(0),
width:MediaQuery.of(context).size.width,
height:100,
decoration: BoxDecoration(
color:Color(0xffffffff),
shape:BoxShape.rectangle,
borderRadius:BorderRadius.zero,
),
child:

ListView(
scrollDirection: Axis.horizontal,
padding:EdgeInsets.all(16),
shrinkWrap:true,
physics:ClampingScrollPhysics(), 
children:[

///***If you have exported images you must have to copy those images in assets/images directory.
Image(
image:NetworkImage("https://cdn.pixabay.com/photo/2017/08/06/15/44/house-2593570_960_720.jpg"),
height:30,
width:70,
fit:BoxFit.cover,
),
Padding(
padding:EdgeInsets.fromLTRB(16, 0, 0, 0),
child:///***If you have exported images you must have to copy those images in assets/images directory.
Image(
image:NetworkImage("https://cdn.pixabay.com/photo/2017/08/02/01/01/living-room-2569325_960_720.jpg"),
height:60,
width:70,
fit:BoxFit.cover,
),
),
Padding(
padding:EdgeInsets.fromLTRB(16, 0, 0, 0),
child:///***If you have exported images you must have to copy those images in assets/images directory.
Image(
image:NetworkImage("https://cdn.pixabay.com/photo/2019/04/23/09/04/indoor-4148898_960_720.jpg"),
height:60,
width:70,
fit:BoxFit.cover,
),
),
Padding(
padding:EdgeInsets.fromLTRB(16, 0, 0, 0),
child:///***If you have exported images you must have to copy those images in assets/images directory.
Image(
image:NetworkImage("https://cdn.pixabay.com/photo/2018/01/23/16/22/indoors-3101776_960_720.jpg"),
height:70,
width:70,
fit:BoxFit.cover,
),
),
],),
),
Padding(
padding:EdgeInsets.symmetric(vertical: 0,horizontal:16),
child:Row(
mainAxisAlignment:MainAxisAlignment.spaceBetween,
crossAxisAlignment:CrossAxisAlignment.center,
mainAxisSize:MainAxisSize.max,
children:[

Text(
"Sofa Set ",
textAlign: TextAlign.start,
overflow:TextOverflow.clip,
style:TextStyle(
fontWeight:FontWeight.w700,
fontStyle:FontStyle.normal,
fontSize:16,
color:Color(0xff000000),
),
),
RatingBar.builder(
initialRating: 2.75,
unratedColor: Color(0xff9e9e9e),
itemBuilder: (context, index) => Icon(
Icons.star,
color:Color(0xffffc107)
),
itemCount: 5,
itemSize: 16,
direction: Axis.horizontal,
allowHalfRating: false,
onRatingUpdate: (value) {},
),
],),),
Padding(
padding:EdgeInsets.fromLTRB(16, 16, 16, 0),
child:Text(
"Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. The passage is attributed to an unknown typesetter in the 15th century who is thought to have scrambled parts of Cicero's De Finibus Bonorum et Malorum for use in a type specimen book.",
textAlign: TextAlign.left,
overflow:TextOverflow.clip,
style:TextStyle(
fontWeight:FontWeight.w400,
fontStyle:FontStyle.normal,
fontSize:14,
color:Color(0xff000000),
),
),
),
Padding(
padding:EdgeInsets.all(16),
child:Align(
alignment:Alignment.centerLeft,
child:Text(
"20,000.00 BDT",
textAlign: TextAlign.start,
overflow:TextOverflow.clip,
style:TextStyle(
fontWeight:FontWeight.w700,
fontStyle:FontStyle.normal,
fontSize:20,
color:Color(0xff000000),
),
),
),
),
Padding(
padding:EdgeInsets.fromLTRB(0, 0, 16, 0),
child:Align(
alignment:Alignment.centerRight,
child:MaterialButton(
onPressed:(){},
color:Color(0xff3a57e8),
elevation:0,
shape:RoundedRectangleBorder(
borderRadius:BorderRadius.circular(16.0),
),
padding:EdgeInsets.all(16),
child:Text("Add to Cart", style: TextStyle( fontSize:14,
fontWeight:FontWeight.w700,
fontStyle:FontStyle.normal,
),),
textColor:Color(0xffffffff),
height:40,
minWidth:140,
),
),
),
],),),
)
;}
}

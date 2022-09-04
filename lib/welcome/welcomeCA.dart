///File download from FlutterViz- Drag and drop a tools. For more details visit https://flutterviz.io/

///File download from FlutterViz- Drag and drop a tools. For more details visit https://flutterviz.io/

import 'package:flutter/material.dart';


class welcomeCA extends StatelessWidget {

@override
Widget build(BuildContext context) {
return SafeArea(
  child:   Scaffold(
  
  backgroundColor: Color(0xffffffff),
  
  body:SizedBox(
  
  height:MediaQuery.of(context).size.height,
  
  width:MediaQuery.of(context).size.width,
  
  child:
  
  Stack(
  
  alignment:Alignment.topLeft,
  
  children: [
  
  ///***If you have exported images you must have to copy those images in assets/images directory.
  
  Image(
  
  image:NetworkImage("https://img.freepik.com/free-photo/cropped-image-woman-inputting-card-information-key-phone-laptop-while-shopping-online_1423-68.jpg?size=626&ext=jpg"),
  
  height:MediaQuery.of(context).size.height,
  
  width:MediaQuery.of(context).size.width,
  
  fit:BoxFit.cover,
  
  ),
  
  Container(
  
  margin:EdgeInsets.all(0),
  
  padding:EdgeInsets.all(0),
  
  width:MediaQuery.of(context).size.width,
  
  height:MediaQuery.of(context).size.height,
  
  decoration: BoxDecoration(
  
  color:Color(0x6cdedede),
  
  shape:BoxShape.rectangle,
  
  borderRadius:BorderRadius.zero,
  
  border:Border.all(color:Color(0x4d9e9e9e),width:1),
  
  ),
  
  child:
  
  
  
  Stack(
  
  alignment:Alignment.topLeft,
  
  children: [
  
  Padding(
  
  padding:EdgeInsets.all(16),
  
  child:
  
  Column(
  
  mainAxisAlignment:MainAxisAlignment.center,
  
  crossAxisAlignment:CrossAxisAlignment.center,
  
  mainAxisSize:MainAxisSize.max,
  
  children: [
  
  Container(
  
  height:80,
  
  width:80,
  
  clipBehavior: Clip.antiAlias,
  
  decoration: BoxDecoration(
  
  shape: BoxShape.circle,
  
  ),
  
  child:Image.network(
  
   "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR-FaBTOxRzlJnYfKgvUR_Ck6_ZGreFGM8ufnvvq83Jt2UkWfg8QtpeyLM2ti95bAvtWHQ&usqp=CAU",
  
  fit:BoxFit.cover),
  
  ),
  
  Padding(
  
  padding:EdgeInsets.fromLTRB(0, 16, 0, 0),
  
  child:Text(
  
  "ComArc",
  
  textAlign: TextAlign.start,
  
  overflow:TextOverflow.clip,
  
  style:TextStyle(
  
  fontWeight:FontWeight.w400,
  
  fontStyle:FontStyle.normal,
  
  fontSize:22,
  
  color:Color(0xffffffff),
  
  ),
  
  ),
  
  ),
  
  ],),),
  
  IconButton(

  
  icon:Icon(
  
  Icons.close
  
  ),
  
  onPressed:(){

    Navigator.pushReplacementNamed(context, '/customer_home');
  },
  
  color:Color(0xff212435),
  
  iconSize:24,
  
  ),
  
  ],),
  
  ),
  
  ],),),
  
  ),
)
;}
}

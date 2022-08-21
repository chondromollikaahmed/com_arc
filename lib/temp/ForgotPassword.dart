///File download from FlutterViz- Drag and drop a tools. For more details visit https://flutterviz.io/

///File download from FlutterViz- Drag and drop a tools. For more details visit https://flutterviz.io/

import 'package:flutter/material.dart';


class ForgotPassword extends StatelessWidget {

@override
Widget build(BuildContext context) {
return Scaffold(
backgroundColor: Color(0xffffffff),
appBar: 
AppBar(
elevation:0,
centerTitle:false,
automaticallyImplyLeading: false,
backgroundColor:Color(0x00ffffff),
shape:RoundedRectangleBorder(
borderRadius:BorderRadius.zero,
),
actions:[
  
InkWell(
    onTap: (){Navigator.pushReplacementNamed(context, '/login');},
    child: Icon(Icons.cancel,color:Color(0xff7c7c7c),size:30)),
],
),
body:
Stack(
alignment:Alignment.topLeft,
children: [
Align(
alignment:Alignment.center,
child:Padding(
padding:EdgeInsets.fromLTRB(16, 0, 16, 50),
child:SingleChildScrollView(
child:
Column(
mainAxisAlignment:MainAxisAlignment.start,
crossAxisAlignment:CrossAxisAlignment.center,
mainAxisSize:MainAxisSize.min,
children: [
///***If you have exported images you must have to copy those images in assets/images directory.
Image(
image:NetworkImage("https://thumbs.dreamstime.com/b/man-key-near-computer-account-login-password-vector-male-character-design-concept-business-illustration-landing-page-158893916.jpg"),
height:200,
width:200,
fit:BoxFit.cover,
),
Padding(
padding:EdgeInsets.fromLTRB(0, 30, 0, 0),
child:Text(
"Forgot Password ?",
textAlign: TextAlign.start,
overflow:TextOverflow.clip,
style:TextStyle(
fontWeight:FontWeight.w700,
fontStyle:FontStyle.normal,
fontSize:20,
color:Color(0xff3a57e8),
),
),
),
Padding(
padding:EdgeInsets.fromLTRB(30, 8, 30, 30),
child:Text(
"Do not worry! We will help you recover your Password",
textAlign: TextAlign.center,
overflow:TextOverflow.clip,
style:TextStyle(
fontWeight:FontWeight.w400,
fontStyle:FontStyle.normal,
fontSize:14,
color:Color(0xff818181),
),
),
),
Container(
alignment:Alignment.centerLeft,
margin:EdgeInsets.all(0),
padding:EdgeInsets.all(16),
width:MediaQuery.of(context).size.width,
decoration: BoxDecoration(
color:Color(0xfff2f2f2),
shape:BoxShape.rectangle,
borderRadius:BorderRadius.circular(12.0),
),
child:

Column(
mainAxisAlignment:MainAxisAlignment.start,
crossAxisAlignment:CrossAxisAlignment.start,
mainAxisSize:MainAxisSize.max,
children: [
Row(
mainAxisAlignment:MainAxisAlignment.start,
crossAxisAlignment:CrossAxisAlignment.center,
mainAxisSize:MainAxisSize.max,
children:[

Text(
"SEND YOUR EMAIL",
textAlign: TextAlign.start,
overflow:TextOverflow.clip,
style:TextStyle(
fontWeight:FontWeight.w700,
fontStyle:FontStyle.normal,
fontSize:14,
color:Color(0xff3a57e8),
),
),
Padding(
padding:EdgeInsets.fromLTRB(8, 0, 0, 0),
child:Icon(
Icons.mail,
color:Color(0xff717171),
size:16,
),
),
],),
Padding(
padding:EdgeInsets.fromLTRB(0, 16, 0, 4),
child:Text(
"We will send new password your mail.",
textAlign: TextAlign.start,
overflow:TextOverflow.clip,
style:TextStyle(
fontWeight:FontWeight.w400,
fontStyle:FontStyle.normal,
fontSize:12,
color:Color(0xff717171),
),
),
),
Text(
"chondromollika*****@****l.com",
textAlign: TextAlign.start,
overflow:TextOverflow.clip,
style:TextStyle(
fontWeight:FontWeight.w400,
fontStyle:FontStyle.normal,
fontSize:14,
color:Color(0xff000000),
),
),
],),
),
Container(
alignment:Alignment.centerLeft,
margin:EdgeInsets.symmetric(vertical: 16,horizontal:0),
padding:EdgeInsets.all(16),
width:MediaQuery.of(context).size.width,
decoration: BoxDecoration(
color:Color(0xfff2f2f2),
shape:BoxShape.rectangle,
borderRadius:BorderRadius.circular(12.0),
),
child:

InkWell(
  onTap: (){Navigator.pushReplacementNamed(context, '/otp');},
  child:   Column(

  mainAxisAlignment:MainAxisAlignment.start,

  crossAxisAlignment:CrossAxisAlignment.start,

  mainAxisSize:MainAxisSize.max,

  children: [

  Row(

  mainAxisAlignment:MainAxisAlignment.start,

  crossAxisAlignment:CrossAxisAlignment.center,

  mainAxisSize:MainAxisSize.max,

  children:[



  Text(

  "SEND YOUR PHONE NUMBER",

  textAlign: TextAlign.start,

  overflow:TextOverflow.clip,

  style:TextStyle(

  fontWeight:FontWeight.w700,

  fontStyle:FontStyle.normal,

  fontSize:14,

  color:Color(0xff3a57e8),

  ),

  ),

  Padding(

  padding:EdgeInsets.fromLTRB(8, 0, 0, 0),

  child:Icon(

  Icons.add_to_home_screen_outlined,

  color:Color(0xff717171),

  size:16,

  ),

  ),

  ],),

  Padding(

  padding:EdgeInsets.fromLTRB(0, 16, 0, 4),

  child:Text(

  "We will send new password your phone number",

  textAlign: TextAlign.start,

  overflow:TextOverflow.clip,

  style:TextStyle(

  fontWeight:FontWeight.w400,

  fontStyle:FontStyle.normal,

  fontSize:12,

  color:Color(0xff717171),

  ),

  ),

  ),

  Text(

  "+880********40",

  textAlign: TextAlign.start,

  overflow:TextOverflow.clip,

  style:TextStyle(

  fontWeight:FontWeight.w400,

  fontStyle:FontStyle.normal,

  fontSize:14,

  color:Color(0xff000000),

  ),

  ),

  ],),
),
),
],),),),),
Padding(
padding:EdgeInsets.fromLTRB(0, 0, 0, 16),
child:Align(
alignment:Alignment.bottomCenter,
child:Text(
"DON'T HAVE ACCOUNT? SIGN UP",
textAlign: TextAlign.start,
overflow:TextOverflow.clip,
style:TextStyle(
fontWeight:FontWeight.w700,
fontStyle:FontStyle.normal,
fontSize:14,
color:Color(0xff3a57e8),
),
),
),
),
],),
)
;}
}

///File download from FlutterViz- Drag and drop a tools. For more details visit https://flutterviz.io/

///File download from FlutterViz- Drag and drop a tools. For more details visit https://flutterviz.io/

import 'package:flutter/material.dart';


class verificationOTP extends StatelessWidget {

@override
Widget build(BuildContext context) {
return Scaffold(
backgroundColor: Color(0xffffffff),
appBar: 
AppBar(
elevation:0,
centerTitle:false,
automaticallyImplyLeading: false,
backgroundColor:Color(0xffffffff),
shape:RoundedRectangleBorder(
borderRadius:BorderRadius.zero,
),
leading: InkWell(
  onTap: (){Navigator.pushReplacementNamed(context, '/customer/forgot');},
  child:   Icon(

  Icons.arrow_back,

  color:Color(0xff000000),

  size:24,

  ),
),
),
body:Padding(
padding:EdgeInsets.all(16),
child:SingleChildScrollView(
child:
Column(
mainAxisAlignment:MainAxisAlignment.start,
crossAxisAlignment:CrossAxisAlignment.center,
mainAxisSize:MainAxisSize.max,
children: [
///***If you have exported images you must have to copy those images in assets/images directory.
Image(
image:NetworkImage("https://image.freepik.com/free-vector/two-factor-authentication-concept-illustration_114360-5488.jpg"),
height:150,
width:150,
fit:BoxFit.cover,
),
Padding(
padding:EdgeInsets.symmetric(vertical: 16,horizontal:0),
child:Text(
"OTP Verification",
textAlign: TextAlign.start,
overflow:TextOverflow.clip,
style:TextStyle(
fontWeight:FontWeight.w700,
fontStyle:FontStyle.normal,
fontSize:16,
color:Color(0xff000000),
),
),
),
Text(
"We will send you an one time password on this mobile number.",
textAlign: TextAlign.center,
overflow:TextOverflow.clip,
style:TextStyle(
fontWeight:FontWeight.w400,
fontStyle:FontStyle.normal,
fontSize:12,
color:Color(0xff383737),
),
),
Padding(
padding:EdgeInsets.fromLTRB(0, 30, 0, 0),
child:Text(
"Enter Mobile Number",
textAlign: TextAlign.start,
overflow:TextOverflow.clip,
style:TextStyle(
fontWeight:FontWeight.w400,
fontStyle:FontStyle.normal,
fontSize:12,
color:Color(0xff383737),
),
),
),
Padding(
padding:EdgeInsets.symmetric(vertical: 0,horizontal:16),
child:TextField(
controller:TextEditingController(text:"+880 1993522240"),
obscureText:false,
textAlign:TextAlign.center,
maxLines:1,
style:TextStyle(
fontWeight:FontWeight.w700,
fontStyle:FontStyle.normal,
fontSize:14,
color:Color(0xff000000),
),
decoration:InputDecoration(
disabledBorder:UnderlineInputBorder(
borderRadius:BorderRadius.circular(4.0),
borderSide:BorderSide(
color:Color(0xffd0cccc),
width:3
),
),
focusedBorder:UnderlineInputBorder(
borderRadius:BorderRadius.circular(4.0),
borderSide:BorderSide(
color:Color(0xffd0cccc),
width:3
),
),
enabledBorder:UnderlineInputBorder(
borderRadius:BorderRadius.circular(4.0),
borderSide:BorderSide(
color:Color(0xffd0cccc),
width:3
),
),
hintText:"Enter Text",
hintStyle:TextStyle(
fontWeight:FontWeight.w400,
fontStyle:FontStyle.normal,
fontSize:14,
color:Color(0xff000000),
),
filled:true,
fillColor:Color(0x00ffffff),
isDense:true,
contentPadding:EdgeInsets.all(16),
),
),
),
Padding(
padding:EdgeInsets.fromLTRB(0, 30, 0, 0),
child:MaterialButton(
onPressed:(){},
color:Color(0xff3a57e8),
elevation:0,
shape:RoundedRectangleBorder(
borderRadius:BorderRadius.circular(16.0),
),
padding:EdgeInsets.all(16),
child:Text("Get OTP", style: TextStyle( fontSize:14,
fontWeight:FontWeight.w400,
fontStyle:FontStyle.normal,
),),
textColor:Color(0xffffffff),
height:50,
minWidth:MediaQuery.of(context).size.width,
),
),
],),),),
)
;}
}

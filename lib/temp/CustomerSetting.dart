///File download from FlutterViz- Drag and drop a tools. For more details visit https://flutterviz.io/

///File download from FlutterViz- Drag and drop a tools. For more details visit https://flutterviz.io/

import 'package:flutter/material.dart';


class CustomerSetting extends StatelessWidget {

@override
Widget build(BuildContext context) {
return Scaffold(
backgroundColor: Color(0xffffffff),
appBar: 
AppBar(
elevation:0,
centerTitle:true,
automaticallyImplyLeading: false,
backgroundColor:Color(0x00ffffff),
shape:RoundedRectangleBorder(
borderRadius:BorderRadius.zero,
),
title:Text(
"Settings",
style:TextStyle(
fontWeight:FontWeight.w700,
fontStyle:FontStyle.normal,
fontSize:20,
color:Color(0xff000000),
),
),
leading: InkWell(
  onTap: (){Navigator.pop(context);},
  child:   Icon(

  Icons.sort,

  color:Color(0xff212435),

  size:24,

  ),
),
),
body:SingleChildScrollView(
child:
Column(
mainAxisAlignment:MainAxisAlignment.start,
crossAxisAlignment:CrossAxisAlignment.center,
mainAxisSize:MainAxisSize.max,
children: [

Card( 
margin:EdgeInsets.fromLTRB(16, 30, 16, 0),
color:Color(0xffffffff),
shadowColor:Color(0xffd5d2d2),
elevation:4,
shape:RoundedRectangleBorder(
borderRadius:BorderRadius.circular(16.0),
side: BorderSide(color:Color(0x4d9e9e9e), width:1),
),
child:
Padding(
padding:EdgeInsets.all(16),
child:
Column(
mainAxisAlignment:MainAxisAlignment.start,
crossAxisAlignment:CrossAxisAlignment.start,
mainAxisSize:MainAxisSize.max,
children: [
Text(
"Notification Settings",
textAlign: TextAlign.start,
overflow:TextOverflow.clip,
style:TextStyle(
fontWeight:FontWeight.w700,
fontStyle:FontStyle.normal,
fontSize:16,
color:Color(0xff000000),
),
),
Padding(
padding:EdgeInsets.fromLTRB(0, 30, 0, 0),
child:SwitchListTile(
value:true,
title:Text(
"Push Notification",
style:TextStyle(
fontWeight:FontWeight.w400,
fontStyle:FontStyle.normal,
fontSize:14,
color:Color(0xff000000),
),
textAlign:TextAlign.start,
),
subtitle:Text(
"Receive weekly push notification",
style:TextStyle(
fontWeight:FontWeight.w400,
fontStyle:FontStyle.normal,
fontSize:12,
color:Color(0xff737070),
),
textAlign:TextAlign.start,
),
shape:RoundedRectangleBorder(
borderRadius:BorderRadius.zero,
),
onChanged:(value){},
tileColor:Color(0x00ffffff),
activeColor:Color(0xff3a57e8),
activeTrackColor:Color(0x3f3a57e8),
controlAffinity:ListTileControlAffinity.trailing,
dense:false,
inactiveThumbColor:Color(0xff9e9e9e),
inactiveTrackColor:Color(0xffe0e0e0),
contentPadding:EdgeInsets.all(0),
selected:false,
selectedTileColor:Color(0x42000000),
),
),
Divider(
color:Color(0xff808080),
height:16,
thickness:0.3,
indent:0,
endIndent:0,
),
SwitchListTile(
value:true,
title:Text(
"Chat Notification",
style:TextStyle(
fontWeight:FontWeight.w400,
fontStyle:FontStyle.normal,
fontSize:14,
color:Color(0xff000000),
),
textAlign:TextAlign.start,
),
subtitle:Text(
"Receive chat notification",
style:TextStyle(
fontWeight:FontWeight.w400,
fontStyle:FontStyle.normal,
fontSize:12,
color:Color(0xff737070),
),
textAlign:TextAlign.start,
),
shape:RoundedRectangleBorder(
borderRadius:BorderRadius.zero,
),
onChanged:(value){},
tileColor:Color(0x00ffffff),
activeColor:Color(0xff3a57e8),
activeTrackColor:Color(0x3f3a57e8),
controlAffinity:ListTileControlAffinity.trailing,
dense:false,
inactiveThumbColor:Color(0xff9e9e9e),
inactiveTrackColor:Color(0xffe0e0e0),
contentPadding:EdgeInsets.all(0),
selected:false,
selectedTileColor:Color(0x42000000),
),
Divider(
color:Color(0xff808080),
height:16,
thickness:0.3,
indent:0,
endIndent:0,
),
SwitchListTile(
value:false,
title:Text(
"Email Notification",
style:TextStyle(
fontWeight:FontWeight.w400,
fontStyle:FontStyle.normal,
fontSize:14,
color:Color(0xff000000),
),
textAlign:TextAlign.start,
),
subtitle:Text(
"Receive email notification",
style:TextStyle(
fontWeight:FontWeight.w400,
fontStyle:FontStyle.normal,
fontSize:12,
color:Color(0xff737070),
),
textAlign:TextAlign.start,
),
shape:RoundedRectangleBorder(
borderRadius:BorderRadius.zero,
),
onChanged:(value){},
tileColor:Color(0x00ffffff),
activeColor:Color(0xff3a57e8),
activeTrackColor:Color(0x3f3a57e8),
controlAffinity:ListTileControlAffinity.trailing,
dense:false,
inactiveThumbColor:Color(0xff9e9e9e),
inactiveTrackColor:Color(0xffe0e0e0),
contentPadding:EdgeInsets.all(0),
selected:false,
selectedTileColor:Color(0x42000000),
),
],),),
),

Card( 
margin:EdgeInsets.fromLTRB(16, 16, 16, 30),
color:Color(0xffffffff),
shadowColor:Color(0xffd5d2d2),
elevation:4,
shape:RoundedRectangleBorder(
borderRadius:BorderRadius.circular(16.0),
side: BorderSide(color:Color(0x4d9e9e9e), width:1),
),
child:
Padding(
padding:EdgeInsets.all(16),
child:
Column(
mainAxisAlignment:MainAxisAlignment.start,
crossAxisAlignment:CrossAxisAlignment.start,
mainAxisSize:MainAxisSize.max,
children: [
Text(
"Support",
textAlign: TextAlign.start,
overflow:TextOverflow.clip,
style:TextStyle(
fontWeight:FontWeight.w700,
fontStyle:FontStyle.normal,
fontSize:16,
color:Color(0xff000000),
),
),
Padding(
padding:EdgeInsets.fromLTRB(0, 30, 0, 0),
child:ListTile(
tileColor:Color(0x00ffffff),
title:Text("Help",
style:TextStyle(
fontWeight:FontWeight.w400,
fontStyle:FontStyle.normal,
fontSize:16,
color:Color(0xff000000),
),
textAlign:TextAlign.start,
),
dense:false,
contentPadding:EdgeInsets.all(0),
selected:false,
selectedTileColor:Color(0x42000000),
shape:RoundedRectangleBorder(
borderRadius:BorderRadius.zero,
),
trailing:Icon(Icons.arrow_forward_ios,color:Color(0xff767678),size:18),
),
),
Divider(
color:Color(0xff808080),
height:16,
thickness:0.3,
indent:0,
endIndent:0,
),
InkWell(
  onTap: (){
    Navigator.pushNamed(context, '/support');
  },
  child:   ListTile(

  tileColor:Color(0x00ffffff),

  title:Text("Contact Us",

  style:TextStyle(

  fontWeight:FontWeight.w400,

  fontStyle:FontStyle.normal,

  fontSize:16,

  color:Color(0xff000000),

  ),

  textAlign:TextAlign.start,

  ),

  dense:false,

  contentPadding:EdgeInsets.all(0),

  selected:false,

  selectedTileColor:Color(0x42000000),

  shape:RoundedRectangleBorder(

  borderRadius:BorderRadius.zero,

  ),

  trailing:Icon(Icons.arrow_forward_ios,color:Color(0xff767678),size:18),

  ),
),
],),),
),
Padding(
padding:EdgeInsets.symmetric(vertical: 0,horizontal:16),
child:MaterialButton(
onPressed:(){},
color:Color(0xff3a57e8),
elevation:0,
shape:RoundedRectangleBorder(
borderRadius:BorderRadius.circular(24.0),
),
padding:EdgeInsets.all(16),
child:Text("Logout", style: TextStyle( fontSize:16,
fontWeight:FontWeight.w700,
fontStyle:FontStyle.normal,
),),
textColor:Color(0xffffffff),
height:50,
minWidth:MediaQuery.of(context).size.width,
),
),

SizedBox(
height:16,
width:16,
),
],),),
)
;}
}

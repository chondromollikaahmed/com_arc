
import 'package:flutter/material.dart';



class CA_SnackBar {
  static void showSnackBar(var _scaffoldKey, String message) {
    _scaffoldKey.currentState!.hideCurrentSnackBar();
    _scaffoldKey.currentState!.showSnackBar(SnackBar(
      duration: Duration(seconds: 2),
      backgroundColor: Colors.blueGrey,
      content: Text(
        message, style: TextStyle(color: Colors.white, fontSize: 12),
        textAlign: TextAlign.center,),
    ));
  }


}
import 'package:com_arc/customs/com_arc_customs.dart';
import 'package:flutter/material.dart';



class ManageProducts extends StatelessWidget {
  const ManageProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.white,
        title: ComArcTitle(title: 'Manage Products'),
        leading: ComArcBackButton(),
      ),
    );
  }
}

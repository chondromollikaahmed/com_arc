import 'package:com_arc/customs/com_arc_customs.dart';
import 'package:flutter/material.dart';



class MyStore extends StatelessWidget {
  const MyStore({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.white,
        title: ComArcTitle(title: 'My Store'),
        leading: ComArcBackButton(),
      ),
    );
  }
}

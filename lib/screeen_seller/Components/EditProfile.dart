import 'package:com_arc/customs/com_arc_customs.dart';
import 'package:flutter/material.dart';



class EditProfile extends StatelessWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.white,
        title: ComArcTitle(title: 'Edit Profile'),
        leading: ComArcBackButton(),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class CustomerRegister extends StatelessWidget {
  const CustomerRegister({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(

        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [
              Text('Sign Up',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
              IconButton(onPressed: (){
                Navigator.pushReplacementNamed(context, '/');
              }, icon: FaIcon(FontAwesomeIcons.arrowRightFromBracket,size :40 ))
            ],
          )
        ],

      ),
    );
  }
}

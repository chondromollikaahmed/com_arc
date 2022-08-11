import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class ComArcBackButton extends StatelessWidget {
  const ComArcBackButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back_ios_new_rounded,color: Colors.black,),
      onPressed: (){
        Navigator.pop(context);
      },
    );
  }
}

class ComArcTitle extends StatelessWidget {
  const ComArcTitle({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(title,style: GoogleFonts.acme( textStyle:const TextStyle(color: Colors.black),),);
  }
}

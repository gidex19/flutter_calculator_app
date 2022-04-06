// ignore_for_file: file_names, unused_import, deprecated_member_use, import_of_legacy_library_into_null_safe, prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CalcButton extends StatelessWidget {
  final String text;
  final int textColor;
  final int fillColor;
  final double? textSize;
  final Function callback;
  const CalcButton({ Key? key, required this.text,
   required this.fillColor, 
   this.textSize=24,
   this.textColor=0xFFFFFFFF, required this.callback }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    // ignore: avoid_unnecessary_containers
    return Container(
      margin: EdgeInsets.all(7),
      child: SizedBox(
        width: 65,
        height: 65,
        child: FlatButton(
          child: Text(
            text,
            style: GoogleFonts.rubik(
            textStyle: TextStyle(
              fontSize: textSize,
            ),
          ),
          ),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
          color: Color(fillColor),
          textColor: Color(textColor),
          onPressed: (){
           callback(text);
          }),
      ),
    );
  }
}
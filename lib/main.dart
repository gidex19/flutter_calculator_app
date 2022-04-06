// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, unused_import, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, prefer_final_fields, unused_field, unused_local_variable
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:math_expressions/math_expressions.dart';
import './widgets/CalcButton.dart';

void main() {
  runApp(CalcApp());
}

class CalcApp extends StatefulWidget {
  const CalcApp({ Key? key }) : super(key: key);

  @override
  CalcAppState createState() => CalcAppState();
}



class CalcAppState extends State<CalcApp> {
  String _history = '';
  String _expression = '';  

  void numberClicked(String text){
    setState(() {
      _expression += text;
    });
  }

  void allClear(String text){
    setState(() {
      _history = '';
      _expression = ''; 
    });
  }
  
  void clear(String text){
    setState(() {
      _expression = ''; 
    });
  }

  void evaluate(String text){
    Parser p = Parser();
    Expression exp = p.parse(_expression);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    setState(() {
    _history = _expression;
    _expression = eval.toString();
    });
  }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator App',
      home: Scaffold(
        backgroundColor: Color(0xFF000000) ,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
              Container(
                padding: EdgeInsets.all(15),
                alignment: Alignment.bottomRight,
                child: Text(_history,
                style: GoogleFonts.rubik(
                  textStyle: TextStyle(
                    fontSize: 25,
                  ),
                  color: Colors.white60
                ) ,),
              ),
              Container(
                padding: EdgeInsets.all(15),
                alignment: Alignment.bottomRight,
                child: Text(_expression,
                style: GoogleFonts.rubik(
                  textStyle: TextStyle(
                    fontSize: 50,
                  ),
                  color: Colors.white
                ) ,),
              ),
              SizedBox(
                height: 20,
              ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                  CalcButton(text: 'AC', fillColor: 0xAAAAAAAA, textColor: 0XFFFFFFFF, callback: allClear),
                  CalcButton(text: 'C', fillColor: 0xAAAAAAAA, textColor: 0XFFFFFFFF, callback: clear),
                  CalcButton(text: '%', fillColor: 0xCCCCCCFF, textColor: 0XFFFFFFFF, callback: numberClicked),
                  CalcButton(text: '/', fillColor: 0xAA22FFFF, textColor: 0XFFFFFFFF, callback: numberClicked),

                  ],
      ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                  CalcButton(text: '1', fillColor: 0XFF000000, textColor: 0xFFFFFFFF, callback: numberClicked),
                  CalcButton(text: '2', fillColor: 0XFF000000, textColor: 0xFFFFFFFF, callback: numberClicked),
                  CalcButton(text: '3', fillColor: 0XFF000000, textColor: 0xFFFFFFFF, callback: numberClicked),
                  CalcButton(text: '*', fillColor: 0xAA22FFFF, textColor: 0XFFFFFFFF, textSize: 30, callback: numberClicked),

                  ],
      ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                  CalcButton(text: '4', fillColor: 0XFF000000, textColor: 0xFFFFFFFF, callback: numberClicked),
                  CalcButton(text: '5', fillColor: 0XFF000000, textColor: 0xFFFFFFFF, callback: numberClicked),
                  CalcButton(text: '6', fillColor: 0XFF000000, textColor: 0xFFFFFFFF, callback: numberClicked),
                  CalcButton(text: '-', fillColor: 0xFFFFFFFF, textColor: 0XFF000000, textSize: 30, callback: numberClicked),

                  ],
      ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                  CalcButton(text: '7', fillColor: 0XFF000000, textColor: 0xFFFFFFFF, callback: numberClicked),
                  CalcButton(text: '8', fillColor: 0XFF000000, textColor: 0xFFFFFFFF, callback: numberClicked),
                  CalcButton(text: '9', fillColor: 0XFF000000, textColor: 0xFFFFFFFF, callback: numberClicked),
                  CalcButton(text: '+', fillColor: 0xFFFFFFFF, textColor: 0XFF000000, textSize: 30, callback: numberClicked),

                  ],
      ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                  CalcButton(text: '.', fillColor: 0XFF000000, textColor: 0xFFFFFFFF, callback: numberClicked),
                  CalcButton(text: '0', fillColor: 0XFF000000, textColor: 0xFFFFFFFF, callback: numberClicked),
                  CalcButton(text: '00', fillColor: 0XFF000000, textColor: 0xFFFFFFFF, callback: numberClicked),
                  CalcButton(text: '=', fillColor: 0xFFFFFFFF, textColor: 0XFF000000, callback: evaluate),

                  ],
      ),
              ],
            
          
        )
    )
    );
  }
}


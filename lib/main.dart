import 'dart:io';

import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Calculator',
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new CalculatorPage(),
    );
  }
}

class CalculatorPage extends StatefulWidget {
  @override
  _CalculatorPageState createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {

  String output = "0";
  String _output = "0";
  double num1 = 0.0;
  double num2 = 0.0;
  String operand = '';

  buttonPressed(String buttontext){

    if(buttontext == "C")
    {
   _output ='0';
   num1 = 0.0;
   num2 = 0.0;
   operand ="";
    }

    else if(buttontext == 'OFF')
    {
      exit(0);
    }

    else if(buttontext =='+' || buttontext == '-' || buttontext == "/" || buttontext == "X" || buttontext == "%")
    {
      num1 = double.parse(output);
      operand = buttontext;
      _output ='0';
    }

    else if(buttontext =='.')
    {
      if(_output.contains("."))
      {
        return;
      }

      else
      {
      _output=_output+buttontext;
      }

      }
    
      else if(buttontext == '=')
    {
    num2 = double.parse(output);
    if(operand == "+")
    {
      
      _output = (num1+num2).toString();
    }

    if(operand == "-")
    {
      
      _output = (num1-num2).toString();
    }

    if(operand == "X")
    {
      
      _output = (num1*num2).toString();
    }

    if(operand == "/")
    {
      num2 = double.parse(output);
      _output = (num1/num2).toString();
    }

    if(operand == "%")
    {
      
      _output = (num1%num2).toString();
    }
    num1 = 0.0;
    num2 = 0.0;
    operand = "";

   }

   else
  {
    _output = _output + buttontext;
  }

  setState((){
        output = double.parse(_output).toStringAsFixed(2);
    });

  }

  Widget buildButton(String buttontext){
   return new Container(
      margin: new EdgeInsets.all(6.0),
      height: double.infinity,
      width: double.infinity,
      alignment: Alignment.center,
      decoration: new BoxDecoration(
          borderRadius: new BorderRadius.all(new Radius.circular(16.0)),
          color: Colors.white24),
      child: FlatButton(
              child: new Text(
          buttontext,
          style: new TextStyle(color: Colors.black, fontSize: 26.0),
        ), onPressed: () =>buttonPressed(buttontext),
      ),
    ); 
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text('Calculator',style: TextStyle(fontSize:40,color: Colors.black45,fontStyle: FontStyle.italic)),centerTitle:true,backgroundColor:Color(0xff50E3C2),elevation: 0.0,
      ),
      drawer: Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
         children:<Widget>[
           DrawerHeader(
             decoration: BoxDecoration(color:Colors.black),
              child: Column(
                 crossAxisAlignment:CrossAxisAlignment.start,
                mainAxisAlignment:MainAxisAlignment.end,
                 children: <Widget>[
                       Align(
                         alignment: Alignment.centerLeft,
                     child:Text('About a Devoloper!',style: TextStyle(fontSize:14.0,color:Colors.white,fontStyle:FontStyle.italic,fontWeight:FontWeight.bold),),
                        ),
                        SizedBox(height:5),
                   Container(
                     width:83,
                     height:83,
                     child:CircleAvatar(backgroundImage: AssetImage('assets/images/venky.jpeg'),
                     ),
                   ),
                   SizedBox(height:2),
                   Text(
                    'Venkatesh Rajendran',
                     style: TextStyle(
                       fontSize: 18,
                       fontWeight: FontWeight.bold,
                       color: Colors.white70
                     ),
                     ),
                     SizedBox(height: 0),
                     Text(
                       'rcvenky26@gmail.com',
                       style: TextStyle(
                         fontSize:15,
                         color:Colors.greenAccent,
                         fontStyle:FontStyle.italic,
                       ),
                     ),
                 ],
               ),
             ),
         ]
        )
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Color(0xff50E3C2),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Flexible(
                  flex: 3,
                  child: new Container(
                        height: double.infinity,
                        width: double.infinity,
                        color: Color(0xff50E3C2),
                        child: Container(
                          alignment: Alignment.centerRight,
                          padding: EdgeInsets.symmetric(
                            vertical:24.0,
                            horizontal:12.0,
                          ),
                          child: Text(
                          output,
                          style: TextStyle(
                            fontSize:48.0,
                            fontWeight:FontWeight.bold,
                          ),
                            ),
                        ),
                        ),
                ),
                Flexible(
                  flex: 5,
                  child: Container(
                    height: double.infinity,
                    width: double.infinity,
                    color: Color(0xff50E3C2),

                    child: new Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Flexible(
                            flex: 1,
                            child: new Container(
                              height: double.infinity,
                              width: double.infinity,
                              child: new Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Flexible(flex: 1, child: buildButton("OFF")),
                                  Flexible(flex: 1, child: buildButton("/")),
                                  Flexible(flex: 1, child: buildButton("%")),
                                  Flexible(flex: 1, child: buildButton('C'))
                                ],
                              ),
                            ),
                          ),

                          Flexible(
                            flex: 1,
                            child: new Container(
                              height: double.infinity,
                              width: double.infinity,
                              child: new Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Flexible(flex: 1, child: buildButton("7")),
                                  Flexible(flex: 1, child: buildButton("8")),
                                  Flexible(flex: 1, child: buildButton("9")),
                                  Flexible(flex: 1, child: buildButton("X"))
                                ],
                              ),
                            ),
                          ),
                          Flexible(
                            flex: 1,
                            child: new Container(
                              height: double.infinity,
                              width: double.infinity,
                              child: new Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Flexible(flex: 1, child: buildButton("4")),
                                  Flexible(flex: 1, child: buildButton("5")),
                                  Flexible(flex: 1, child: buildButton("6")),
                                  Flexible(flex: 1, child: buildButton("-"))
                                ],
                              ),
                            ),
                          ),
                          Flexible(
                            flex: 1,
                            child: new Container(
                              height: double.infinity,
                              width: double.infinity,
                              child: new Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Flexible(flex: 1, child: buildButton("1")),
                                  Flexible(flex: 1, child: buildButton("2")),
                                  Flexible(flex: 1, child: buildButton("3")),
                                  Flexible(flex: 1, child: buildButton("+"))
                                ],
                              ),
                            ),
                          ),
                          Flexible(
                            flex: 1,
                            child: new Container(
                              height: double.infinity,
                              width: double.infinity,
                              child: new Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Flexible(flex: 1, child: buildButton("0")),
                                  Flexible(flex: 1, child: buildButton(".")),
                                  Flexible(flex: 2, child: buildButton("=")),
                                ],
                              ),
                            ),
                          ),
                        ],
                    ),
                  ),
                ),
              ],
                      ),
          ),
        ),
    );
  }
}
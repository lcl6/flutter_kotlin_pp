import 'package:flutter/material.dart';

class Counter extends StatefulWidget{

  static const CounterName="Counter";

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _CounterState();
  }

}

class _CounterState extends State{

  int _counter = 0;

  void _inCrement(){
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(title: new Text('测试点击'),),
      body:  Center(

        child:  new Column(


    children: <Widget>[

        new RaisedButton(onPressed: _inCrement,child: new Text('increment')),
        new Text('Count:$_counter')
    ],

      )
    ),
    );




  }

}

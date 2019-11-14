import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailRoute extends StatelessWidget{

  static const routeName = 'DetailRoute';
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("详情"),
      ),
      body: Center(
        child: Text("this is detail"),
      ),
    );
  }

}
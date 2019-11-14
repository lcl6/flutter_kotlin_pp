import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginRoute extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("登录页"),
      ),
      body: Center(
        child: Text("这是登录页"),
      ),

    );
  }

}
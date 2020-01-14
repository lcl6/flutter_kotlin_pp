import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_kotlin_pp/state/Counter.dart';
import 'package:fluttertoast/fluttertoast.dart';

class DetailRoute extends StatelessWidget{
  static const routeName = 'DetailRoute';
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(title:new Text("详情")),

      body: new Container(
        padding: const EdgeInsets.all(10.0),
        alignment: Alignment.topCenter,

      child: new Container(
        child: new Column(
          children: <Widget>[
            new Row(
              //平分居中
//          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                //相当于weight  会把同级别的控件 在父控件中填满整个父控件
                Expanded(

                  child:new IconButton(
                    icon: new Icon(Icons.menu),
                    tooltip: 'Navigation menu',
                    onPressed: (){

                      
                    }, // null 会禁用 button
                    alignment: Alignment.centerLeft,
                  ) ,
                )
                ,
                // Expanded expands its child to fill the available space.
                new IconButton(
                  icon: new Icon(Icons.search),
                  tooltip: 'Search',
                  onPressed: (){   Navigator.push(context,MaterialPageRoute(builder: (context) => Counter()));},
                ),
              ],
            ),

//
//             Image(
//              image: AssetImage('images/logo.png'),
//            ),
          Container(


            child: new GestureDetector(
              onTap: (){Fluttertoast.showToast(
                  msg: "This is Center Short Toast",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIos: 1,
                  backgroundColor: Colors.red,
                  textColor: Colors.white,
                  fontSize: 16.0
              );},
              child:  new FadeInImage.assetNetwork(
                placeholder:'images/logo.png',
                image: 'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
              ) ,
            ),
          ),

            new Container(
              //设置边距
              margin:EdgeInsets.fromLTRB(0.0,10.0,00.10,0),
              child:  new Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  new RaisedButton(onPressed: (){
                    showDialog<Null>(
                      context: context,
                      barrierDismissible: false,
                      builder: (BuildContext context) {
                        return new AlertDialog(
                          title: new Text('撤退'),
                          content: new SingleChildScrollView(
                            child: new ListBody(
                              children: <Widget>[
                                new Text('敌人来了跑呀跑敌人来了跑呀跑呀跑呀跑呀跑呀跑呀跑呀跑呀跑呀跑呀跑呀敌人来了跑呀跑呀跑呀跑呀跑呀跑呀跑呀跑呀跑呀跑呀跑呀跑呀跑呀跑呀跑呀跑呀跑呀跑呀跑呀敌人来了跑呀跑呀跑呀跑呀跑呀跑呀跑呀跑呀跑呀跑呀跑呀跑呀跑呀跑呀跑呀跑呀跑呀跑呀跑呀敌人来了跑呀跑呀跑呀跑呀跑呀跑呀跑呀跑呀跑呀跑呀跑呀跑呀跑呀跑呀跑呀跑呀跑呀跑呀跑呀敌人来了跑呀跑呀跑呀跑呀跑呀跑呀跑呀跑呀跑呀跑呀跑呀跑呀跑呀跑呀跑呀跑呀跑呀跑呀跑呀敌人来了跑呀跑呀跑呀跑呀跑呀跑呀跑呀跑呀跑呀跑呀跑呀跑呀跑呀跑呀跑呀跑呀跑呀跑呀跑呀敌人来了跑呀跑呀跑呀跑呀跑呀跑呀跑呀跑呀跑呀跑呀跑呀跑呀跑呀跑呀跑呀跑呀跑呀跑呀跑呀敌人来了跑呀跑呀跑呀跑呀跑呀跑呀跑呀跑呀跑呀跑呀跑呀跑呀跑呀跑呀跑呀跑呀跑呀跑呀跑呀敌人来了跑呀跑呀跑呀跑呀跑呀跑呀跑呀跑呀跑呀跑呀跑呀跑呀跑呀跑呀跑呀跑呀跑呀跑呀跑呀敌人来了跑呀跑呀跑呀跑呀跑呀跑呀跑呀跑呀跑呀跑呀跑呀跑呀跑呀跑呀跑呀跑呀跑呀跑呀跑呀敌人来了跑呀跑呀跑呀跑呀跑呀跑呀跑呀跑呀跑呀跑呀跑呀跑呀跑呀跑呀跑呀跑呀跑呀跑呀跑呀敌人来了跑呀跑呀跑呀跑呀跑呀跑呀跑呀跑呀跑呀跑呀跑呀跑呀跑呀跑呀跑呀跑呀跑呀跑呀跑呀跑呀跑呀跑呀跑呀跑呀跑呀跑呀跑呀敌人来了跑呀跑呀跑呀跑呀跑呀跑呀跑呀跑呀跑呀跑呀跑呀跑呀跑呀跑呀跑呀跑呀跑呀跑呀跑呀呀跑呀跑呀跑呀跑呀跑呀跑呀跑呀跑呀跑呀跑呀跑呀跑呀跑呀跑呀跑呀跑呀跑呀'),
                                new Text('抛压'),
                              ],
                            ),
                          ),
                          actions: <Widget>[
                            new FlatButton(
                              child: new Text('消失'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                    ).then((val) {
                      print(val);
                    });},
                    child: new Text('撤退'),
                  ),
                  new RaisedButton(onPressed: null,
                    child: new Text('冲鸭'),
                  )
                ],
              ),
            )
          ],
        )
      ),


      ),



    );


  }


}
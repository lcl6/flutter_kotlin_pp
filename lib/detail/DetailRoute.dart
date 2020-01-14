import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_kotlin_pp/detail/Counter.dart';
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
                      showDialog(context: context,
                          builder: (BuildContext context) {
                            return CupertinoAlertDialog(
                              title: Text("这是一个iOS风格的对话框"),
                              content: SizedBox(
                                height: 150.0,
                                child: SingleChildScrollView(
                                  child: ListBody(
                                    children: <Widget>[
                                      Text("第1行"),
                                      Text("第2行"),
                                      Text("第3行"),
                                      Text("第4行"),
                                      Text("第5行"),
                                      Text("第6行"),
                                    ],
                                  ),
                                ),
                              ),
                              actions: <Widget>[
                                CupertinoDialogAction(
                                  child: Text("取消"),
                                  onPressed: () {
                                    Navigator.pop(context);
                                    print("取消");
                                  },
                                ),
                                CupertinoDialogAction(
                                  child: Text("确定"),
                                  onPressed: () {
                                    Navigator.pop(context);
                                    print("确定");
                                  },
                                ),
                              ],
                            );
                          }
                      );
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
                  new RaisedButton(onPressed: (){
                    _showMenu(context);
                  },
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

  _showMenu(BuildContext context) {
    final RenderBox button = context.findRenderObject();
    final RenderBox overlay = Overlay
        .of(context)
        .context
        .findRenderObject();

    final RelativeRect position = RelativeRect.fromRect(
      Rect.fromPoints(
        button.localToGlobal(Offset(100, 100), ancestor: overlay),
        button.localToGlobal(button.size.bottomRight(Offset.zero),
            ancestor: overlay),
      ),
      Offset.zero & overlay.size,
    );
    showMenu<String>(
      context: context,
      items: _getPopupMenu(context),
      position: position,
    // ignore: missing_return
    ).then<void>((String newValue) {
//      if (!mounted) return null;
      if (newValue == null) {
        print(newValue);
        Fluttertoast.showToast(
            msg: "点击了取消",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIos: 1,
            backgroundColor: Colors.blueAccent,
            textColor: Colors.white,
            fontSize: 16.0
        );
        return null;
      }
      print(newValue);
              Fluttertoast.showToast(
            msg: "点击了$newValue",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIos: 1,
            backgroundColor: Colors.blueAccent,
            textColor: Colors.white,
            fontSize: 16.0
        );
    });
  }
}

  _getPopupMenu(BuildContext context) {
    return <PopupMenuEntry<String>>[
      PopupMenuItem<String>(
        value: '4',
        child: Text('语文'),
      ),
      PopupMenuItem<String>(
        value: '3',
        child: Text('数学'),
      ),
      PopupMenuItem<String>(
        value: '2',
        child: Text('英语'),
      ),
      PopupMenuItem<String>(
        value: '1',
        child: Text('生物'),
      ),
      PopupMenuItem<String>(
        value: '0',
        child: Text('化学'),
      ),
    ];
  }

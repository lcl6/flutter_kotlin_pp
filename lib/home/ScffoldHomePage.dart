import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_kotlin_pp/home/RandomWords.dart';
import 'package:flutter_kotlin_pp/home/EmalItemPage.dart';
import 'package:flutter_kotlin_pp/home/PeopleItemPage.dart';

class ScffoldHomePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new ScffoldHomePageState();
  }


}

class ScffoldHomePageState extends State<ScffoldHomePage>{

  num index=0;
  List<Widget> pageList= [
    new RandomWords(),
    new EmalItemPage(),
    new PeopleItemPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: new Text('卡布奇诺'),

      ),
      body:pageList[index] ,
      floatingActionButton: FloatingActionButton(
        child: Text("++"),
        onPressed: (){
          print('点击了float');
        },
        tooltip: "长按了按钮",
        backgroundColor: Colors.blue,

      ),

      drawer: Container(
        color: Colors.amber,
        width: 120,
        child: FlatButton(
          child: Text('关闭左滑菜单'),
          onPressed: (){
            Navigator.of(context).pop();
          },
        ),
      ),

      bottomNavigationBar: new BottomNavigationBar(items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.home,color: index==0?Colors.blue:Colors.grey,),title: Text('首页',style: TextStyle(color: index==0?Colors.blue:Colors.grey))),
        BottomNavigationBarItem(icon: Icon(Icons.email,color: index==1?Colors.blue:Colors.grey,),title: Text('邮件',style: TextStyle(color: index==1?Colors.blue:Colors.grey))),
        BottomNavigationBarItem(icon: Icon(Icons.people,color: index==2?Colors.blue:Colors.grey,),title: Text('我的',style: TextStyle(color: index==2?Colors.blue:Colors.grey))),
      ],
      onTap: (flag){

        print('flag $flag');
        index= flag;
        setState(() {
        });
      },
        currentIndex: index,
      ),
    );
  }

}

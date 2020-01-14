import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_kotlin_pp/home/EmalItemPage.dart';

class TabBarDemoState  extends State<EmalItemPage> with SingleTickerProviderStateMixin {

  TabController _tabController; //定义tabcontroller变量
  @override
  void dispose() {
    _tabController.dispose(); //销毁
    super.dispose();
  }

  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, length: 3); //创建
    _tabController.addListener((){
      print(_tabController.index.toString());

    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(

      body: new Column(
        children: <Widget>[
          Container(child: new TabBar(
            labelColor:Colors.blue,
            unselectedLabelColor: Colors.grey,
            tabs: <Widget>[
              new Tab(
                icon: new Icon(Icons.directions_bike),
                text: "自行车",
              ),
              new Tab(
                icon: new Icon(Icons.directions_boat),
                text: "船",
              ),
              new Tab(
                icon: new Icon(Icons.directions_bus),
                text: "巴士",
              ),
            ],
            controller: _tabController, //tabbar与自定义的tabcontroller绑定
          )),
          Expanded(child:   new TabBarView(
            controller: _tabController, //tabbarView与 自定义的tabController绑定
            children: <Widget>[
              new Center(child: new Text('自行车')),
              new Center(child: new Text('船')),
              new Center(child: new Text('巴士')),
            ],
          ),)

        ],

      )


    );
  }

}
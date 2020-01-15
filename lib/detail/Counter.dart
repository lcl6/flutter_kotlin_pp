import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_kotlin_pp/bean/NewsBean.dart';

class Counter extends StatefulWidget {
  static const CounterName = "Counter";

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _CounterState();
  }
}

class _CounterState extends State {
  Future _gerData() async {
    Response response;
    Dio dio = new Dio();
    response = await dio.get("http://gank.io/api/data/Android/10/1");

    print(response.toString());
    return response;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(
        title: new Text('网络请求'),
      ),
      body: FutureBuilder(
        builder: _buildFuture,// AsyncWidgetBuilder类型的回到函数，是一个基于异步交互构建widget的函数；
        future: _gerData(),// Future对象表示此构建器当前连接的异步计算
      ),
    );
  }

  Widget _buildFuture(BuildContext context, AsyncSnapshot snapshot) {
    switch (snapshot.connectionState) {
      case ConnectionState.none:
        print('还没有开始网络请求');
        return Text('还没有开始网络请求');
      case ConnectionState.active:
        print('active');
        return Text('ConnectionState.active');
      case ConnectionState.waiting:
        print('waiting');
        return Center(
          child: CircularProgressIndicator(),
        );
      case ConnectionState.done:
        print('done');
        if (!snapshot.hasData) return Text('Error: ${snapshot.error}');
        return _createListView(context, snapshot);
      default:
        return null;
    }
  }

  Widget _createListView(BuildContext context, AsyncSnapshot snapshot) {
    print('-0------');
    print(snapshot.data.toString());
    print('-0------');
    final body = json.decode(snapshot.data.toString());
    final feeds = body['results'];
    print(feeds.toString());
    var items = [];
    feeds.forEach((item) {
      items.add(NewsBean(item["type"], item["publishedAt"], item["url"]));
    });
    return new ListView.builder(
        itemBuilder: (context, index) => _itemBuilder(context, index, items),
        itemCount: items.length * 2);
  }

  Widget _itemBuilder(BuildContext context, int index, List movies) {
    if (index.isOdd) {
      return Divider();
    }
    index = index ~/ 2;
    NewsBean bean = movies[index];

    return new Column(
      children: <Widget>[
        new FadeInImage.assetNetwork(
          placeholder: 'images/logo.png',
          image:
              "https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg",
        ),
        Row(
          children: <Widget>[
            Text(bean.type),
            Expanded(
              child: Text(
                bean.publishedAt,
                textAlign: TextAlign.right,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

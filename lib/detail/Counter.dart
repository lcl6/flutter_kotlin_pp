import 'package:dio/dio.dart';
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

  Future _gerData() async {
    Response response;
    Dio dio = new Dio();
    response = await dio.get("https://gank.io/api/data/Android/10/1");
    print(response.data.toString());
    return response;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(title: new Text('测试点击'),),
      body: FutureBuilder(
        builder: _buildFuture,
        future:_gerData() ,
      ),

    );




  }

  Widget  _buildFuture(BuildContext context, AsyncSnapshot snapshot) {
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
        if (snapshot.hasError) return Text('Error: ${snapshot.error}');
        return _createListView(context, snapshot);
      default:
        return null;
    }
  }

  Widget _createListView(BuildContext context, AsyncSnapshot snapshot) {
    List movies = snapshot.data['subjects'];
    return new ListView.builder(itemBuilder: (context,index)=>_itemBuilder(context,index,movies),
        itemCount: movies.length * 2);
  }

  Widget _itemBuilder(BuildContext context, int index, List movies) {
    if (index.isOdd) {
      return Divider();
    }
    index = index ~/ 2;
    return ListTile(
      title: Text(movies[index]['title']),
      leading: Text(movies[index]['year']),
      trailing: Text(movies[index]['original_title']),
    );


  }


}

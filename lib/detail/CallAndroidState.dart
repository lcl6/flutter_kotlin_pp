import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CallAndroidState extends StatefulWidget{
  static const CallAndroidStateName = "CallAndroidState";
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return CallAndroid();
  }

}
/// 名称要和Java端一致
const channelName = "com.mmd.flutterapp/plugin";

const methodName = "log";

const MethodChannel channel = MethodChannel(channelName);

class CallAndroid extends State{

  static const platform = const MethodChannel("flutter.example.com/native");


  var title = "demo";
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('调用安卓'),
      ),
      body: new Column(
        children: <Widget>[
          Text(title),
          RaisedButton(
            child: Text('调用安卓吧'),
            onPressed: (){
              _testLog();
            },
          ),
        ],
      ),
    );
  }

  // ignore: missing_return
  Future<String> _testLog() async{

    final String result = await platform.invokeMethod<String>("getData", "aaa");
    print(result);
//    Fluttertoast.showToast(
//        msg: result,
//        toastLength: Toast.LENGTH_SHORT,
//        gravity: ToastGravity.CENTER,
//        timeInSecForIos: 1,
//        backgroundColor: Colors.blueGrey,
//        textColor: Colors.white,
//        fontSize: 16.0
//    );

    setState(() {
      title=result;
    });
  }


}





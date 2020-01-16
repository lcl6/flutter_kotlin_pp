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
  //flutter 调用安卓
  static const platform = const MethodChannel("flutter.example.com/native");
  //安卓调用flutter
  static const platformChannel =const MethodChannel('com.example.platform_channel/text');
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    platformChannel.setMethodCallHandler((methodCall) async {
      switch (methodCall.method) {
        case 'showText':
          String content = await methodCall.arguments['content'];
          if (content != null && content.isNotEmpty) {
            setState(() {
              titlefl = content;
            });
            return 'success';
          } else {
            throw PlatformException(
                code: 'error', message: '失败', details: 'content is null');
          }
          break;
        default:
          throw MissingPluginException();
      }
    });
  

  }
  var title = "demo";
  var titlefl = "demoflutter";
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('调用安卓'),
      ),
      body: new Column(
        children: <Widget>[
          Text(title),
          Text(titlefl),
          RaisedButton(
            child: Text('调用安卓吧'),
            onPressed: (){
              _testLog();
            },
          ),
          RaisedButton(
            child: Text('安卓调用flutter'),
            onPressed: (){
              _callFlutter();

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

  Future<String> _callFlutter() async {
    final String result = await platform.invokeMethod<String>("callflutter", "aaa");

  }


}





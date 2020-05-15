import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:flutter/services.dart';
import 'package:flutter_kotlin_pp/home/RandomWords.dart';
import 'package:flutter_kotlin_pp/home/ScffoldHomePage.dart';
import 'package:permission_handler/permission_handler.dart';

import 'detail/DetailRoute.dart';
import 'login/LoginRoute.dart';

 Future main() async {
   WidgetsFlutterBinding.ensureInitialized();
  if(!await _requestPermissions()){
    await AppUtils.popApp();//定位要提前打开
  }else{
    runApp(MyApp());
  }
}

class AppUtils {
  static Future<void> popApp() async {
    await SystemChannels.platform.invokeMethod('SystemNavigator.pop');
  }
}

Future<bool> _requestPermissions() async{
  Map<PermissionGroup, PermissionStatus> permissions =
      await PermissionHandler().requestPermissions([
    PermissionGroup.storage,
    PermissionGroup.location,
    PermissionGroup.camera,
  ]);

  List<bool> results = permissions.values.toList().map((status) {
    return status == PermissionStatus.granted;
  }).toList();
  return !results.contains(false);
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      onGenerateRoute: (RouteSettings settings) {
        String routeName = settings.name;
        var isLogin = settings.arguments;

        return MaterialPageRoute(builder: (context) {
          if (isLogin) {
            if (routeName == DetailRoute.routeName) {
              return new DetailRoute();
            } else {
              return new LoginRoute();
            }
          } else {
            return new LoginRoute();
          }
        });
      },
//        routes: {
//            "DetailRoute":(context)=>DetailRoute(),
//        },
      //测试列表
//        home: RandomWords(),
      //测试tab
      home: ScffoldHomePage(),
//      home: MyHomePage(title: 'Welcome to flutter'),
    );
  }
}

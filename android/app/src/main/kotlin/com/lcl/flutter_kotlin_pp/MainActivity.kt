package com.lcl.flutter_kotlin_pp

import android.os.Bundle
import android.widget.Toast

import io.flutter.app.FlutterActivity
import io.flutter.plugins.GeneratedPluginRegistrant
import io.flutter.plugin.common.MethodChannel




class MainActivity: FlutterActivity() {
  private lateinit var methodChannel :MethodChannel
  var context=this
  override fun onCreate(savedInstanceState: Bundle?) {
    super.onCreate(savedInstanceState)
    GeneratedPluginRegistrant.registerWith(this)

    //flutter 调用安卓
    val platform: MethodChannel = MethodChannel(flutterView, "flutter.example.com/native")

    //安卓调用flutter
    methodChannel = MethodChannel(flutterView, "com.example.platform_channel/text")//


    platform.setMethodCallHandler {
      call, result ->

      // 下面的方法将在主线程中调用
      if (call.method == "getData") {

        try {

          val res: String = getData(call.arguments) // call.arguments对应上面的param
          showAlertDialog()
          result.success(res) // 调用成功

        } catch (e: Exception) {
          e.printStackTrace()
          result.error("UNAVAILABLE", "有问题出现", null)
        }
      } else if (call.method == "callflutter") {
        callFlutter()
      }else  {
        result.notImplemented() // 无此方法实现
      }
    }


  }

  private fun callFlutter() {
    val map = HashMap<String,String>()
    map.put("content", "Android调用fluuter")
    methodChannel.invokeMethod("showText",map,object :MethodChannel.Result{
      override fun success(result: Any?) {
        Toast.makeText(context,result as String,Toast.LENGTH_SHORT).show()
      }

      override fun error(errorCode: String?, errorMessage: String?, errorDetails: Any?) {
        Toast.makeText(context,errorMessage as String,Toast.LENGTH_SHORT).show()
      }

      override fun notImplemented() {
        Toast.makeText(context,"notImplemented" as String,Toast.LENGTH_SHORT).show()

      }
    })

  }

  private fun showAlertDialog() {
//    var  alertDialog=AlertDialog.Builder(this)
//    alertDialog.setPositiveButton("确定",null)
//    alertDialog.setTitle("安卓原生dialog")
//    alertDialog.show()

    Toast.makeText(context,"安卓原生吐司",Toast.LENGTH_SHORT).show()
  }

  private fun getData(text: Any): String {
    return "调用成功啦";
  }



}

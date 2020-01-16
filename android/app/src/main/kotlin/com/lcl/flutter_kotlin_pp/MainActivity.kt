package com.lcl.flutter_kotlin_pp

import android.app.AlertDialog
import android.app.Dialog
import android.os.Bundle
import android.widget.Toast

import io.flutter.app.FlutterActivity
import io.flutter.plugins.GeneratedPluginRegistrant
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {
  override fun onCreate(savedInstanceState: Bundle?) {
    super.onCreate(savedInstanceState)
    GeneratedPluginRegistrant.registerWith(this)

    val platform: MethodChannel = MethodChannel(flutterView, "flutter.example.com/native")
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
      } else {
        result.notImplemented() // 无此方法实现
      }
    }


  }

  private fun showAlertDialog() {
//    var  alertDialog=AlertDialog.Builder(this)
//    alertDialog.setPositiveButton("确定",null)
//    alertDialog.setTitle("安卓原生dialog")
//    alertDialog.show()

    Toast.makeText(this,"安卓原生吐司",Toast.LENGTH_SHORT).show()
  }

  private fun getData(text: Any): String {
    return "调用成功啦";
  }

}

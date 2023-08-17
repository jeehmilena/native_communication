package com.example.native_communication

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {

    private val CHANNEL = "jessica.com.br/native"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler {
                call, result ->

            if (call.method == "calcSum"){
               val numberA = call.argument<Int>("numberA")?.toInt() ?: 0
                val numberB = call.argument<Int>("numberB")?.toInt() ?: 0
                result.success(numberA + numberB)

            }else{
                result.notImplemented()
            }

        }
    }
}

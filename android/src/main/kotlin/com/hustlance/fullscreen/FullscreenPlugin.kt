package com.hustlance.fullscreen


import android.app.Activity
import android.os.Build
import android.util.Log
import android.view.View
import androidx.annotation.NonNull
import androidx.annotation.RequiresApi
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result


/** FullscreenPlugin */
public class FullscreenPlugin : FlutterPlugin, MethodCallHandler, ActivityAware  {

    private lateinit var channel: MethodChannel

    private lateinit var activity: Activity
    private var isFullScreen : Boolean = false

    override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        channel = MethodChannel(flutterPluginBinding.getFlutterEngine().getDartExecutor(), "fullscreen")
        channel.setMethodCallHandler(this);
    }



    @RequiresApi(Build.VERSION_CODES.KITKAT)
    override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {

        when (call.method) {
            "emersive" -> {
                emersive()
            }
            "emersiveStingy" -> {
                emersiveStingy()
            }
            "leanBack" -> {
                leanBack()
            }
            "exitFullScreen" -> {
                exitFullScreen()
            } "status" -> {
            result.success(isFullScreen)
        }
            else -> {
                result.notImplemented()
            }
        }
    }

    override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }

    override fun onAttachedToActivity(binding: ActivityPluginBinding) {
        this.activity = binding.activity
        status()
    }

    override fun onDetachedFromActivityForConfigChanges() {
        TODO("Not yet implemented")
    }

    override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
        this.activity = binding.activity
    }

    override fun onDetachedFromActivity() {
        TODO("Not yet implemented")
    }


    private fun status() {
   activity.window.decorView.setOnSystemUiVisibilityChangeListener { visibility ->
            if (visibility and View.SYSTEM_UI_FLAG_FULLSCREEN == 0) {
                // TODO: The system bars are visible. Make any desired
                Log.i("System_bar", "System bar visible")

                this.isFullScreen = false
                print(isFullScreen)
            } else {
                // TODO: The system bars are NOT visible. Make any desired
                Log.i("System_bar", "System bar hidden")
                this.isFullScreen = true
                print(isFullScreen)
            }
        }

    }

    private fun exitFullScreen() {
        activity.window.decorView.systemUiVisibility = (View.SYSTEM_UI_FLAG_LAYOUT_STABLE
                or View.SYSTEM_UI_FLAG_LAYOUT_HIDE_NAVIGATION
                or View.SYSTEM_UI_FLAG_LAYOUT_FULLSCREEN)
    }

    @RequiresApi(Build.VERSION_CODES.KITKAT)
    private fun emersive() {
        activity.window.decorView.systemUiVisibility = (View.SYSTEM_UI_FLAG_IMMERSIVE
                or View.SYSTEM_UI_FLAG_LAYOUT_STABLE
                or View.SYSTEM_UI_FLAG_LAYOUT_HIDE_NAVIGATION
                or View.SYSTEM_UI_FLAG_LAYOUT_FULLSCREEN
                or View.SYSTEM_UI_FLAG_HIDE_NAVIGATION
                or View.SYSTEM_UI_FLAG_FULLSCREEN)
    }

    @RequiresApi(Build.VERSION_CODES.KITKAT)
    private fun emersiveStingy() {
        activity.window.decorView.systemUiVisibility = (View.SYSTEM_UI_FLAG_IMMERSIVE_STICKY
                or View.SYSTEM_UI_FLAG_LAYOUT_STABLE
                or View.SYSTEM_UI_FLAG_LAYOUT_HIDE_NAVIGATION
                or View.SYSTEM_UI_FLAG_LAYOUT_FULLSCREEN
                or View.SYSTEM_UI_FLAG_HIDE_NAVIGATION
                or View.SYSTEM_UI_FLAG_FULLSCREEN)
    }

    private fun leanBack() {
        activity.window.decorView.systemUiVisibility = (View.SYSTEM_UI_FLAG_LAYOUT_STABLE
                or View.SYSTEM_UI_FLAG_LAYOUT_HIDE_NAVIGATION
                or View.SYSTEM_UI_FLAG_LAYOUT_FULLSCREEN
                or View.SYSTEM_UI_FLAG_HIDE_NAVIGATION
                or View.SYSTEM_UI_FLAG_FULLSCREEN)
    }
}


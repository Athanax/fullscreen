import 'dart:async';

import 'package:flutter/services.dart';

class Fullscreen {
  static const MethodChannel _channel = const MethodChannel('fullscreen');
  

  Future enterFullScreen(FullScreenMode fullScreenMode) async {
    try {
      if (fullScreenMode == FullScreenMode.EMERSIVE) {
        await _channel.invokeMethod('emersive');
      } else if (fullScreenMode == FullScreenMode.EMERSIVE_STINGY) {
        await _channel.invokeMethod('emersiveStingy');
      } else if (fullScreenMode == FullScreenMode.LEANBACK) {
        await _channel.invokeMethod('leanBack');
      }
    } catch (e) {
      print(e);
    }
  }
  
  Future<bool> get isFullScreen async {
    bool status;
    try{
       status = await _channel.invokeMethod("status");

    } catch (e){
      print(e);
    }
    return status;
  }

  Future exitFullScreen() async {
    try {
      await _channel.invokeMethod('exitFullScreen');
    } catch (e) {
      print(e);
    }
  }
}

enum FullScreenMode { EMERSIVE, EMERSIVE_STINGY, LEANBACK }

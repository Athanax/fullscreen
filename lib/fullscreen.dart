import 'dart:async';
import 'dart:io' show Platform;
import 'package:flutter/services.dart';

class FullScreen {
  // meothod channel instal
  static const MethodChannel _channel = const MethodChannel('fullscreen');

  /// To enable fullscreen mode, pass the fullscreen mode as an argument the the enterFullScreen method of the FullScreen class.
  Future enterFullScreen(FullScreenMode fullScreenMode) async {
    if (Platform.isIOS) {
      SystemChrome.setEnabledSystemUIOverlays([]);
    } else if (Platform.isAndroid) {
      try {
        if (fullScreenMode == FullScreenMode.EMERSIVE) {
          await _channel.invokeMethod('emersive');
        } else if (fullScreenMode == FullScreenMode.EMERSIVE_STICKY) {
          await _channel.invokeMethod('emersiveSticky');
        } else if (fullScreenMode == FullScreenMode.LEANBACK) {
          await _channel.invokeMethod('leanBack');
        }
      } catch (e) {
        print(e);
      }
    }
  }

  /// to get the current status of the SystemUI
  Future<bool> get isFullScreen async {
    bool status;
    try {
      status = await _channel.invokeMethod("status");
    } catch (e) {
      print(e);
    }
    return status;
  }

  /// Exit full screen
  Future exitFullScreen() async {
    if (Platform.isIOS) {
      SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    } else if (Platform.isAndroid) {
      try {
        await _channel.invokeMethod('exitFullScreen');
      } catch (e) {
        print(e);
      }
    }
  }
}

enum FullScreenMode { EMERSIVE, EMERSIVE_STICKY, LEANBACK }

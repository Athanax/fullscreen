import 'dart:async';

import 'src/fullscreen_native.dart'
    if (dart.library.html) 'src/fullscreen_web.dart';

class FullScreen {
  static Future<void> enterFullScreen(
          [FullScreenMode fullScreenMode = FullScreenMode.EMERSIVE]) =>
      FullScreenPlatform.enterFullScreen(fullScreenMode);

  /// to get the current status of the SystemUI
  static Future<bool?> get isFullScreen => FullScreenPlatform.isFullScreen;

  /// Exit full screen
  static Future<void> exitFullScreen() => FullScreenPlatform.exitFullScreen();
}

enum FullScreenMode { EMERSIVE, EMERSIVE_STICKY, LEANBACK }

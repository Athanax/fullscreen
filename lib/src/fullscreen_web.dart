// In order to *not* need this ignore, consider extracting the "web" version
// of your plugin as a separate package, instead of inlining it in the same
// package as the core of your plugin.
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' show window;

import 'package:fullscreen/fullscreen.dart';

/// A web implementation of the FullscreenPlatform of the Fullscreen plugin.
class FullScreenPlatform {
  static Future<void> enterFullScreen(
      [FullScreenMode fullScreenMode = FullScreenMode.EMERSIVE]) async {
    try {
      await window.document.documentElement?.requestFullscreen();
    } catch (e) {}
  }

  /// to get the current status of the SystemUI
  static Future<bool?> get isFullScreen async {
    return window.document.fullscreenElement != null;
  }

  /// Exit full screen
  static Future<void> exitFullScreen() async {
    window.document.exitFullscreen();
  }
}

# fullscreen

# Introduction
This is a flutter plugin that makes it easy to enable fullscreen in flutter application. The implements the three fullscreen modes of the android platform and those for iOS. 

# Summary
Some content is best experienced fullscreen, like videos, games, image galleries, books, and slides in a presentation. This page shows how you can engage users more deeply with content in fullscreen and protect users from exiting the app accidentally.

You might be tempted to enable fullscreen mode just to maximize screen space for your app. But be mindful of how often users jump in and out of apps to check notifications, do impromptu searches, and more. Using fullscreen causes users to lose easy access to system navigation, so you should use fullscreen mode only when the benefit to the user experience goes beyond simply receiving a little extra space (such as to avoid accidental exits during a game or delivering a valuable immersive exerience for images, videos, and books).
## Fullscreen options
Android offers three options to making your app fullscreen: Lean Back, Immersive, and Immersive Sticky. In all three approaches, the system bars are hidden and your activity continues to receive all touch events. The difference between them is how the user can bring the system bars back into view.
```dart
FullScreenMode.LEANBACK
```
The lean back mode is for fullscreen experiences in which users won't be interacting heavily with the screen, such as while watching a video.

When users want to bring back the system bars, they simply tap the screen anywhere.
```dart
FullScreenMode.EMERSIVE
```
The immersive mode is intended for apps in which the user will be heavily interacting with the screen. Examples are games, viewing images in a gallery, or reading paginated content, like a book or slides in a presentation.

When users need to bring back the system bars, they swipe from any edge where a system bar is hidden. By requiring this more deliberate gesture, the user's engagement with your app won't be interrupted by accidental touches and swipes.

``` dart
FullScreenMode.EMERSIVE_STICKY
```
n the regular immersive mode, any time a user swipes from an edge, the system takes care of revealing the system bars—your app won't even be aware that the gesture occurred. So if the user might actually need to swipe from the edge of the screen as part of the primary app experience—such as when playing a game that requires lots of swiping or using a drawing app—you should instead enable the "sticky" immersive mode.

While in sticky immersive mode, if the user swipes from an edge with a system bar, system bars appear but they're semi-transparent, and the touch gesture is passed to your app so it can also respond to the gesture.

For example, in a drawing app that uses this approach, if the user wants to draw a line that begins at the very edge of the screen, swiping from the edge reveals the system bars and also starts drawing a line that begins at the very edge. The bars automatically disappear after a few seconds of no interaction or as soon as the user touches or gestures anywhere outside the system bars.

# Installation
Add the following statement in your pubspec.yaml file in the dependencies section.
``` yaml
dependencies:
    flutter:
        sdk: flutter
    fullscreen: <latest-version>


```
# How to use
Import the package
``` dart
import 'package:fullscreen/fullscreen.dart';
```


Create an instance of the FullScreen class
``` dart
  FullScreen fullscreen = new FullScreen()
```
To enable fullscreen mode with Sticky emersive, pass the fullscreen mode (FullScreenMode.EMERSIVE_STICKY)as an argument the the enterFullScreen method of the FullScreen class.

``` dart
  await fullscreen.enterFullScreen(FullScreenMode.EMERSIVE_STICKY);
```

To exit fullscreen, call the exitFullScreen method of the FullScreen class
``` dart
  await fullscreen.exitFullScreen();
```

## Getting Started with flutter?



For help getting started with Flutter, view our 
[online documentation](https://flutter.dev/docs), which offers tutorials, 
samples, guidance on mobile development, and a full API reference.

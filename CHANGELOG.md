## [1.0.3] Monday, 6 February, 2021

* Solve possible crushes on android, "An operation is not implemented" [#3](https://github.com/Athanax/fullscreen/issues/3)
* Breaking change, Remove constructor and implement static methods:
``` dart
    // To enter FullScreenMode.EMERSIVE_STICKY, 
    await FullScreen.enterFullScreen(FullScreenMode.EMERSIVE_STICKY);
```

``` dart 
    // To exit fullscreen mode
    await FullScreen.exitFullScreen();
```
* Migrate to null safety

## [1.0.2] Monday, 6 February, 2021

* Add iOS support [#1](https://github.com/Athanax/fullscreen/issues/1)

## [1.0.1] Monday, 21 September, 2020

* add documentation comments

## [1.0.0] Monday, 21 September, 2020

* First version

import 'package:flutter/material.dart';
import 'package:fullscreen/fullscreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Fullscreen fullscreen;

  @override
  void initState() {
    super.initState();
    fullscreen = new Fullscreen();
  }

  void enterFullScreen(FullScreenMode fullScreenMode) async {
    await fullscreen.enterFullScreen(fullScreenMode);
  }

  void exitFullScreen() async {
    await fullscreen.exitFullScreen();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FloatingActionButton(
              onPressed: () async {
                enterFullScreen(FullScreenMode.EMERSIVE_STINGY);
              },
              child: new Icon(Icons.fullscreen),
            ),
            FloatingActionButton(
              onPressed: () async {
                exitFullScreen();
              },
              child: new Icon(Icons.fullscreen_exit),
            ),
          ],
        ),
        appBar: AppBar(
          title: const Text('Fullscreen plugin'),
        ),
        body: Center(child: new Text('Flutter full screen plugin')),
      ),
    );
  }
}

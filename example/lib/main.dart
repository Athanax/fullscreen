import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:fullscreen/fullscreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  Fullscreen fullscreen = new Fullscreen();

  @override
  void initState() {
    super.initState();
    // initPlatformState();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FloatingActionButton(onPressed: (){
              fullscreen.enterFullScreen(FullScreenMode.EMERSIVE_STINGY);
            }, child: new Icon(Icons.fullscreen),),
            FloatingActionButton(onPressed: (){
              fullscreen.exitFullScreen();
            }, child: new Icon(Icons.fullscreen_exit),),
          ],
        ),
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
    child: Text('Running on'),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';
import 'package:device_preview/device_preview.dart';

void main() => runApp(
      DevicePreview(
        builder: (context) => MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: DevicePreview.appBuilder,
      home: HomeApp(),
    );
  }
}

class HomeApp extends StatelessWidget {
  final player = AudioCache();

  @override
  Widget build(BuildContext context) {
    final devicesize = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            Flexible(
              flex: 1,
              child: Material(
                color: Colors.red,
                child: InkWell(
                  //enableFeedback: true ,

                  splashColor: Colors.yellow,
                  // highlightColor: Colors.black,
                  onTap: () {
                    player.play('sounds/note1.wav');
                  },
                  child: Container(
                      // height: devicesize * 0.13,
                      // color: Colors.transparent,
                      ),
                ),
              ),
            ),
            Flexible(
              flex: 1,
              child: InkWell(
                //enableFeedback: true ,

                splashColor: Colors.yellow,
                highlightColor: Colors.black,
                onTap: () {
                  player.play('sounds/note2.wav');
                },
                child: Container(
                  // height: devicesize * 0.13,
                  color: Colors.yellow,
                ),
              ),
            ),
            Flexible(
              flex: 1,
              child: InkWell(
                //enableFeedback: true ,

                splashColor: Colors.yellow,
                highlightColor: Colors.black,
                onTap: () {
                  player.play('sounds/note3.wav');
                },
                child: Container(
                  // height: devicesize * 0.13,
                  color: Colors.greenAccent,
                ),
              ),
            ),
            Flexible(
              flex: 1,
              child: InkWell(
                //enableFeedback: true ,

                splashColor: Colors.yellow,
                highlightColor: Colors.black,
                onTap: () {
                  player.play('sounds/note4.wav');
                },
                child: Container(
                  // height: devicesize * 0.13,
                  color: Colors.pink,
                ),
              ),
            ),
            Flexible(
              flex: 1,
              child: InkWell(
                //enableFeedback: true ,

                splashColor: Colors.yellow,
                highlightColor: Colors.black,
                onTap: () {
                  player.play('sounds/note5.wav');
                },
                child: Container(
                  // height: devicesize * 0.13,
                  color: Colors.orangeAccent,
                ),
              ),
            ),
            Flexible(
              flex: 1,
              child: InkWell(
                //enableFeedback: true ,

                splashColor: Colors.yellow,
                highlightColor: Colors.black,
                onTap: () {
                  player.play('sounds/note6.wav');
                },
                child: Container(
                  // height: devicesize * 0.13,
                  color: Colors.purple,
                ),
              ),
            ),
            Flexible(
              flex: 1,
              child: InkWell(
                //enableFeedback: true ,

                splashColor: Colors.yellow,
                highlightColor: Colors.black,
                onTap: () {
                  player.play('sounds/note7.wav');
                },
                child: Container(
                  // height: devicesize * 0.13,
                  color: Colors.red,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

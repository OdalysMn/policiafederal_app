import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:policiafederal_app/Pages/ImageQuizPage.dart';
import 'package:policiafederal_app/QuizResources/Quizzes.dart';
import 'package:video_launcher/video_launcher.dart';
import 'package:path_provider/path_provider.dart';

class LevelsPage extends StatefulWidget {
  @override
  LevelsPageState createState() => new LevelsPageState();
}

class LevelsPageState extends State<LevelsPage> {
  var localAssetPath;
  int toPlay;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Niveles'),
        backgroundColor: Colors.indigo[900],
      ),
      body: new ListView(
        children: <Widget>[
          new Card(
            child: new Stack(
              children: <Widget>[
                new Row(
                  children: <Widget>[
                    new Container(
                      width: 150.0,
                      height: 150.0,
                      margin: new EdgeInsets.all(5.0),
                      child: new Image.asset(
                        'assets/nivel1.jpg',
                        fit: BoxFit.fill,
                      ),
                    ),
                    new Column(
                      children: <Widget>[
                        new Row(
                          children: <Widget>[
                            new IconButton(
                              icon: new Icon(
                                Icons.play_arrow,
                                color: Colors.teal[500],
                              ),
                              onPressed: () {
                                _playVideo(1);
                              },
                              iconSize: 70.0,
                            ),
                            new IconButton(
                              icon: new Icon(
                                Icons.extension,
                                color: Colors.indigo[900],
                              ),
                              onPressed: () {
                                _initQuiz(1, context);
                              },
                              iconSize: 50.0,
                            ),
                          ],
                        ),
                        new Row(
                          children: <Widget>[
                            new Container(
                              margin: new EdgeInsets.only(
                                left: 10.0,
                                right: 5.0,
                              ),
                              child: new Text(
                                'Nivel 1',
                                style: new TextStyle(
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                ),
              ],
            ),
          ),
          new Card(
            child: new Stack(
              children: <Widget>[
                new Row(
                  children: <Widget>[
                    new Container(
                      width: 150.0,
                      height: 150.0,
                      margin: new EdgeInsets.all(5.0),
                      child: new Image.asset(
                        'assets/nivel2.jpg',
                        fit: BoxFit.fill,
                      ),
                    ),
                    new Column(
                      children: <Widget>[
                        new Row(
                          children: <Widget>[
                            new IconButton(
                              icon: new Icon(
                                Icons.play_arrow,
                                color: Colors.teal[500],
                              ),
                              onPressed: () {
                                _playVideo(2);
                              },
                              iconSize: 70.0,
                            ),
                            new IconButton(
                              icon: new Icon(
                                Icons.extension,
                                color: Colors.indigo[900],
                              ),
                              onPressed: () {
                                _initQuiz(2, context);
                              },
                              iconSize: 50.0,
                            ),
                          ],
                        ),
                        new Row(
                          children: <Widget>[
                            new Container(
                              margin: new EdgeInsets.only(
                                left: 10.0,
                                right: 5.0,
                              ),
                              child: new Text(
                                'Nivel 2',
                                style: new TextStyle(
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                ),
              ],
            ),
          ),
          new Card(
            child: new Stack(
              children: <Widget>[
                new Row(
                  children: <Widget>[
                    new Container(
                      width: 150.0,
                      height: 150.0,
                      margin: new EdgeInsets.all(5.0),
                      child: new Image.asset(
                        'assets/nivel3.jpg',
                        fit: BoxFit.fill,
                      ),
                    ),
                    new Column(
                      children: <Widget>[
                        new Row(
                          children: <Widget>[
                            new IconButton(
                              icon: new Icon(
                                Icons.play_arrow,
                                color: Colors.teal[500],
                              ),
                              onPressed: () {
                                _playVideo(3);
                              },
                              iconSize: 70.0,
                            ),
                            new IconButton(
                              icon: new Icon(
                                Icons.extension,
                                color: Colors.indigo[900],
                              ),
                              onPressed: () {
                                _initQuiz(3, context);
                              },
                              iconSize: 50.0,
                            ),
                          ],
                        ),
                        new Row(
                          children: <Widget>[
                            new Container(
                              margin: new EdgeInsets.only(
                                left: 10.0,
                                right: 5.0,
                              ),
                              child: new Text(
                                'Nivel 3',
                                style: new TextStyle(
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                ),
              ],
            ),
          ),
          new Card(
            child: new Stack(
              children: <Widget>[
                new Row(
                  children: <Widget>[
                    new Container(
                      width: 150.0,
                      height: 150.0,
                      margin: new EdgeInsets.all(5.0),
                      child: new Image.asset(
                        'assets/nivel4.jpg',
                        fit: BoxFit.fill,
                      ),
                    ),
                    new Column(
                      children: <Widget>[
                        new Row(
                          children: <Widget>[
                            new IconButton(
                              icon: new Icon(
                                Icons.play_arrow,
                                color: Colors.teal[500],
                              ),
                              onPressed: () {
                                _playVideo(4);
                              },
                              iconSize: 70.0,
                            ),
                            new IconButton(
                              icon: new Icon(
                                Icons.extension,
                                color: Colors.indigo[900],
                              ),
                              onPressed: () {
                                _initQuiz(4, context);
                              },
                              iconSize: 50.0,
                            ),
                          ],
                        ),
                        new Row(
                          children: <Widget>[
                            new Container(
                              margin: new EdgeInsets.only(
                                left: 10.0,
                                right: 5.0,
                              ),
                              child: new Text(
                                'Nivel 4',
                                style: new TextStyle(
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                ),
              ],
            ),
          ),
        ],
        itemExtent: 150.0,
      ),
    );
  }

  Future _playVideo(int i) async {
    /*if (await canLaunchVideo('assets/test.mp4', isLocal: true)) {
      print('Success');
      print('Could not launch ' + 'test.mp4');
      await launchVideo('assets/test.mp4', isLocal: true);
    } else {
      print('Could not launch ' + 'test.mp4');
      throw 'Could not launch ' + 'test.mp4';
    }*/

    toPlay = i;
    await copyLocalAsset();
  }

  Future copyLocalAsset() async {
    final dir = await getApplicationDocumentsDirectory();
    final file = new File("${dir.path}/test.mp4");
    final videoData =
        await rootBundle.load('assets/nivel' + toPlay.toString() + '.mp4');
    final bytes = videoData.buffer.asUint8List();
    file.writeAsBytes(bytes, flush: true);
    setState(() {
      localAssetPath = file.path;
      _launchLocalAsset();
    });
  }

  _launchLocalAsset() {
    setState(() {
      _launchVideo(localAssetPath, isLocal: true);
    });
  }

  Future<Null> _launchVideo(String url, {bool isLocal: false}) async {
    if (await canLaunchVideo(url, isLocal: isLocal)) {
      await launchVideo(url, isLocal: isLocal);
    } else {
      throw 'Could not launch $url';
    }
  }

  void _initQuiz(int i, BuildContext context) {
    //Check what level is saved on the Singleton
    Navigator.of(context).push(new MaterialPageRoute(
      builder: (BuildContext context) {
        return new ImageQuizPage(
            questionObject: Quizzes.allQuizzes[0], activityNumber: 1);
      },
    ));
  }
}

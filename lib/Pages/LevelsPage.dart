import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:policiafederal_app/Pages/ImageQuizPage.dart';
import 'package:policiafederal_app/QuizResources/Quizzes.dart';
import 'package:policiafederal_app/Singeltons/Utilities.dart';
import 'package:policiafederal_app/Pages/TextQuizPage.dart';

class LevelsPage extends StatefulWidget {
  @override
  LevelsPageState createState() => new LevelsPageState();
}

class LevelsPageState extends State<LevelsPage> {
  var localAssetPath;
  int toPlay;
  String percentage;
  static const channel = const MethodChannel('com.yourcompany.policiafederalapp/general');

  @override
  Widget build(BuildContext context) {
    percentage = _calculatePercentage();

    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Niveles'),
        actions: [
          new FlatButton(
              onPressed: () {},
              child: new Text(
                '$percentage%',
                style: new TextStyle(color: Colors.white, fontSize: 20.0),
              ))
        ],
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
                        'assets/nivel5.jpg',
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
                                _playVideo(5);
                              },
                              iconSize: 70.0,
                            ),
                            new IconButton(
                              icon: new Icon(
                                Icons.extension,
                                color: Colors.indigo[900],
                              ),
                              onPressed: () {
                                _initQuiz(5, context);
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
                                'Nivel 5',
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
                        'assets/nivel6.jpg',
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
                                _playVideo(6);
                              },
                              iconSize: 70.0,
                            ),
                            new IconButton(
                              icon: new Icon(
                                Icons.extension,
                                color: Colors.indigo[900],
                              ),
                              onPressed: () {
                                _initQuiz(6, context);
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
                                'Nivel 6',
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
                        'assets/nivel7.jpg',
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
                                _playVideo(7);
                              },
                              iconSize: 70.0,
                            ),
                            new IconButton(
                              icon: new Icon(
                                Icons.extension,
                                color: Colors.indigo[900],
                              ),
                              onPressed: () {
                                _initQuiz(7, context);
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
                                'Nivel 7',
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
                        'assets/nivel8.jpeg',
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
                                _playVideo(8);
                              },
                              iconSize: 70.0,
                            ),
                            new IconButton(
                              icon: new Icon(
                                Icons.extension,
                                color: Colors.indigo[900],
                              ),
                              onPressed: () {
                                _initQuiz(8, context);
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
                                'Nivel 8',
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
                        'assets/puzzle.jpg',
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
                                color: Colors.indigo[900],
                              ),
                              onPressed: () {
                                _callPuzzle();
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
                                'Puzzle',
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

  Future<Null> _callPuzzle() async {
    try {
      bool isSolved = await channel.invokeMethod('openPuzzle');
    } on PlatformException catch (e, s) {}

  }
  Future _playVideo(int i) async {

    Map params = {'level': i};
    print('Params are: ' + params.toString());
    try {
      await channel.invokeMethod('openVideo', params);
    } on PlatformException catch (e, s) {}

  }



  void _initQuiz(int i, BuildContext context) {
    print('_initQuiz()');

    new Utilities().setCurrentLevel(i);
    //Check what level is saved on the Singleton
    int currentLevel = new Utilities().getCurrentLevel();

    print('currentLevel: $currentLevel');

    if (currentLevel == 1) {
      new Utilities().setCurrentActivity(0);

      Navigator.of(context).pushReplacement(new MaterialPageRoute(
        builder: (BuildContext context) {
          return new ImageQuizPage(
              questionObject: Quizzes.allQuizzes[0], activityNumber: 1);
        },
      ));
    } else if (currentLevel == 2) {

      new Utilities().setCurrentActivity(5);

      Navigator.of(context).pushReplacement(new MaterialPageRoute(
        builder: (BuildContext context) {
          return new TextQuizPage(
              questionObject: Quizzes.allQuizzes[4], activityNumber: 5);
        },
      ));
    } else if (currentLevel == 3) {

      new Utilities().setCurrentActivity(8);

      Navigator.of(context).pushReplacement(new MaterialPageRoute(
        builder: (BuildContext context) {
          return new TextQuizPage(
              questionObject: Quizzes.allQuizzes[7], activityNumber: 8);
        },
      ));
    } else if (currentLevel == 4) {

      new Utilities().setCurrentActivity(11);

      Navigator.of(context).pushReplacement(new MaterialPageRoute(
        builder: (BuildContext context) {
          return new TextQuizPage(
              questionObject: Quizzes.allQuizzes[10], activityNumber: 11);
        },
      ));
    } else if (currentLevel == 5) {

      new Utilities().setCurrentActivity(13);

      Navigator.of(context).pushReplacement(new MaterialPageRoute(
        builder: (BuildContext context) {
          return new ImageQuizPage(
              questionObject: Quizzes.allQuizzes[12], activityNumber: 13);
        },
      ));
    } else if(currentLevel == 6){

      new Utilities().setCurrentActivity(17);

      Navigator.of(context).pushReplacement(new MaterialPageRoute(
        builder: (BuildContext context) {
          return new TextQuizPage(
              questionObject: Quizzes.allQuizzes[16], activityNumber: 17);
        },
      ));

    } else if(currentLevel == 7){

      new Utilities().setCurrentActivity(21);

      Navigator.of(context).pushReplacement(new MaterialPageRoute(
        builder: (BuildContext context) {
          return new TextQuizPage(
              questionObject: Quizzes.allQuizzes[20], activityNumber: 21);
        },
      ));

    } else if(currentLevel == 8){

      new Utilities().setCurrentActivity(25);

      Navigator.of(context).pushReplacement(new MaterialPageRoute(
        builder: (BuildContext context) {
          return new TextQuizPage(
              questionObject: Quizzes.allQuizzes[24], activityNumber: 25);
        },
      ));

    }
  }

  String _calculatePercentage() {
    int completedActivities = new Utilities().getCompletedActivities();

    if (completedActivities != null) {
      return ((completedActivities / Quizzes.allQuizzes.length) * 100.round())
          .toStringAsFixed(0);
    } else
      return '0';
  }
}

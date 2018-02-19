import 'package:flutter/material.dart';
import 'package:policiafederal_app/QuizResources/Quizzes.dart';
import 'package:policiafederal_app/Singeltons/Utilities.dart';
import 'package:policiafederal_app/Pages/ImageQuizPage.dart';
import 'package:policiafederal_app/Pages/TrueFalseQuizPage.dart';
import 'package:policiafederal_app/Pages/LevelsPage.dart';

class TextQuizPage extends StatefulWidget {
  Map questionObject;
  int activityNumber;

  TextQuizPage({Key key, this.questionObject, this.activityNumber})
      : super(key: key);

  @override
  TextQuizPageState createState() => new TextQuizPageState(
      questionObject: questionObject, activityNumber: activityNumber);
}

class TextQuizPageState extends State<TextQuizPage> {
  Map questionObject;
  String question;
  List options;
  int answer;
  int activityNumber;
  int myGroupValue = null;

  @override
  void initState() {
    setState(() {
      question = questionObject['question'];
      answer = questionObject['answer'];
      options = questionObject['options'];
    });
  }

  TextQuizPageState({Key key, this.questionObject, this.activityNumber});

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Actividad ' + activityNumber.toString()),
        backgroundColor: Colors.indigo[900],
      ),
      body: new Column(
        children: <Widget>[
          new Container(
            child: new Text(
              question,
              style: new TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            margin: new EdgeInsets.all(20.0),
          ),
          new Flexible(
            child: new GridView.count(
              primary: false,
              padding: const EdgeInsets.all(20.0),
              crossAxisSpacing: 10.0,
              crossAxisCount: 2,
              children: <Widget>[
                new Column(
                  children: <Widget>[
                    new Row(
                      children: <Widget>[
                        new Radio<int>(
                          value: 0,
                          groupValue: myGroupValue,
                          onChanged: (int changedValue) {
                            setState(() {
                              myGroupValue = changedValue;
                            });
                          },
                        ),
                        new Flexible(
                          child: new Text(
                            options[0]['text'],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                new Column(
                  children: <Widget>[
                    new Row(
                      children: <Widget>[
                        new Radio<int>(
                          value: 1,
                          groupValue: myGroupValue,
                          onChanged: (int changedValue) {
                            setState(() {
                              myGroupValue = changedValue;
                            });
                          },
                        ),
                        new Flexible(
                          child: new Text(
                            options[1]['text'],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                new Column(
                  children: <Widget>[
                    new Row(
                      children: <Widget>[
                        new Radio<int>(
                          value: 2,
                          groupValue: myGroupValue,
                          onChanged: (int changedValue) {
                            setState(() {
                              myGroupValue = changedValue;
                            });
                          },
                        ),
                        new Flexible(
                          child: new Text(
                            options[2]['text'],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                new Column(
                  children: <Widget>[
                    new Row(
                      children: <Widget>[
                        new Radio<int>(
                          value: 3,
                          groupValue: myGroupValue,
                          onChanged: (int changedValue) {
                            setState(() {
                              myGroupValue = changedValue;
                            });
                          },
                        ),
                        new Flexible(
                          child: new Text(
                            options[3]['text'],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          new Center(
            child: new RaisedButton(
              onPressed: () {
                _evaluateAnswer();
              },
              child: new Text(
                'CALIFICAR',
                style: new TextStyle(color: Colors.white),
              ),
              color: Colors.indigo[900],
            ),
          ),
          new Container(
            height: 50.0,
          )
        ],
      ),
    );
  }

  void _evaluateAnswer() {
    if (myGroupValue == answer) {

      int completedActivities = new Utilities().getCompletedActivities();

      if(completedActivities != null){

        new Utilities().setCompletedActivities(completedActivities+1);
      }

      if(new Utilities().getCurrentActivity() == 2){

        new Utilities().setCurrentActivity(3);

        Navigator.of(context).pushReplacement(new MaterialPageRoute(
          builder: (BuildContext context) {
            return new TextQuizPage(
                questionObject: Quizzes.allQuizzes[2], activityNumber: 3);
          },
        ));

      }else if(new Utilities().getCurrentActivity() == 3){

        new Utilities().setCurrentActivity(4);

        Navigator.of(context).pushReplacement(new MaterialPageRoute(
          builder: (BuildContext context) {
            return new ImageQuizPage(
                questionObject: Quizzes.allQuizzes[3], activityNumber: 4);
          },
        ));

      } else if(new Utilities().getCurrentActivity() == 5){

        new Utilities().setCurrentActivity(6);

        Navigator.of(context).pushReplacement(new MaterialPageRoute(
          builder: (BuildContext context) {
            return new TextQuizPage(
                questionObject: Quizzes.allQuizzes[5], activityNumber: 6);
          },
        ));

      } else if(new Utilities().getCurrentActivity() == 6){

        new Utilities().setCurrentActivity(7);

        Navigator.of(context).pushReplacement(new MaterialPageRoute(
          builder: (BuildContext context) {
            return new ImageQuizPage(
                questionObject: Quizzes.allQuizzes[6], activityNumber: 7);
          },
        ));

      } else if(new Utilities().getCurrentActivity() == 8){

        new Utilities().setCurrentActivity(9);

        Navigator.of(context).pushReplacement(new MaterialPageRoute(
          builder: (BuildContext context) {
            return new TextQuizPage(
                questionObject: Quizzes.allQuizzes[8], activityNumber: 9);
          },
        ));

      }else if(new Utilities().getCurrentActivity() == 9){

        new Utilities().setCurrentActivity(10);

        Navigator.of(context).pushReplacement(new MaterialPageRoute(
          builder: (BuildContext context) {
            return new TextQuizPage(
                questionObject: Quizzes.allQuizzes[9], activityNumber: 10);
          },
        ));

      } else if(new Utilities().getCurrentActivity() == 11){

        new Utilities().setCurrentActivity(12);

        Navigator.of(context).pushReplacement(new MaterialPageRoute(
          builder: (BuildContext context) {
            return new TrueFalseQuizPage(
                questionObject: Quizzes.allQuizzes[11], activityNumber: 12);
          },
        ));

      } else if(new Utilities().getCurrentActivity() == 15){

        new Utilities().setCurrentActivity(16);

        Navigator.of(context).pushReplacement(new MaterialPageRoute(
          builder: (BuildContext context) {
            return new TextQuizPage(
                questionObject: Quizzes.allQuizzes[15], activityNumber: 16);
          },
        ));

      } else if(new Utilities().getCurrentActivity() == 17){

        new Utilities().setCurrentActivity(18);

        Navigator.of(context).pushReplacement(new MaterialPageRoute(
          builder: (BuildContext context) {
            return new TextQuizPage(
                questionObject: Quizzes.allQuizzes[17], activityNumber: 18);
          },
        ));

      } else if(new Utilities().getCurrentActivity() == 18){

        new Utilities().setCurrentActivity(19);

        Navigator.of(context).pushReplacement(new MaterialPageRoute(
          builder: (BuildContext context) {
            return new TrueFalseQuizPage(
                questionObject: Quizzes.allQuizzes[18], activityNumber: 19);
          },
        ));

      } else if(new Utilities().getCurrentActivity() == 21){

        new Utilities().setCurrentActivity(22);

        Navigator.of(context).pushReplacement(new MaterialPageRoute(
          builder: (BuildContext context) {
            return new TextQuizPage(
                questionObject: Quizzes.allQuizzes[21], activityNumber: 22);
          },
        ));

      } else if(new Utilities().getCurrentActivity() == 22){

        new Utilities().setCurrentActivity(23);

        Navigator.of(context).pushReplacement(new MaterialPageRoute(
          builder: (BuildContext context) {
            return new ImageQuizPage(
                questionObject: Quizzes.allQuizzes[22], activityNumber: 23);
          },
        ));

      } else if(new Utilities().getCurrentActivity() == 25){

        new Utilities().setCurrentActivity(26);

        Navigator.of(context).pushReplacement(new MaterialPageRoute(
          builder: (BuildContext context) {
            return new TextQuizPage(
                questionObject: Quizzes.allQuizzes[25], activityNumber: 26);
          },
        ));

      } else if(new Utilities().getCurrentActivity() == 26){

        new Utilities().setCurrentActivity(27);

        Navigator.of(context).pushReplacement(new MaterialPageRoute(
          builder: (BuildContext context) {
            return new ImageQuizPage(
                questionObject: Quizzes.allQuizzes[26], activityNumber: 27);
          },
        ));

      }

      else{

        int currentLevel = new Utilities().getCurrentLevel();

        showDialog(
        context: context,
        child: new AlertDialog(
          title: new Text('¡Felicidades!'),
          content: new Text('Nivel $currentLevel concluido'),
          actions: [
            new FlatButton(
              onPressed: () {
                  Navigator.of(context).pop();

                  Navigator.of(context).pushReplacement(
                    new MaterialPageRoute(
                      builder: (BuildContext context) {
                        return new LevelsPage();
                      },
                    ),
                  );

                },
              child: new Text('ACEPTAR'),
              )
            ],
          ),
        );
      }

    } else {
      showDialog(
        context: context,
        child: new AlertDialog(
          title: new Text('Incorrecto'),
          content: new Text('Vuelve a intentarlo'),
          actions: [
            new FlatButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: new Text('ACEPTAR'),
            )
          ],
        ),
      );
    }
  }
}

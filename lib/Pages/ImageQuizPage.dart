import 'package:flutter/material.dart';
import 'package:policiafederal_app/QuizResources/Quizzes.dart';
import 'package:policiafederal_app/Pages/TextQuizPage.dart';
import 'package:policiafederal_app/Singeltons/Utilities.dart';
import 'package:policiafederal_app/Pages/LevelsPage.dart';



class ImageQuizPage extends StatefulWidget {
  Map questionObject;
  int activityNumber;

  ImageQuizPage({Key key, this.questionObject, this.activityNumber})
      : super(key: key);

  @override
  ImageQuizPageState createState() => new ImageQuizPageState(
      questionObject: questionObject, activityNumber: activityNumber);
}

class ImageQuizPageState extends State<ImageQuizPage> {
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

  ImageQuizPageState({Key key, this.questionObject, this.activityNumber});

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
                    new Container(
                      height: 100.0,
                      width: 150.0,
                      child: new Image.asset(
                        options[0]['image'],
                        fit: BoxFit.fill,
                      ),
                    ),
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
                    new Container(
                      height: 100.0,
                      width: 150.0,
                      child: new Image.asset(
                        options[1]['image'],
                        fit: BoxFit.fill,
                      ),
                    ),
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
                    new Container(
                      height: 100.0,
                      width: 150.0,
                      child: new Image.asset(
                        options[2]['image'],
                        fit: BoxFit.fill,
                      ),
                    ),
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
                    new Container(
                      height: 100.0,
                      width: 150.0,
                      child: new Image.asset(
                        options[3]['image'],
                        fit: BoxFit.fill,
                      ),
                    ),
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

      if(new Utilities().getCurrentActivity() == 0){

        new Utilities().setCurrentActivity(2);

        Navigator.of(context).pushReplacement(new MaterialPageRoute(
          builder: (BuildContext context) {
            return new TextQuizPage(
                questionObject: Quizzes.allQuizzes[1], activityNumber: 2);
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

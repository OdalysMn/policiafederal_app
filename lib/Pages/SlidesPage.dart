import 'package:flutter/material.dart';
import 'package:policiafederal_app/Pages/RegistrationPage.dart';

class SlidesPage extends StatefulWidget {
  @override
  SlidesPageState createState() => new SlidesPageState();
}

class SlidesPageState extends State<SlidesPage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final TabController controller = new TabController(length: 3, vsync: this);
    final Color color = Theme.of(context).accentColor;

    return new Scaffold(
    /*  appBar: new AppBar(
        title: new Text('Museo'),
        backgroundColor: Colors.indigo[900],
      ),*/
      body: new Column(
        children: <Widget>[
          new Expanded(
            child: new TabBarView(
              controller: controller,
              children: <Widget>[
                new Image.asset(
                  'assets/Slide1.jpg',
                  fit: BoxFit.fill,
                ),
                new Image.asset(
                  'assets/Slide2.jpg',
                  fit: BoxFit.fill,
                ),
                new Image.asset(
                  'assets/Slide3.jpg',
                  fit: BoxFit.fill,
                ),
              ],
            ),
          ),
          new Container(
            margin: const EdgeInsets.only(top: 16.0),
            child: new Row(
              children: <Widget>[
                new Container(
                  width: 50.0,
                ),
                new TabPageSelector(controller: controller),
                new FlatButton(
                  child: new Text(
                    'Saltar',
                    style: new TextStyle(color: color),
                  ),
                  onPressed: () {
                    _skipSlides();
                  },
                )
              ],
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            ),
          ),
        ],
      ),
    );
  }

  void _skipSlides() {
    Navigator.of(context).pushReplacement(
      new MaterialPageRoute(
        builder: (BuildContext context) {
          return new RegistrationPage();
        },
      ),
    );
  }
}

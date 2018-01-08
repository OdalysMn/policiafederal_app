import 'package:flutter/material.dart';

class RegistrationPage extends StatefulWidget {
  @override
  RegistrationPageState createState() => new RegistrationPageState();
}

class RegistrationPageState extends State<RegistrationPage> {
  var ages = [];
  var sexs = [
    new DropdownMenuItem(
      child: new Text('Masculino'),
      value: 'Masculino',
    ),
    new DropdownMenuItem(
      child: new Text('Femenino'),
      value: 'Femenino',
    ),
  ];
  var occupations = [
    new DropdownMenuItem(
      child: new Text('Estudiante'),
      value: 'Estudiante',
    ),
    new DropdownMenuItem(
      child: new Text('Trabajador'),
      value: 'Trabajador',
    ),
    new DropdownMenuItem(
      child: new Text('Otro'),
      value: 'Otro',
    ),
  ];

  int ageShowed;
  String sexShowed;
  String occupationShowed;

  var nameController = new TextEditingController();
  var emailController = new TextEditingController();

  @override
  void initState() {
    _initAges();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Registro'),
        backgroundColor: Colors.indigo[900],
      ),
      body: new ListView(
        children: <Widget>[
          new Column(
            children: <Widget>[
              new Text(
                'Por favor introduce los siguientes datos',
                style: new TextStyle(fontSize: 22.0, color: Colors.indigo[900]),
              )
            ],
          ),
          _createSpace(),
          new TextField(
            controller: nameController,
            decoration: new InputDecoration(
              hintText: 'Nombre *',
              hintStyle: new TextStyle(color: Colors.grey[500], fontSize: 18.0),
            ),
            keyboardType: TextInputType.text,
          ),
          _createSpace(),
          new TextField(
            controller: emailController,
            decoration: new InputDecoration(
              hintText: 'Correo electrónico *',
              hintStyle: new TextStyle(color: Colors.grey[500], fontSize: 18.0),
            ),
            keyboardType: TextInputType.emailAddress,
          ),
          _createSpace(),
          new Row(
            children: <Widget>[
              new DropdownButton<int>(
                value: ageShowed,
                items: ages,
                onChanged: (int selectedAge) {
                  setState(() {
                    ageShowed = selectedAge;
                  });
                },
                hint: new Text(
                  'Edad',
                  style: new TextStyle(color: Colors.grey[500], fontSize: 18.0),
                ),
              ),
              _createSpace(),
              new DropdownButton<String>(
                value: sexShowed,
                items: sexs,
                onChanged: (String selectedSex) {
                  setState(() {
                    sexShowed = selectedSex;
                  });
                },
                hint: new Text(
                  'Sexo',
                  style: new TextStyle(color: Colors.grey[500], fontSize: 18.0),
                ),
              ),
              _createSpace(),
              new DropdownButton<String>(
                value: occupationShowed,
                items: occupations,
                onChanged: (String selectedOccupation) {
                  setState(() {
                    occupationShowed = selectedOccupation;
                  });
                },
                hint: new Text(
                  'Ocupación',
                  style: new TextStyle(color: Colors.grey[500], fontSize: 18.0),
                ),
              )
            ],
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          ),
          _createSpace(),
          new RaisedButton(
            onPressed: () {
              _doSubmit();
            },
            child: new Text(
              'Continuar',
              style: new TextStyle(color: Colors.white),
            ),
            color: Colors.indigo[900],
          )
        ],
        padding: new EdgeInsets.all(10.0),
      ),
    );
  }

  _createSpace() {
    return new Container(
      height: 25.0,
    );
  }

  void _initAges() {
    for (int i = 6; i < 90; i++) {
      ages.add(new DropdownMenuItem(
        child: new Text(i.toString()),
        value: i,
      ));
    }
  }

  void _doSubmit() {
    var formOK = true;

    if (nameController.text.length <= 0) {
      formOK = false;
    }

    if (emailController.text.length <= 0) {
      formOK = false;
    }

    if (ageShowed == null) {
      formOK = false;
    }

    if (sexShowed == null) {
      formOK = false;
    }

    if (occupationShowed == null) {
      formOK = false;
    }

    if (formOK) {

      showDialog(
        context: context,
        child: new AlertDialog(
          title: new Text('Éxito'),
          content: new Text('Bienvenido ' +
              nameController.text +
              '\nTu correo electrónico es: ' +
              emailController.text +
              '\nTu edad es: $ageShowed' +
              '\nTu sexo es: $sexShowed' +
              '\nTu ocupación es: $occupationShowed'),
        ),
      );
    } else {
      showDialog(
        context: context,
        child: new AlertDialog(
          title: new Text('Datos requeridos'),
          content: new Text(
              'Por favor verifique que todos los campos han sido llenados'),
        ),
      );
    }
  }
}

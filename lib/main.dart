import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Rapidito pedidos',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Rapidito Login'),
    );
  }
}

final userController = TextEditingController();
final passController = TextEditingController();
bool _savePassword = false;

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();

}

class _MyHomePageState extends State<MyHomePage> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

  @override
  void dispose() {
    userController.dispose();
    passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    final userField = TextField(
      obscureText: false,
      style: style,
      controller: userController,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Usuario",
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    final remUserCheck = ListTile(
      title: const Text('Recordar contraseña'),
      leading: Checkbox(
        value: _savePassword,
        onChanged: (bool newValue) {
          setState(() {
            _savePassword = newValue;
          });
        },
      ),
    );

    final passwordField = TextField(
      obscureText: true,
      style: style,
      controller: passController,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Contraseña",
          border:
          OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    final loginButon = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Color(0xff01A0C7),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          var usuario = "User: " +  userController.text + ", password: " + passController.text + " " + _savePassword.toString();
          return showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: Text(usuario),
              );
            },
          );
        },
        child: Text("Login",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

    return Scaffold(
        body: SingleChildScrollView(
          child: Center(
            child: Container(
              color: Colors.white,
              height: MediaQuery.of(context).size.height,
              child: Padding(
                padding: const EdgeInsets.all(36.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 155.0,
                      child: Image.asset(
                        "assets/images/rapidito.jpg",
                      ),
                    ),
                    SizedBox(height: 45.0),
                    userField,
                    SizedBox(height: 25.0),
                    passwordField,
                    SizedBox(height: 35.0,),
                    remUserCheck,
                    SizedBox(height: 2.0,),
                    loginButon,
                    SizedBox(height: 15.0,),
                  ],
                ),
              ),
            ),
          ),
        )
    );
  }
}

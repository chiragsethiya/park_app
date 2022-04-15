import 'package:flutter/material.dart';
import 'maps.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: 'first',
      routes: {
            'first': (context) => Screen1(),
            'second':(context) => Screen2(),
      },
    );
  }
}

class Screen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return Scaffold(
        body: Center(
          child: RaisedButton(
            onPressed: (){
              Navigator.pushNamed(context, 'second');
            },
            child: Text('Find'),
          ),
        ),
      );
  }
}

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Firebase ML Kit Sample'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton(
              onPressed: (){
                Navigator.pushNamed(context, '/firebase_vision');
              },
              child: Text('Firebase Vision'),
              color: Colors.yellow,
            ),
            FlatButton(
              onPressed: (){
                Navigator.pushNamed(context, '/firebase_custom');
              },
              child: Text('Custom Model'),
              color: Colors.yellow,
            )
          ],
        ),
      )
    );
  }
}

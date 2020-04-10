import 'package:flutter/material.dart';
import 'package:LifeBoat/Home.dart';

void main() => runApp(App());

class App extends StatefulWidget
{
  App({Key key }) : super(key: key);
  @override
  _App createState() => _App();
}

class _App extends State<App>
{
  @override
  Widget build(BuildContext context) {
    Widget child;
    int _index = 0;
    switch(_index)
    {
      case 0:
        child = Home();
    }
    return MaterialApp(
        title: 'LifeBoat',
        theme: ThemeData(
            primarySwatch: Colors.amber,
            primaryColor: Colors.amber,
            scaffoldBackgroundColor: Colors.white),
        home: Scaffold(
          backgroundColor: Colors.transparent,
      body: SizedBox.expand(child: child)
    ));
  }
}

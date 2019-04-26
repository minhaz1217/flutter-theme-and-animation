import 'package:flutter/material.dart';

class AnimationPage extends StatelessWidget {
  String title;
  AnimationPage(this.title);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: Theme.of(context).copyWith(
          primaryColor: Colors.amber,
          textTheme: Typography().black,
        ),
        home: BarLoadingScreen());
  }
}

class BarLoadingScreen extends StatefulWidget {
  @override
  BarLoadingScreenState createState() => new BarLoadingScreenState();
}

class BarLoadingScreenState extends State<BarLoadingScreen> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: Text("Animation"),
        ),
        body: new Container(
          child: new Center(
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Bar(),
                new Bar(),
                new Bar(),
                new Bar(),
              ],
            ),
          ),
        ));
  }
}

class Bar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      width: 35.0,
      height: 15.0,
      decoration: new BoxDecoration(
        color: const Color.fromRGBO(0, 0, 255, 1.0),
        borderRadius: new BorderRadius.circular(10.0),
        boxShadow: [
          new BoxShadow(
            color: Colors.black12,
            blurRadius: 8.0,
            spreadRadius: 1.0,
            offset: new Offset(1.0, 0.0),
          ),
          new BoxShadow(
            color: Colors.black26,
            blurRadius: 6.0,
            spreadRadius: 1.5,
            offset: new Offset(1.0, 0.0),
          ),
        ],
      ),
    );
  }
}

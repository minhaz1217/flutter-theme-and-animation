import 'package:flutter/material.dart';
import 'package:flutter_theme_and_animation/LayoutThemeContainer.dart';

class ThemePage extends StatelessWidget {
  String title;

  ThemePage(this.title);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return LayoutThemeContainer(
      child: new MaterialApp(
        debugShowCheckedModeBanner: false,
        //debugShowMaterialGrid: true,
        title: this.title,
        theme: Theme.of(context).copyWith(
          primaryColor: Colors.amber,
          textTheme: Typography().black,
        ),
        home: ThemePageStateful(title: this.title),
      ),
    );
  }
}

class ThemePageStateful extends StatefulWidget {
  ThemePageStateful({Key key, this.title}) : super(key: key);
  final String title;
  @override
  ThemePageState createState() => ThemePageState();
}

class ThemePageState extends State<ThemePageStateful> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Container(
              padding: new EdgeInsets.all(
                LayoutThemeState.matGridUnit(scale:16),
              ),
              decoration: new BoxDecoration(
                color: Colors.cyanAccent,
              ),
              child: new Text('You have pushed the button this many times:'),
            ),
            Text(
              "Example of body2",
              style: Theme.of(context).textTheme.body2,
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

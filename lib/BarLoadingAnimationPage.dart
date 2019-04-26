import 'package:flutter/material.dart';

class BarLoadingAnimationPage extends StatelessWidget {
  final String title;
  BarLoadingAnimationPage(this.title);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BarLoadingAnimation(title),
    );
  }
}

class BarLoadingAnimation extends StatefulWidget {
  final String title;
  BarLoadingAnimation(this.title);
  @override
  State<StatefulWidget> createState() => _BarLoadingAnimationState();
}

class _BarLoadingAnimationState extends State<BarLoadingAnimation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Text("HELLO WORLD"),
    );
  }
}

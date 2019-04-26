import 'package:flutter/material.dart';
import 'dart:math' as math;
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

class _BarLoadingAnimationState extends State<BarLoadingAnimation>
    with TickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = new AnimationController(
      duration: const Duration(milliseconds: 3000),
      vsync: this,
    );
    tween = new Tween<double>(
      begin: 0.0,
      end: 1.0,
    );
    _controller
        .repeat()
        .orCancel;
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }


  Tween<double> tween = new Tween<double>(begin: 0.0, end: 1.00);
  Animation<double> get stepOne => tween.animate(
    new CurvedAnimation(
      parent: _controller,
      curve: new Interval(
        0.0,
        0.125,
        curve: Curves.linear,
      ),
    ),
  );
  Animation<double> get stepTwo => tween.animate(
    new CurvedAnimation(
      parent: _controller,
      curve: new Interval(
        0.125,
        0.26,
        curve: Curves.linear,
      ),
    ),
  );
  Animation<double> get stepThree => tween.animate(
    new CurvedAnimation(
      parent: _controller,
      curve: new Interval(
        0.25,
        0.375,
        curve: Curves.linear,
      ),
    ),
  );
  Animation<double> get stepFour => tween.animate(
    new CurvedAnimation(
      parent: _controller,
      curve: new Interval(
        0.375,
        0.5,
        curve: Curves.linear,
      ),
    ),
  );
  Animation<double> get stepFive => tween.animate(
    new CurvedAnimation(
      parent: _controller,
      curve: new Interval(
        0.5,
        0.625,
        curve: Curves.linear,
      ),
    ),
  );
  Animation<double> get stepSix => tween.animate(
    new CurvedAnimation(
      parent: _controller,
      curve: new Interval(
        0.625,
        0.75,
        curve: Curves.linear,
      ),
    ),
  );
  Animation<double> get stepSeven => tween.animate(
    new CurvedAnimation(
      parent: _controller,
      curve: new Interval(
        0.75,
        0.875,
        curve: Curves.linear,
      ),
    ),
  );
  Animation<double> get stepEight => tween.animate(
    new CurvedAnimation(
      parent: _controller,
      curve: new Interval(
        0.875,
        1.0,
        curve: Curves.linear,
      ),
    ),
  );

  Widget get forwardStaggeredAnimation {
    return new Center(
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          PivotBar(
            allignment: FractionalOffset.centerLeft,
            controller: _controller,
            animations: [
              stepOne,
              stepTwo,
            ],
            marginRight: 0.0,
            marginLeft: 0.0,
            isClockWise: true,
          ),
          new PivotBar(
            controller: _controller,
            animations: [
              stepThree,
              stepEight,
            ],
            marginRight: 0.0,
            marginLeft: 0.0,
            isClockWise: false,
          ),
          new PivotBar(
            controller: _controller,
            animations: [
              stepFour,
              stepSeven,
            ],
            marginRight: 0.0,
            marginLeft: 32.0,
            isClockWise: true,
          ),
          new PivotBar(
            controller: _controller,
            animations: [
              stepFive,
              stepSix,
            ],
            marginRight: 0.0,
            marginLeft: 32.0,
            isClockWise: false,
          ),
        ],
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Loading..."),
      ),
        body: Container(child: forwardStaggeredAnimation),
    );
  }
}

class Bar extends StatelessWidget {
  final double marginLeft, marginRight;

  const Bar({Key key, this.marginLeft, this.marginRight}) :super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Container(
      width: 35.0,
      height: 15.0,
      margin: new EdgeInsets.only(left: marginLeft, right: marginRight),
      decoration: new BoxDecoration(
        color: const Color.fromRGBO(245, 0, 0, 1.0),
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

class PivotBar extends AnimatedWidget {
  final List<Animation<double>> animations;
  final Animation<double> controller;

  final FractionalOffset allignment;
  final bool isClockWise;
  final double marginLeft;
  final double marginRight;

  PivotBar({
    Key key,
    this.allignment: FractionalOffset.centerRight,
    @required this.controller,
    @required this.animations,
    @required this.isClockWise,
    this.marginLeft = 15.0,
    this.marginRight = 0.0,
  }) :super(key: key, listenable: controller);

  Matrix4 clockwiseHalf(animation) =>
      new Matrix4.rotationZ((animation.value * math.pi * 2.0) * .5);

  Matrix4 counterClockwiseHalf(animation) =>
      new Matrix4.rotationZ(-(animation.value * math.pi * 2.0) * .5);


  @override
  Widget build(BuildContext context) {
    var transformOne;
    var transformTwo;
    if (isClockWise) {
      transformOne = clockwiseHalf(animations[0]);
      transformTwo = clockwiseHalf(animations[1]);
    } else {
      transformOne = counterClockwiseHalf(animations[0]);
      transformTwo = counterClockwiseHalf(animations[1]);
    }
    return Transform(
      transform: transformOne,
      alignment: allignment,
      child: new Transform(
        transform: transformTwo,
        alignment: allignment,
        child: new Bar(marginLeft: marginLeft, marginRight: marginRight),
      ),
    );
  }
}

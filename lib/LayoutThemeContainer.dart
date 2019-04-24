import 'package:flutter/material.dart';
class LayoutThemeContainer extends StatefulWidget{
  static LayoutThemeState of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(_InheritedStateContainer)
    as _InheritedStateContainer)
        .data;
  }
  final Widget child;
  LayoutThemeContainer({this.child});
  @override
  State<StatefulWidget> createState() => LayoutThemeState();

}
class LayoutThemeState extends State<LayoutThemeContainer> {

  double get spacingUnit => 10.0;
  
  @override
  Widget build(BuildContext context) {
    return new _InheritedStateContainer(
      data: this,
      child: widget.child,
    );
  }
}
class _InheritedStateContainer extends InheritedWidget {
  final LayoutThemeState data;

  _InheritedStateContainer({
    Key key,
    @required this.data,
    @required Widget child,
  }) : super(key: key, child: child);

  @override
  bool updateShouldNotify(_InheritedStateContainer old) => true;
}
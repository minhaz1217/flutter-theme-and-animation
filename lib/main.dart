import 'package:flutter/material.dart';
import 'package:flutter_theme_and_animation/AnimationPage.dart';
import 'package:flutter_theme_and_animation/BarLoadingAnimationPage.dart';
import 'package:flutter_theme_and_animation/LayoutThemeContainer.dart';
import 'package:flutter_theme_and_animation/ThemePage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return LayoutThemeContainer(
      child: new MaterialApp(
        debugShowCheckedModeBanner: false,
        //debugShowMaterialGrid: true,
        title: 'Flutter Demo',
        theme: Theme.of(context).copyWith(
          primaryColor: Colors.amber,
          textTheme: Typography().black,
        ),
        home: MyHomePage(title: 'Flutter Theme and Animation'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void gotoTheme(){
    print("THEME CLICKED");
    Navigator.push(context, MaterialPageRoute<void>(
      builder: (BuildContext context){
        return ThemePage("Theme Demonstration");
      }
    ));
//    Navigator.push(context, MaterialPageRoute<void>(
//      builder: (BuildContext context) {
//        return Scaffold(
//          appBar: AppBar(title: Text('My Page')),
//          body: Center(
//            child: FlatButton(
//              child: Text('POP'),
//              onPressed: () {
//                Navigator.pop(context);
//              },
//            ),
//          ),
//        );
//      },
//    ));
  }

  void gotoAnimation(){
    print("ANIMATION CLICKED");
    Navigator.push(context, MaterialPageRoute<void>(
        builder: (BuildContext context){
          return AnimationPage("Animation");
        }));
  }
  void gotoBarLoadingAnimation(){
    print("Bar Loading CLICKED");
    Navigator.push(context, MaterialPageRoute<void>(
        builder: (BuildContext context){
          return BarLoadingAnimationPage("Bar Loading Animation");
        }));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Theme and Animation"),
      ),
      body: Center(
      child: ListView(
          children: <Widget>[
            InkWell(
              highlightColor: Colors.yellow,
              splashColor: Colors.red,
              onTap: ()=> gotoTheme(),
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 50.0
                ),
                child: Center(
                    child: Text(
                        "Changing Theme",
                      style: TextStyle(
                        fontSize: 24.0,
                    ),),
                ),
              ),
            ),
            Divider( color: Colors.black,),
            InkWell(
              highlightColor: Colors.yellow,
              splashColor: Colors.red,
              onTap: (){gotoAnimation();},
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 50.0
                ),
                child: Center(
                  child: Text(
                    "Animation",
                    style: TextStyle(
                      fontSize: 24.0,
                    ),),
                ),
              ),
            ),
            Divider( color: Colors.black,),
            InkWell(
              highlightColor: Colors.yellow,
              splashColor: Colors.red,
              onTap: (){gotoBarLoadingAnimation();},
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 50.0
                ),
                child: Center(
                  child: Text(
                    "Bar Loading Animation",
                    style: TextStyle(
                      fontSize: 24.0,
                    ),),
                ),
              ),
            ),
            Divider( color: Colors.black,),


          ],
        )
      )
    );
  }
}

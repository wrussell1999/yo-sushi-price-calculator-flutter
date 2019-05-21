import 'package:flutter/material.dart';
import 'package:flutter/services.dart';



void main() {
  
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.white, // navigation bar color
  ));
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'YO! Sushi Price Calculator',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        primaryTextTheme: TextTheme(
          title: TextStyle(color: Colors.white)
        )
      ),
      home: MyHomePage(title: 'YO! Sushi Price Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String total = '£0.00';

  void _add() {
    setState(() {
      
    });
  }

  void _clear() {
    setState(() {
    });
  }

  void _clearAll() {
    setState(() {
      total = '£0.00';
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
            Text(
              '£0.00',
              style: new TextStyle(
                fontSize: 64.0,
                color: Colors.black,)
            ),
            RaisedButton(
                child: Text("Clear all"),
                onPressed: _clearAll,
                color: Colors.deepOrange,
                textColor: Colors.white,
                padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
                shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                splashColor: Colors.grey,
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yo_sushi_price_calculator_flutter/plate-row.dart';

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
  double _overallTotal = 0.00;
  int _greenTotal = 0;
  int _blueTotal = 0;
  int _purpleTotal = 0;
  int _orangeTotal = 0;
  int _pinkTotal = 0;
  int _greyTotal = 0;

  int _add(double increase, int _typeTotal) {
    setState(() {
      _overallTotal += increase;
      _typeTotal++;
    });
    return _typeTotal;
  }

  int _remove(double decrease, int _typeTotal) {
    if (_typeTotal != 0) {
      setState(() {
        _typeTotal--;
        _overallTotal -= decrease;
      });
    }
    return _typeTotal;
  }
  void _clearAll() {
    setState(() {
      _overallTotal = 0.00;
      _greenTotal = 0;
      _blueTotal = 0;
      _purpleTotal = 0;
      _orangeTotal = 0;
      _pinkTotal = 0;
      _greyTotal = 0;
    });
  }

  @override
  Widget build(BuildContext context) {    
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: new Container(
          child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new PlateRow(Colors.lightGreen, 2.30, _greenTotal, _add, _remove),
            new PlateRow(Colors.blueGrey, 3.00, _blueTotal, _add, _remove),
            new PlateRow(Colors.deepPurple, 4.00, _purpleTotal, _add, _remove),
            new PlateRow(Colors.deepOrange, 4.50, _orangeTotal, _add, _remove),
            new PlateRow(Colors.pinkAccent, 5.00, _pinkTotal, _add, _remove),
            new PlateRow(Colors.grey, 5.50, _greyTotal, _add, _remove),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: new Container(
                child: new Column(children: <Widget>[
                  Text(
                    "£" + _overallTotal.toStringAsFixed(2),
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
                ],)
              ),
            ),
          ],
        ),
      ),
    );
  }
}

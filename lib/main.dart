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
  double _totalValue = 0.00;
  int _greenTotal = 0;
  int _blueTotal = 0;
  int _purpleTotal = 0;
  int _orangeTotal = 0;
  int _pinkTotal = 0;
  int _greyTotal = 0;

  void _add(double increase, String colour) {
    setState(() {
      _totalValue += increase;
      switch(colour) {
        case "green": {
          _greenTotal++;
        }
        break;
        case "blue": {
          _blueTotal++;
        }
        break;
        case "purple": {
          _purpleTotal++;
        }
        break;
        case "orange": {
          _orangeTotal++;
        }
        break;
        case "pink": {
          _pinkTotal++;
        }
        break;
        case "grey": {
          _greyTotal++;
        }
        break;
      }
    });
  }

  void _remove(double decrease, String colour) {
    setState(() {
      switch(colour) {
        case "green": {
          if (_greenTotal != 0) {
          _greenTotal--;
          _totalValue -= decrease;
          }
        }
        break;
        case "blue": {
          if (_blueTotal != 0) {
            _blueTotal--;
            _totalValue -= decrease;
          }
        }
        break;
        case "purple": {
          if (_purpleTotal != 0) {
            _purpleTotal--;
            _totalValue -= decrease;
          }
        }
        break;
        case "orange": {
          if (_orangeTotal != 0) {
            _orangeTotal--;
            _totalValue -= decrease;
          }
        }
        break;
        case "pink": {
          if (_pinkTotal != 0) {
            _pinkTotal--;
            _totalValue -= decrease;
          }
        }
        break;
        case "grey": {
          if (_greyTotal != 0) {
            _greyTotal--; 
            _totalValue -= decrease;
          }
        }
        break;
      }
    });
  }

  void _clearAll() {
    setState(() {
      _totalValue = 0.00;
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
            new PlateRow(_add, _remove,"green", 2.30, _greenTotal),
            new PlateRow(_add, _remove,"blue", 3.00, _blueTotal),
            new PlateRow(_add, _remove,"purple", 4.00, _purpleTotal),
            new PlateRow(_add, _remove,"orange", 4.50, _orangeTotal),
            new PlateRow(_add, _remove,"pink", 5.00, _pinkTotal),
            new PlateRow(_add, _remove,"grey", 5.50, _greyTotal),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: new Container(
                child: new Column(children: <Widget>[
                  Text(
                    "£" + _totalValue.toStringAsFixed(2),
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

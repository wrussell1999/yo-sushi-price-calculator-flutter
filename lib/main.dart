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


class PriceDisplay extends StatelessWidget {
  PriceDisplay({this.overallTotal});

  final double overallTotal;

  @override
  Widget build(BuildContext context) {
    return Text(
      "£" + overallTotal.toStringAsFixed(2),
      style: new TextStyle(
        fontSize: 64.0,
        color: Colors.black,)
    );
  }
}

class ClearButton extends StatelessWidget {
  ClearButton({this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text("Clear all"),
      onPressed: onPressed,
      color: Colors.deepOrange,
      textColor: Colors.white,
      padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
      shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
      splashColor: Colors.grey,
    );
  }
}

class PlateTotal extends StatelessWidget {
  PlateTotal({this.total});

  final int total;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: new Container(
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            new Text(total.toStringAsFixed(0)),
          ],
        )
      ),
    );
  }
}

class PlateAdd extends StatelessWidget {
  PlateAdd({this.onAdd, this.colour, this.typeTotal});

  final VoidCallback onAdd;
  final colour;
  final typeTotal;

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text("Add"),
      onPressed: () => onAdd,
      color: colour,
      textColor: Colors.white,
      padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
      shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
      splashColor: Colors.grey,
    );
  }
}

class PlateRemove extends StatelessWidget {
  PlateRemove({this.onRemove, this.colour, this.typeTotal});

  final VoidCallback onRemove;
  final colour;
  final typeTotal;

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text("Remove"),
      onPressed: () => onRemove,
      color: colour,
      textColor: Colors.white,
      padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
      shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
      splashColor: Colors.grey,
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

  void _add(double increase) {
    setState(() {
      _overallTotal += increase;
    });
  }

  void _remove(double decrease) {
    if (true) { //widget._typeTotal != 0) {
      setState(() {
        //widget._typeTotal--;
        _overallTotal -= decrease;
      });
    }
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
              Row(children: <Widget>[
                PlateAdd(onAdd: () => _add(2.30), colour: Colors.lightGreen, typeTotal: _greenTotal),
                PlateTotal(total: _greenTotal),
                PlateRemove(onRemove: () => _remove(2.30), colour: Colors.lightGreen,typeTotal: _greenTotal)
              ]),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: new Container(
                  child: new Column(children: <Widget>[
                    PriceDisplay(overallTotal: _overallTotal),
                    ClearButton(onPressed: _clearAll)
                  ],
                )
              ),
            ),
          ],
        ),
      ),
    );
  }
}

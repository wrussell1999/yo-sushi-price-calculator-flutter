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
  PlateAdd({this.onAdd, this.colour});

  final VoidCallback onAdd;
  final colour;

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text("Add"),
      onPressed: onAdd,
      color: colour,
      textColor: Colors.white,
      padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
      shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
      splashColor: Colors.grey,
    );
  }
}

class PlateRemove extends StatelessWidget {
  PlateRemove({this.onRemove, this.colour});

  final VoidCallback onRemove;
  final colour;

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text("Remove"),
      onPressed: onRemove,
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

  void _addGreen() {
    setState(() {
      _greenTotal++;
      _overallTotal += 2.30;
    });
  }

  void _addBlue() {
    setState(() {
      _blueTotal++;
      _overallTotal += 3.00;
    });
  }

  void _addPurple() {
    setState(() {
      _purpleTotal++;
      _overallTotal += 4.00;
    });
  }

  void _addOrange() {
    setState(() {
      _orangeTotal++;
      _overallTotal += 4.50;
    });
  }

  void _addPink() {
    setState(() {
      _pinkTotal++;
      _overallTotal += 5.00;
    });
  }

  void _addGrey() {
    setState(() {
      _greyTotal++;
      _overallTotal += 5.50;
    });
  }

  void _removeGreen() {
    if (_greenTotal - 1 >= 0) {
      setState(() {
        _greenTotal--;
        _overallTotal -= 2.30;
      });
    }
  }

  void _removeBlue() {
    if (_blueTotal - 1 >= 0) {
      setState(() {
        _blueTotal--;
        _overallTotal -= 3.00;
      }); 
    }
  }

  void _removePurple() {
    if (_purpleTotal - 1 >= 0) {
      setState(() {
        _purpleTotal--;
        _overallTotal -= 4.00;
      });
    }
  }

  void _removeOrange() {
    if (_orangeTotal - 1 >= 0) {
      setState(() {
        _orangeTotal--;
        _overallTotal -= 4.50;
      });
    }
  }

  void _removePink() {
    if (_pinkTotal - 1 >= 0) {
      setState(() {
        _pinkTotal--;
        _overallTotal -= 5.00;
      });
    }
  }

  void _removeGrey() {
    if (_greyTotal - 1 >= 0) {
      setState(() {
        _greyTotal--;
        _overallTotal -= 5.50;
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
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                PlateAdd(onAdd: _addGreen, colour: Colors.lightGreen),
                PlateTotal(total: _greenTotal),
                PlateRemove(onRemove: _removeGreen, colour: Colors.lightGreen)
              ]),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                PlateAdd(onAdd: _addBlue, colour: Colors.blueGrey),
                PlateTotal(total: _blueTotal),
                PlateRemove(onRemove: _removeBlue, colour: Colors.blueGrey)
              ]),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                PlateAdd(onAdd: _addPurple, colour: Colors.deepPurple),
                PlateTotal(total: _purpleTotal),
                PlateRemove(onRemove: _removePurple, colour: Colors.deepPurple)
              ]),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                PlateAdd(onAdd: _addOrange, colour: Colors.deepOrange),
                PlateTotal(total: _orangeTotal),
                PlateRemove(onRemove: _removeOrange, colour: Colors.deepOrange)
              ]),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                PlateAdd(onAdd: _addPink, colour: Colors.pinkAccent),
                PlateTotal(total: _pinkTotal),
                PlateRemove(onRemove: _removePink, colour: Colors.pinkAccent)
              ]),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                PlateAdd(onAdd: _addGrey, colour: Colors.grey),
                PlateTotal(total: _greyTotal),
                PlateRemove(onRemove: _removeGrey, colour: Colors.grey)
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

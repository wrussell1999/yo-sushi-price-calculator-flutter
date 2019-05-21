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
  double _totalValue = 0.00;
  int _greenTotal = 0;
  int _blueTotal = 0;
  int _purpleTotal = 0;
  int _orangeTotal = 0;
  int _pinkTotal = 0;
  int _greyTotal = 0;

  void _add(double increase) {
    setState(() {
      _totalValue += increase;
    });
  }

  void _remove(double decrease) {
    setState(() {
      if (_totalValue - decrease < 0) {
        _totalValue = 0.00;
      } else {
        _totalValue -= decrease;
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
            new Container(
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                new RaisedButton(
                  child: Text("Add"),
                  onPressed: () => _add(2.30),
                  color: Colors.lightGreen,
                  textColor: Colors.white,
                  padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
                  shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                  splashColor: Colors.grey,
                  ),
                new Text("$_greenTotal",),
                new RaisedButton(
                  child: Text("Remove"),
                  onPressed: () => _remove(2.30),
                  color: Colors.lightGreen,
                  textColor: Colors.white,
                  padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
                  shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                  splashColor: Colors.grey,
                  )  
              ],)
            ),
            new Container(
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                new RaisedButton(
                  child: Text("Add"),
                  onPressed: () => _add(3.00),
                  color: Colors.blueAccent,
                  textColor: Colors.white,
                  padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
                  shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                  splashColor: Colors.grey,
                  ),
                new Text("$_blueTotal",),
                new RaisedButton(
                  child: Text("Remove"),
                  onPressed: () => _remove(3.00),
                  color: Colors.blueAccent,
                  textColor: Colors.white,
                  padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
                  shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                  splashColor: Colors.grey,
                  )  
              ],)
            ),
            new Container(
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                new RaisedButton(
                  child: Text("Add"),
                  onPressed: () => _add(4.00),
                  color: Colors.deepPurple,
                  textColor: Colors.white,
                  padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
                  shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                  splashColor: Colors.grey,
                  ),
                new Text("$_purpleTotal",),
                new RaisedButton(
                  child: Text("Remove"),
                  onPressed: () => _remove(4.00),
                  color: Colors.deepPurple,
                  textColor: Colors.white,
                  padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
                  shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                  splashColor: Colors.grey,
                  )  
              ],)
            ),
            new Container(
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                new RaisedButton(
                  child: Text("Add"),
                  onPressed: () => _add(4.50),
                  color: Colors.deepOrange,
                  textColor: Colors.white,
                  padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
                  shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                  splashColor: Colors.grey,
                  ),
                new Text("$_orangeTotal",),
                new RaisedButton(
                  child: Text("Remove"),
                  onPressed: () => _remove(4.50),
                  color: Colors.deepOrange,
                  textColor: Colors.white,
                  padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
                  shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                  splashColor: Colors.grey,
                  )  
              ],)
            ),
            new Container(
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                new RaisedButton(
                  child: Text("Add"),
                  onPressed: () => _add(5.00),
                  color: Colors.pink,
                  textColor: Colors.white,
                  padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
                  shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                  splashColor: Colors.grey,
                  ),
                new Text("$_pinkTotal",),
                new RaisedButton(
                  child: Text("Remove"),
                  onPressed: () => _remove(5.00),
                  color: Colors.pinkAccent,
                  textColor: Colors.white,
                  padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
                  shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                  splashColor: Colors.grey,
                  )  
              ],)
            ),
            new Container(
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                new RaisedButton(
                  child: Text("Add"),
                  onPressed: () => _add(5.50),
                  color: Colors.grey,
                  textColor: Colors.white,
                  padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
                  shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                  splashColor: Colors.grey,
                  ),
                new Text("$_greyTotal",),
                new RaisedButton(
                  child: Text("Remove"),
                  onPressed: () => _remove(5.50),
                  color: Colors.grey,
                  textColor: Colors.white,
                  padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
                  shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                  splashColor: Colors.grey,
                  )  
              ],)
            ),
            new Container(
              child: new Column(children: <Widget>[
                Text(
                  "$_totalValue",
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
          ],
        ),
      ),
    );
  }
}

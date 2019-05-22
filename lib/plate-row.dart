import 'package:yo_sushi_price_calculator_flutter/main.dart';
import 'package:flutter/material.dart';

class PlateRow extends StatelessWidget {
  
  final Function _add;
  final Function _remove;
  var type;
  var colour;
  var price; 
  var _total;
  PlateRow(this._add, this._remove, this.type, this.colour, this.price, this._total);

  @override
  Widget build(BuildContext context) {
    return new Padding(
      padding: EdgeInsets.all(8.0),
      child: new Container(
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
          new RaisedButton(
            child: Text("Add"),
            onPressed: () => _add(price, type),
            color: colour,
            textColor: Colors.white,
            padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
            shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
            splashColor: Colors.grey,
            ),
          new Text("$_total",),
          new RaisedButton(
            child: Text("Remove"),
            onPressed: () => _remove(price, type),
            color: colour,
            textColor: Colors.white,
            padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
            shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
            splashColor: Colors.grey,
            )  
        ],)
      ),
    );   
  }
}
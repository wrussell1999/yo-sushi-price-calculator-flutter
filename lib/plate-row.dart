import 'package:yo_sushi_price_calculator_flutter/main.dart';
import 'package:flutter/material.dart';

class PlateRow extends StatelessWidget {
  
  final colour;
  final price; 
  var _typeTotal;
  final Function _add;
  final Function _remove;
  PlateRow(this.colour, this.price, this._typeTotal, this._add, this._remove);

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
            onPressed: () => _typeTotal = _add(price, _typeTotal),
            color: colour,
            textColor: Colors.white,
            padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
            shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
            splashColor: Colors.grey,
            ),
          new Text("$_typeTotal",),
          new RaisedButton(
            child: Text("Remove"),
            onPressed: () => _typeTotal = _remove(price, _typeTotal),
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
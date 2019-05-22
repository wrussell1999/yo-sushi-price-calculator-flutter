import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlateRow extends StatefulWidget {
  final colour;
  final price; 
  var _typeTotal;
  var _overallTotal;
  PlateRow(this.colour, this.price, this._typeTotal, this._overallTotal);

  @override
  _PlateRow createState() => _PlateRow(); 
}

class _PlateRow extends State<PlateRow> {
  
  void _add(double increase) {
    setState(() {
      widget._typeTotal++;
      widget._overallTotal += increase;
    });
  }

  void _remove(double decrease) {
    if (widget._typeTotal != 0) {
      setState(() {
        widget._typeTotal--;
        widget._overallTotal -= decrease;
      });
    }
  }

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
              onPressed: () => _add(widget.price),
              color: widget.colour,
              textColor: Colors.white,
              padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
              shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
              splashColor: Colors.grey,
            ),
            new Text(widget._typeTotal.toStringAsFixed(0)),
            new RaisedButton(
              child: Text("Remove"),
              onPressed: () => _remove(widget.price),
              color: widget.colour,
              textColor: Colors.white,
              padding: EdgeInsets.fromLTRB(15, 15, 15, 15),
              shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
              splashColor: Colors.grey,
            )  
          ],
        )
      ),
    );
  }
}
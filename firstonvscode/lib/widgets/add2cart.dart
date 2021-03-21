import 'package:firstonvscode/models/cart.dart';
import 'package:firstonvscode/models/catalog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Add2Cart extends StatefulWidget {
  final itemCat catalog;
  const Add2Cart({
    Key key,
    this.catalog,
  }) : super(key: key);

  @override
  __Add2CartState createState() => __Add2CartState();
}

class __Add2CartState extends State<Add2Cart> {
  final _cart = CartModel();

  @override
  Widget build(BuildContext context) {
    bool addtocart = _cart.items.contains(widget.catalog) ?? false;
    return ElevatedButton(
      onPressed: () {
        if (!addtocart) {
          addtocart = true;
          final _catalog = catalogModel();
          _cart.catalog = _catalog;
          _cart.add(widget.catalog);

          setState(() {});
        }
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          Colors.pink[900],
        ),
        shape: MaterialStateProperty.all(
          StadiumBorder(),
        ),
      ),
      child:
          addtocart ? Icon(Icons.done) : Icon(CupertinoIcons.cart_badge_plus),
    );
  }
}

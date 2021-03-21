import 'package:firstonvscode/core/store.dart';
import 'package:firstonvscode/models/cart.dart';
import 'package:firstonvscode/models/catalog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class Add2Cart extends StatelessWidget {
  final itemCat catalog;
  Add2Cart({
    Key key,
    this.catalog,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [AddMutation, RemoveMutation]);
    final CartModel _cart = (VxState.store as MyStore).cart;
    bool addtocart = _cart.items.contains(catalog) ?? false;
    return ElevatedButton(
      onPressed: () {
        if (!addtocart) {
          AddMutation(catalog);
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

import 'package:firstonvscode/models/cart.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Vx.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: "Cart".text.black.bold.make(),
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        children: [
          _CartList().p12().expand(),
          Divider(
            color: Vx.red900,
          ),
          _CartTotal(),
        ],
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  _CartTotal({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final _cart = CartModel();
    return SizedBox(
      height: 50,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          "\$${_cart.totalPrice}".padLeft(6).text.bold.xl3.make(),
          ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: "Buying not supported yet.".text.make(),
                ),
              );
            },
            child: "Buy".text.bold.xl.make(),
          ).pOnly(right: 10).w24(context),
        ],
      ),
    );
  }
}

// ignore: camel_case_types
class _CartList extends StatefulWidget {
  @override
  __CartListState createState() => __CartListState();
}

class __CartListState extends State<_CartList> {
  final _cart = CartModel();
  @override
  Widget build(BuildContext context) {
    return _cart.items.isEmpty
        ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/empty_cart.png"),
              "Nothing Yet! Try to add something!".text.make(),
            ],
          )
        : ListView.builder(
            itemCount: _cart.items?.length,
            itemBuilder: (context, index) => Card(
              color: Vx.red100,
              shape: StadiumBorder(),
              child: ListTile(
                leading: Icon(Icons.done),
                trailing: IconButton(
                  icon: Icon(Icons.remove_circle_outline),
                  onPressed: () {
                    _cart.remove(_cart.items[index]);
                    setState(() {});
                  },
                ),
                title: _cart.items[index].name.text.xl.make(),
              ),
            ),
          );
  }
}

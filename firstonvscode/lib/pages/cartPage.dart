import 'package:firstonvscode/core/store.dart';
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
        leading: BackButton(
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
        title: "Cart".text.bold.black.make(),
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
    final CartModel _cart = (VxState.store as MyStore).cart;
    return _cart.items.isEmpty
        ? "Nothing Yet! Try to add something!".text.bold.xl.make().py8()
        : SizedBox(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                VxConsumer(
                  mutations: {RemoveMutation},
                  builder: (context, _) {
                    return "\$${_cart.totalPrice}"
                        .padLeft(6)
                        .text
                        .bold
                        .xl3
                        .make();
                  },
                  notifications: {},
                ),
                ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: "Buying not supported yet.".text.make(),
                      ),
                    );
                  },
                  child: "Buy".text.xl.make(),
                ).pOnly(right: 10).w24(context),
              ],
            ),
          );
  }
}

// ignore: camel_case_types
class _CartList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [RemoveMutation]);
    final CartModel _cart = (VxState.store as MyStore).cart;
    return _cart.items.isEmpty
        ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("assets/images/empty_cart.png"),
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
                  onPressed: () => RemoveMutation(_cart.items[index]),
                ),
                title: _cart.items[index].name.text.xl.make(),
              ),
            ),
          );
  }
}

import 'package:firstonvscode/models/cart.dart';
import 'package:firstonvscode/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class MyStore extends VxStore {
  catalogModel cat;
  CartModel cart;

  MyStore() {
    cat = catalogModel();
    cart = CartModel();
    cart.catalog = cat;
  }
}

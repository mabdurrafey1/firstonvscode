import 'package:firstonvscode/models/catalog.dart';

class CartModel {
  static final cartM = CartModel._internal();

  CartModel._internal();

  factory CartModel() => cartM;
  catalogModel _cat;

  final List<int> _itemId = [];

  catalogModel get catalog => _cat;

  set catalog(catalogModel newcat) {
    assert(newcat != null);
    _cat = newcat;
  }

  List<itemCat> get items => _itemId.map((id) => _cat.getById(id)).toList();

  // Get total price
  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);

  // Add Item

  void add(itemCat item) {
    _itemId.add(item.id);
  }

  // Remove Item

  void remove(itemCat item) {
    _itemId.remove(item.id);
  }
}

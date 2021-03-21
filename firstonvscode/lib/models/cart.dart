import 'package:firstonvscode/core/store.dart';
import 'package:firstonvscode/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class CartModel {
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
//not reqired now becuase of mutations
//   void add(itemCat item) {
//     _itemId.add(item.id);
//   }

//   // Remove Item
// //not reqired now becuase of mutations
//   void remove(itemCat item) {
//     _itemId.remove(item.id);
//   }
}

class AddMutation extends VxMutation<MyStore> {
  final itemCat item;

  AddMutation(this.item);
  @override
  perform() {
    store.cart._itemId.add(item.id);
  }
}

class RemoveMutation extends VxMutation<MyStore> {
  final itemCat item;

  RemoveMutation(this.item);
  @override
  perform() {
    store.cart._itemId.remove(item.id);
  }
}

import 'dart:convert';

// ignore: camel_case_types
class catalogModel {
  static List<itemCat> items;
//getter by id
  itemCat getById(int id) =>
      items.firstWhere((element) => element.id == id, orElse: null);
//getter by position
  itemCat getByPos(int pos) => items[pos];
}

// ignore: camel_case_types
class itemCat {
  final int id;
  final String desc;
  final String name;
  final num price;
  final String color;
  final String image;
  itemCat({
    this.id,
    this.desc,
    this.name,
    this.price,
    this.color,
    this.image,
  });

  itemCat copyWith({
    int id,
    String desc,
    String name,
    num price,
    String color,
    String image,
  }) {
    return itemCat(
      id: id ?? this.id,
      desc: desc ?? this.desc,
      name: name ?? this.name,
      price: price ?? this.price,
      color: color ?? this.color,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'desc': desc,
      'name': name,
      'price': price,
      'color': color,
      'image': image,
    };
  }

  factory itemCat.fromMap(Map<String, dynamic> map) {
    return itemCat(
      id: map['id'],
      desc: map['desc'],
      name: map['name'],
      price: map['price'],
      color: map['color'],
      image: map['image'],
    );
  }

  String toJson() => json.encode(toMap());

  factory itemCat.fromJson(String source) =>
      itemCat.fromMap(json.decode(source));

  @override
  String toString() {
    return 'itemCat(id: $id, desc: $desc, name: $name, price: $price, color: $color, image: $image)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is itemCat &&
        other.id == id &&
        other.desc == desc &&
        other.name == name &&
        other.price == price &&
        other.color == color &&
        other.image == image;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        desc.hashCode ^
        name.hashCode ^
        price.hashCode ^
        color.hashCode ^
        image.hashCode;
  }
}

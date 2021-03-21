import 'package:firstonvscode/models/catalog.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

// ignore: camel_case_types
class itemWidget extends StatelessWidget {
  final itemCat item;
  const itemWidget({Key key, @required this.item})
      : assert(item != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () {},
        leading: Image.network(item.image),
        title: item.name.text.semiBold.size(20).make(),
        subtitle: item.desc.text.make(),
        trailing: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                print('pressed');
              },
              child: Text(
                "\$${item.price.toString()}",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
              ),
            )
          ], //
        ),
      ),
    );
  }
}

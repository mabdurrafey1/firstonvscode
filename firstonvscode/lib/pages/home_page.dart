import 'package:firstonvscode/models/catalog.dart';

import 'package:firstonvscode/pages/detail.dart';
import 'package:firstonvscode/widgets/add2cart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:velocity_x/velocity_x.dart';
import 'dart:convert';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    final json = await rootBundle.loadString("assets/database/catalog.json");
    final decodedJson = jsonDecode(json);
    var jsonProducts = decodedJson["products"];
    catalogModel.items = List.from(jsonProducts)
        .map<itemCat>((item) => itemCat.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/cart');
        },
        backgroundColor: Vx.pink900,
        child: Icon(CupertinoIcons.cart),
      ),
      backgroundColor: Vx.white,
      appBar: AppBar(
        backgroundColor: Vx.white,
        title: "Catalog App".text.color(Colors.black).xl2.bold.make(),
        centerTitle: true,
        //shadowColor: null,
        elevation: 0,
      ),
      body: (catalogModel.items != null && catalogModel.items.isNotEmpty)
          ? SafeArea(
              child: Container(
                child: ListView.builder(
                  itemCount: catalogModel.items.length,
                  itemBuilder: (context, index) => InkWell(
                    onTap: () {
                      return Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailPage(
                            catalog: catalogModel.items[index],
                          ),
                        ),
                      );
                    },
                    child: catalogitem(
                      catalog: catalogModel.items[index],
                    ),
                  ),
                ),
              ).px16(),
            )
          : Center(
              child: SpinKitDoubleBounce(
                size: 100,
                color: (Colors.deepPurple),
              ),
            ),
    );
  }
}

// ignore: camel_case_types
class catalogitem extends StatelessWidget {
  final itemCat catalog;

  const catalogitem({Key key, @required this.catalog})
      : assert(catalog != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: Row(
        children: [
          Hero(
            tag: Key(catalog.id.toString()),
            child: Image.network(catalog.image)
                .box
                .roundedSM
                .color(Vx.pink900)
                .p3
                .make()
                .p12()
                .w32(context)
                .h20(context),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                catalog.name.text.bold.xl2.make(),
                catalog.desc.text.textStyle(context.captionStyle).bold.make(),
                SizedBox(height: 12.0),
                ButtonBar(
                  buttonPadding: EdgeInsets.zero,
                  alignment: MainAxisAlignment.spaceBetween,
                  children: [
                    "\$${catalog.price}".text.bold.xl.make(),
                    Add2Cart(
                      catalog: catalog,
                    ),
                  ],
                ).pOnly(right: 9.0)
              ],
            ).py12(),
          ),
        ],
      ),
    ).red100.rounded.square(135).make().py8();
  }
}

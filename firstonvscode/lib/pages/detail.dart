import 'package:firstonvscode/models/catalog.dart';
import 'package:firstonvscode/widgets/add2cart.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class DetailPage extends StatelessWidget {
  final itemCat catalog;
  const DetailPage({Key key, this.catalog})
      : assert(catalog != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[900],
      appBar: AppBar(
        backgroundColor: Colors.pink[900],
        elevation: 0,
      ),
      bottomNavigationBar: Container(
        color: Vx.gray100,
        child: ButtonBar(
          buttonPadding: EdgeInsets.zero,
          alignment: MainAxisAlignment.spaceBetween,
          children: [
            "\$${catalog.price}".text.pink900.bold.xl3.make(),
            Add2Cart(
              catalog: catalog,
            ).h(50),
          ],
        ).px12().py8(),
      ),
      body: Column(
        children: [
          Hero(
            tag: Key(
              catalog.id.toString(),
            ),
            child: Image.network(catalog.image),
          ).h40(context).w64(context),
          Expanded(
            child: VxArc(
              edge: VxEdge.TOP,
              arcType: VxArcType.CONVEY,
              height: 30.0,
              child: Container(
                width: context.screenWidth,
                color: Colors.white,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      catalog.name.text.bold.xl4.make(),
                      catalog.desc.text.xl
                          .textStyle(context.captionStyle)
                          .make(),
                      "Ipsum sanctus. Amet dolores labore duo sea dolor sanctus no rebum, nonumy et sed labore ipsum, dolores et justo accusam lorem, diam sed nonumy lorem labore est. No sit voluptua aliquyam rebum et. Labore eirmod vero et erat consetetur. Sit justo no dolores."
                          .text
                          .textStyle(context.captionStyle)
                          .make()
                          .p12(),
                    ],
                  ).py32(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductsListItem extends StatefulWidget {
  String imageUrl;
  String title;
  String time;
  String description;
  String bannerUrl;
  String price;
  String stock;
  String orderItems;

  ProductsListItem(
      {@required this.bannerUrl,
      @required this.imageUrl,
      @required this.title,
      @required this.time,
      @required this.description,
      @required this.price,
      @required this.stock,
      @required this.orderItems});

  @override
  _ProductsListItemState createState() => _ProductsListItemState();
}

class _ProductsListItemState extends State<ProductsListItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 18,
                  backgroundImage: CachedNetworkImageProvider(widget.imageUrl),
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      (widget.title),
                      style:
                          TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(widget.time,
                        style: TextStyle(fontSize: 12, color: Colors.grey)),
                  ],
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              widget.description,
              style: TextStyle(fontSize: 13),
            ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: CachedNetworkImage(
                imageUrl: widget.bannerUrl,
                width: 350,
                height: 170,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.wallet_giftcard,
                      size: 20,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "BDT " + widget.price,
                      style:
                          TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.menu,
                      size: 20,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(widget.stock + " Avaiable stock",
                        style: TextStyle(
                            fontSize: 10, fontWeight: FontWeight.bold))
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.shopping_cart_outlined,
                      size: 20,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(widget.orderItems + " Order(s)",
                        style: TextStyle(
                            fontSize: 10, fontWeight: FontWeight.bold))
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

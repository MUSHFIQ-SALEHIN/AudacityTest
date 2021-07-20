import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TrendingProductGrid extends StatefulWidget {
  String profileUrl;
  String price;
  String title;
  TrendingProductGrid(
      {@required this.profileUrl,
      @required this.price,
      @required this.title});
  @override
  _TrendingProductGridState createState() => _TrendingProductGridState();
}

class _TrendingProductGridState extends State<TrendingProductGrid> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5.0))),
      child:Card(
        elevation: 3,
        child: Column(
        children: [
          Expanded(child: CachedNetworkImage(imageUrl: widget.profileUrl,fit: BoxFit.cover,)),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(widget.title,style: TextStyle(fontSize: 11,fontWeight: FontWeight.bold),maxLines: 1,overflow: TextOverflow.ellipsis,),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0.0,0.0,0.0,5.0),
                child: Text("Price: BDT "+widget.price,style: TextStyle(fontSize: 10)),
              )
            ],
          )
        ],
      ),
      ));
  }
}

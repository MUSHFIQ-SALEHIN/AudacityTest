import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewShopsGrid extends StatefulWidget {
  String profileUrl;
  String bannerUrl;
  String title;
  NewShopsGrid(
      {@required this.profileUrl,
      @required this.bannerUrl,
      @required this.title});
  @override
  _NewShopsGridState createState() => _NewShopsGridState();
}

class _NewShopsGridState extends State<NewShopsGrid> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
          image: DecorationImage(
              image: CachedNetworkImageProvider(widget.bannerUrl),
              fit: BoxFit.cover)),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text(widget.title,textAlign: TextAlign.center,style: TextStyle(color: Colors.white,fontSize: 12,fontWeight: FontWeight.w500),),
              ),
              color: const Color(0xFF0E3311).withOpacity(0.5),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 50.0,
              height: 50.0,
              decoration: BoxDecoration(
                color: const Color(0xff7c94b6),
                image: DecorationImage(
                  image: CachedNetworkImageProvider(widget.profileUrl),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.all(Radius.circular(50.0)),
                border: Border.all(
                  color: Colors.blue,
                  width: 1.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

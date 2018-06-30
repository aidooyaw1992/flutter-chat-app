import 'package:flutter/material.dart';

class GradientAppBar extends StatelessWidget {
  final title;
  final double size = 66.0;
  GradientAppBar(this.title);

  @override
  Widget build(BuildContext context) {
    final double statusBarSize = MediaQuery.of(context).padding.top;

    return new Container(
      padding: new EdgeInsets.only(top: statusBarSize),
      height: statusBarSize+size,
      child: new Center(
        child: new Text(
          title,
          style: new TextStyle(fontWeight: FontWeight.w600, fontSize: 36.0, color: Colors.white),
          ),
      ),
      decoration: new BoxDecoration(
        gradient: new LinearGradient(colors: [const Color(0xFF12BAAB),const Color(0xFF303F9F)],
          begin:  const FractionalOffset(0.0, 0.0),
          end: const FractionalOffset(1.0, 0.0),
          stops: [0.0,1.0],
          tileMode: TileMode.clamp
        ),
      ),
    );
  }
}
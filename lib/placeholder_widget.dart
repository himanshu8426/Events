import 'package:flutter/material.dart';

class PlaceholderWidget extends StatelessWidget{
  final Color color;

  PlaceholderWidget(this.color);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        color: color
    );

//    return Container(
//      constraints: BoxConstraints.expand(
//        height: Theme.of(context).textTheme.display1.fontSize * 1.1 + 200.0,
//      ),
//      padding: const EdgeInsets.all(8.0),
//      color: color,
//      alignment: Alignment.center,
//      child: Text('Hello World', style: Theme.of(context).textTheme.display1.copyWith(color: Colors.white)),
//      foregroundDecoration: BoxDecoration(
//        image: DecorationImage(
//          image: NetworkImage('https://www.example.com/images/frame.png'),
//          centerSlice: Rect.fromLTRB(270.0, 180.0, 1360.0, 730.0),
//        ),
//      ),
//      transform: Matrix4.rotationZ(0.1),
//    );
  }

}

class SnackBarDemo extends StatelessWidget{
  final String text;

  SnackBarDemo(this.text);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(


    );
  }

}
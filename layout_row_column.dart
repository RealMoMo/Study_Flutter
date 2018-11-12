import 'package:flutter/material.dart';

void main()=>runApp(buildColumn());


Widget buildRow(){
  final TextStyle tvStyle = new TextStyle(color: Colors.deepOrange,fontSize: 18.0);

   return new Row(
     textDirection: TextDirection.ltr,
     mainAxisAlignment: MainAxisAlignment.center,
     mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.center,
    verticalDirection: VerticalDirection.up,
     textBaseline: TextBaseline.alphabetic,
     children: <Widget>[
       new Text(
         "RealMo",
         textDirection: TextDirection.ltr,
         textAlign: TextAlign.center,
         style: tvStyle,
       ),
       new Text(
         "Flutter跨平台",
         textDirection: TextDirection.ltr,
         textAlign: TextAlign.center,
         style: tvStyle,
       ),
       new Text(
         "Github",
         textDirection: TextDirection.ltr,
         textAlign: TextAlign.center,
         style: tvStyle,
       )
     ],
   );
}


Widget buildColumn(){

  final TextStyle tvStyle = new TextStyle(color: Colors.deepOrange,fontSize: 18.0);

  return new Column(
    textDirection: TextDirection.ltr,
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.center,
    verticalDirection: VerticalDirection.up,
    textBaseline: TextBaseline.alphabetic,
    children: <Widget>[
      new Text(
        "RealMo",
        textDirection: TextDirection.ltr,
        textAlign: TextAlign.center,
        style: tvStyle,
      ),
      new Text(
        "Flutter跨平台",
        textDirection: TextDirection.ltr,
        textAlign: TextAlign.center,
        style: tvStyle,
      ),
      new Text(
        "Github",
        textDirection: TextDirection.ltr,
        textAlign: TextAlign.center,
        style: tvStyle,
      )
    ],
  );



}

import 'package:flutter/material.dart';

Widget appBar(BuildContext context){
  return RichText(
  text: TextSpan(
    style: TextStyle(fontSize: 22),
    children: <TextSpan>[
      TextSpan(text: '', style: TextStyle(fontWeight: FontWeight.bold)),
      TextSpan(text: '', style: TextStyle(fontWeight: FontWeight.bold)),
    ],
  ),
);
}
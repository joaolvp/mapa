import 'package:flutter/material.dart';
import 'homepage.dart';

void main(){
  runApp(
      MaterialApp(
        routes: {
          '/':(_) => HomePage(),
        },
      ));
}
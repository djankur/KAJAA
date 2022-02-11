import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppNavigation{
   static push(BuildContext context,Widget route){
     Navigator.push(context, MaterialPageRoute(builder: (context) => route,));
   }
}
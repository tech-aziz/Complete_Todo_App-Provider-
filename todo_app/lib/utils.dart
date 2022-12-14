import 'package:flutter/material.dart';
class Utils{
  static void showSnackBar(BuildContext context, String text) {
     ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(text,style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold,),),
      ),
    );
  }

}
import 'package:flutter/material.dart';

///display error message
void displaymessageToUser(String message, BuildContext context){
  showDialog(context: context, builder: (context) => AlertDialog(
    title: Text(message),
  ),);
}
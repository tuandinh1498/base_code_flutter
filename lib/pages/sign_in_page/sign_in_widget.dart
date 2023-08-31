import 'package:flutter/material.dart';

AppBar buildAppbar(){
  return AppBar(
    elevation: 5,
    bottom: PreferredSize(
      preferredSize: const Size.fromHeight(1.0),
      child: Container(
        color: Colors.grey.withOpacity(0.5),
      ),

    ),
    title: Text("Login"),
  );
}
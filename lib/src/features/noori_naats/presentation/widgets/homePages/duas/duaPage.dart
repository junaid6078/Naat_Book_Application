import 'package:book/src/features/noori_naats/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DuaHomePage extends StatefulWidget {
  const DuaHomePage({super.key});

  @override
  State<DuaHomePage> createState() => _DuaHomePageState();
}

class _DuaHomePageState extends State<DuaHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blueColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: blueColor,
        title: Text(
          "Duas",
          style: TextStyle(
            color: yellowColor,
          ),
        ),
        centerTitle: true,
      ),
    );
  }
}

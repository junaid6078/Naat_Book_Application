import 'package:book/src/features/noori_naats/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:prayers_times/prayers_times.dart';
import '../../../home_View.dart';
import 'package:geolocator/geolocator.dart';

class DuaPage extends StatefulWidget {
  const DuaPage({super.key});

  @override
  State<DuaPage> createState() => _DuaPageState();
}

class _DuaPageState extends State<DuaPage> {


  @override
  Widget build(BuildContext context) {

    final height = MediaQuery.of(context).size.height;
    final Width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: blueColor,
        title: Text(
          "Dua",
          style: TextStyle(
            color: yellowColor,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            height: height * 0.35,
            width: double.infinity,
            decoration: BoxDecoration(
              //color: blueColor,
            ),
          ),
        ],
      ),
    );
  }
}

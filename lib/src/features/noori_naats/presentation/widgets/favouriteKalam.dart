import 'package:book/src/features/noori_naats/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FavouriteKalam extends StatefulWidget {
  final List<FavouriteKalam> favourites = [];
  FavouriteKalam({super.key});

  @override
  State<FavouriteKalam> createState() => _FavouriteKalamState();
}

class _FavouriteKalamState extends State<FavouriteKalam> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: yellowColor,
        ),
        backgroundColor: blueColor,
        title: Text(
          "Favourites",
          style: TextStyle(color: yellowColor),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: widget.favourites.length,
          itemBuilder: (context, int index) {
            return Container(
              child: Text(
                widget.favourites[index].toString(),
              ),
            );
          },
        ),
      ),
    );
  }
}

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import '../../utils/colors.dart';


class KalamLine extends StatelessWidget {
  final Color color;
  final double height;
  final String text;

  KalamLine({
    required this.color,
    required this.height,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 2),
      color: color,
      height: (height == null) ? 20 : height,
      child: (text == null)
          ? null
          : Container(
              margin: EdgeInsets.only(left: 16, right: 16),
              child: AutoSizeText(
                text,
                style: TextStyle(
                  fontSize: 30,
                  color: primaryTextColor,
                ),
                textAlign: TextAlign.right,
              ),
            ),
    );
  }
}

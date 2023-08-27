import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class KalamLine extends StatelessWidget {
  final Color color;
  final double height;
  final String text;

  const KalamLine({super.key,
    required this.color,
    required this.height,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 0),
      color: color,
      height: (height == null) ? 5 : height,
      child: (text == null)
          ? null
          : Container(
              margin: const EdgeInsets.only(left: 16, right: 16),
              child: AutoSizeText(
                text,
                style: const TextStyle(
                  fontSize: 30,
                  color: Colors.black,
                  fontWeight: FontWeight.w100,
                ),
                textAlign: TextAlign.right,
              ),
            ),
    );
  }
}

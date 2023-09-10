import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quran/quran.dart' as quran;
import '../../../../../utils/colors.dart';

class JuzzPageView extends StatefulWidget {
  final int juzzNumber;
  //final int surahNumber;
  const JuzzPageView({super.key, required this.juzzNumber});

  @override
  State<JuzzPageView> createState() => _JuzzPageViewState();
}

class _JuzzPageViewState extends State<JuzzPageView> {
  @override
  Widget build(BuildContext context) {
    final heigth = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        elevation: 0,
        leading: Container(
          margin: const EdgeInsets.all(8),
          height: heigth * 0.1,
          width: width * 0.1,
          decoration: BoxDecoration(
            color: blueColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: BackButton(
            color: yellowColor,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return Container(
                    decoration: BoxDecoration(
                      color: blueColor,
                      // borderRadius: BorderRadius.only(
                      //   topRight: Radius.circular(12),
                      //   topLeft: Radius.circular(12),
                      // ),
                    ),
                  );
                },
              );
            },
            icon: const Icon(Icons.settings),
          ),
        ],
        backgroundColor: backgroundColor,
        centerTitle: true,
        title: Text(
          widget.juzzNumber.toString(),
          style: TextStyle(
            color: blueColor,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          AutoSizeText(
            quran.basmala,
            style: TextStyle(
              color: blueColor,
              fontSize: width * 0.06,
            ),
            textAlign: TextAlign.center,
          ),
          Expanded(
            child: SafeArea(
              child: ListView.builder(
                itemBuilder: (BuildContext context, int indexA) {
                  return Container(
                    height: heigth * 0.9,
                    //width: width * 1,
                    padding: EdgeInsets.fromLTRB(24, 24, 24, 24),
                    margin: EdgeInsets.fromLTRB(12, 8, 12, 4),
                    color: Colors.white,
                    child: ListView.builder(
                      itemCount: quran.getVersesTextByPage(indexA+1).length,
                      itemBuilder: (BuildContext context, int indexB) {
                        return Container(
                          margin: EdgeInsets.all(8),
                          child: AutoSizeText(
                            quran.getVersesTextByPage(indexA+1,
                                verseEndSymbol: true)[indexB],
                            style: TextStyle(
                              fontSize: width*0.05
                            ),
                            textAlign: TextAlign.end,
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

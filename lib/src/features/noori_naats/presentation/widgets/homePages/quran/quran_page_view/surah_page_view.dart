import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:quran/quran.dart' as quran;
import '../../../../../utils/colors.dart';

class SurahPageView extends StatefulWidget {
  final int surahNumber;
  const SurahPageView({super.key, required this.surahNumber});

  @override
  State<SurahPageView> createState() => _SurahPageViewState();
}

class _SurahPageViewState extends State<SurahPageView> {
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
          quran.getSurahName(widget.surahNumber + 1),
          style: TextStyle(
            color: blueColor,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: heigth * 0.25,
              width: width * 1,
              margin: const EdgeInsets.fromLTRB(8, 4, 8, 4),
              decoration: BoxDecoration(
                color: blueColor,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(24, 24, 0, 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        AutoSizeText(
                          quran.getSurahName(widget.surahNumber + 1),
                          style: TextStyle(
                            color: lightBlue,
                            fontSize: width * 0.1,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        AutoSizeText(
                          quran.getSurahNameEnglish(widget.surahNumber + 1),
                          style: TextStyle(
                              color: lightBlue,
                              fontSize: width * 0.06,
                              fontStyle: FontStyle.italic),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        AutoSizeText(
                          "${quran.getPlaceOfRevelation(widget.surahNumber + 1)} Surah",
                          style: TextStyle(
                            color: lightBlue,
                          ),
                        ),
                        AutoSizeText(
                          "${quran.getVerseCount(widget.surahNumber + 1).toString()} Verses",
                          style: TextStyle(
                            color: lightBlue,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 24, 24, 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        AutoSizeText(
                          textAlign: TextAlign.end,
                          quran.getSurahNameArabic(widget.surahNumber + 1),
                          style: TextStyle(
                            fontSize: width * 0.1,
                            color: lightBlue,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
                          decoration: BoxDecoration(
                            color: lightBlue,
                            borderRadius: BorderRadius.circular(24),
                          ),
                          child: TextButton.icon(
                            onPressed: () {},
                            icon: Icon(
                              Icons.play_arrow_rounded,
                              size: width * 0.08,
                              color: blueColor,
                            ),
                            label: Text(
                              "play",
                              style: TextStyle(
                                color: blueColor,
                                fontSize: width * 0.05,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: quran.getVerseCount(widget.surahNumber + 1),
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    height: heigth * 0.5,
                    width: width * 1,
                    padding: EdgeInsets.fromLTRB(24, 24, 24, 24),
                    margin: EdgeInsets.fromLTRB(12, 8, 12, 4),
                    color: Colors.white,
                    child: Center(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            AutoSizeText(
                              quran.getVerse(
                                  widget.surahNumber + 1, index + 1,
                                  verseEndSymbol: true),
                              style: TextStyle(
                                fontSize: width * 0.05,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              height: heigth * 0.03,
                            ),
                            AutoSizeText(
                              quran.getVerseTranslation(
                                widget.surahNumber + 1,
                                index + 1,
                              ),
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: heigth * 0.015),
                              overflow: TextOverflow.clip,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

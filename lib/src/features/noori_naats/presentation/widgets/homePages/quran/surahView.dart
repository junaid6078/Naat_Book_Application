import 'package:auto_size_text/auto_size_text.dart';
import 'package:book/src/features/noori_naats/presentation/widgets/homePages/quran/quran_page_view/quran_page_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quran/quran.dart' as quran;
import '../../../../utils/colors.dart';

class SurahViewPage extends StatefulWidget {
  const SurahViewPage({super.key});

  @override
  State<SurahViewPage> createState() => _SurahViewPageState();
}

class _SurahViewPageState extends State<SurahViewPage> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final wigth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: backgroundColor,
      body: FutureBuilder(
        builder: (BuildContext context, snapshot) {
          return ListView.builder(
            itemCount: quran.totalSurahCount,
            itemBuilder: (context, int index) {
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => QuranPageView(
                        //surahTilte: quran.getSurahName(index + 1),
                        surahNumber: index,
                      ),
                    ),
                  );
                },
                child: Container(
                  margin: EdgeInsets.fromLTRB(16, 4, 16, 4),
                  padding: EdgeInsets.fromLTRB(0, 0, 8, 0),
                  height: height * 0.07,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Container(
                              margin: EdgeInsets.fromLTRB(12, 0, 8, 0),
                              height: height * 0.04,
                              width: wigth * 0.1,
                              decoration: BoxDecoration(
                                color: blueColor,
                                borderRadius: BorderRadius.circular(24),
                              ),
                              child: Center(
                                child: AutoSizeText(
                                  (index + 1).toString(),
                                  style: TextStyle(
                                    color: yellowColor,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.fromLTRB(4, 0, 0, 0),
                                //padding: const EdgeInsets.fromLTRB(4, 2, 0, 0),
                                child: Text(
                                  maxLines: 1,
                                  overflow: TextOverflow.clip,
                                  textAlign: TextAlign.right,
                                  quran.getSurahName(index + 1),
                                  textWidthBasis: TextWidthBasis.parent,
                                  style: TextStyle(
                                    color: blueColor,
                                    fontSize: wigth * 0.05,
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(4, 0, 0, 0),
                                padding: EdgeInsets.fromLTRB(4, 2, 4, 2),
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade400,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: AutoSizeText(
                                  "verses " +
                                      quran.getVerseCount(index + 1).toString(),
                                  style: TextStyle(
                                    color: blueColor,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.fromLTRB(0, 0, 12, 0),
                        child: Text(
                          maxLines: 1,
                          overflow: TextOverflow.clip,
                          textAlign: TextAlign.right,
                          quran.getSurahNameArabic(index + 1),
                          textWidthBasis: TextWidthBasis.parent,
                          style: TextStyle(
                            color: blueColor,
                            fontSize: wigth * 0.06,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

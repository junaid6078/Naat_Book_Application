import 'package:auto_size_text/auto_size_text.dart';
import 'package:book/src/features/noori_naats/presentation/widgets/homePages/quran/quran_page_view/quran_page_view.dart';
import 'package:book/src/features/noori_naats/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:quran/quran.dart' as quran;

class JuzzViewPage extends StatefulWidget {
  const JuzzViewPage({super.key});

  @override
  State<JuzzViewPage> createState() => _JuzzViewPageState();
}

class _JuzzViewPageState extends State<JuzzViewPage> {
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

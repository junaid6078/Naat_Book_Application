import 'package:auto_size_text/auto_size_text.dart';
import 'package:book/src/features/noori_naats/presentation/widgets/homePages/homePage.dart';
import 'package:book/src/features/noori_naats/presentation/widgets/homePages/prayer/prayerPage.dart';
import 'package:book/src/features/noori_naats/presentation/widgets/homePages/duas/duaPage.dart';
import 'package:book/src/features/noori_naats/presentation/widgets/homePages/quran/quranPage.dart';
import 'package:flutter/material.dart';
import '../utils/colors.dart';

class NaatListPage extends StatefulWidget {
  const NaatListPage({super.key});

  @override
  _NaatListPageState createState() => _NaatListPageState();
}

class _NaatListPageState extends State<NaatListPage> {

  int _currentIndex = 0;
  final List _navPages = [
    const HomePage(),
    const QuranHomePage(),
    const PrayerPage(),
    const DuaHomePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _buttomNavBar(context),
      body: _navPages[_currentIndex],
    );
  }


  Container _buttomNavBar(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    double unseletedIconSize = width * 0.05;
    double seletedIconSize = width * 0.065;

    return Container(
      height: height * 0.1,
      decoration: BoxDecoration(
        color: backgroundColor,
        // border: Border.all(
        //   color: yellowColor,
        // ),
      ),
      child: ButtonBar(
        buttonPadding: EdgeInsets.zero,
        alignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton.icon(
            onPressed: () {
              setState(
                () {
                  _currentIndex = 0;
                },
              );
            },
            icon: _currentIndex == 0
                ? Icon(
                    Icons.home,
                    color: blueColor,
                    size: seletedIconSize,
                  )
                : Icon(
                    Icons.home_outlined,
                    color: blueColor,
                    size: unseletedIconSize,
                  ),
            label: _currentIndex == 0
                ? AutoSizeText(
                    "Home",
                    style: TextStyle(
                      color: blueColor,
                    ),
                  )
                : AutoSizeText(
                    "Home",
                    style: TextStyle(
                      color: blueColor,
                    ),
                  ),
          ),
          TextButton.icon(
            onPressed: () {
              setState(
                () {
                  _currentIndex = 1;
                },
              );
            },
            icon: _currentIndex == 1
                ? Icon(
                    Icons.book_rounded,
                    color: blueColor,
                    size: seletedIconSize,
                  )
                : Icon(
                    Icons.book_outlined,
                    color: blueColor,
                    size: unseletedIconSize,
                  ),
            label: _currentIndex == 1
                ? AutoSizeText(
                    "Quran",
                    style: TextStyle(
                      color: blueColor,
                    ),
                  )
                : AutoSizeText(
                    "Quran",
                    style: TextStyle(
                      color: blueColor,
                    ),
                  ),
          ),
          TextButton.icon(
            onPressed: () {
              setState(() {
                _currentIndex = 2;
              });
            },
            icon: _currentIndex == 2
                ? Icon(
                    Icons.mosque_rounded,
                    color: blueColor,
                    size: seletedIconSize,
                  )
                : Icon(
                    Icons.mosque_outlined,
                    color: blueColor,
                    size: unseletedIconSize,
                  ),
            label: _currentIndex == 2
                ? AutoSizeText(
                    "Prayer",
                    style: TextStyle(
                      color: blueColor,
                    ),
                  )
                : AutoSizeText(
                    "Prayer",
                    style: TextStyle(
                      color: blueColor,
                    ),
                  ),
          ),
          TextButton.icon(
            onPressed: () {
              setState(
                () {
                  _currentIndex = 3;
                },
              );
            },
            icon: _currentIndex == 3
                ? Icon(
                    Icons.health_and_safety,
                    color: blueColor,
                    size: seletedIconSize,
                  )
                : Icon(
                    Icons.health_and_safety_outlined,
                    color: blueColor,
                    size: unseletedIconSize,
                  ),
            label: _currentIndex == 3
                ? AutoSizeText(
                    "Duas",
                    style: TextStyle(
                      color: blueColor,
                    ),
                  )
                : AutoSizeText(
                    "Duas",
                    style: TextStyle(
                      color: blueColor,
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}

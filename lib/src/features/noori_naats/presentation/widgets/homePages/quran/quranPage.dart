import 'package:book/src/features/noori_naats/presentation/home_View.dart';
import 'package:book/src/features/noori_naats/presentation/widgets/homePages/homePage.dart';
import 'package:book/src/features/noori_naats/presentation/widgets/homePages/quran/juzzView.dart';
import 'package:book/src/features/noori_naats/presentation/widgets/homePages/quran/surahView.dart';
import 'package:book/src/features/noori_naats/utils/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class QuranHomePage extends StatefulWidget {
  const QuranHomePage({super.key});

  @override
  State<QuranHomePage> createState() => _QuranHomePageState();
}

class _QuranHomePageState extends State<QuranHomePage> {
  int _index = 0;
  final List _tabView = [
    const SurahViewPage(),
    const JuzzViewPage(),
  ];
  List<Tab> tabs = <Tab>[
    Tab(text: "Surah"),
    Tab(text: "Juzz"),
  ];
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final Width = MediaQuery.of(context).size.width;
    return DefaultTabController(
      animationDuration: const Duration(milliseconds: 500),
      length: 2,
      child: Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          leading: Container(
            margin: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: blueColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: BackButton(
              color: yellowColor,
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => NaatListPage(),
                  ),
                );
              },
            ),
          ),
          elevation: 0,
          backgroundColor: backgroundColor,
          title: Text(
            "Quran",
            style: TextStyle(
              color: blueColor,
            ),
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Center(
              heightFactor: 1.6,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                child: Container(
                  height: 50,
                  width: 500,
                  decoration: BoxDecoration(
                    color: blueColor,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: _tabBar(),
                ),
              ),
            ),
            Expanded(
              child: _tabView[_index],
            ),
          ],
        ),
      ),
    );
  }

  TabBar _tabBar() {
    return TabBar(
      tabs: tabs,
      labelColor: blueColor,
      unselectedLabelColor: Colors.white.withOpacity(0.4),
      indicator: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(24),
      ),
      indicatorPadding: const EdgeInsets.all(6),
      splashBorderRadius: BorderRadius.circular(24),
      labelStyle: const TextStyle(
        fontSize: 16,
        fontStyle: FontStyle.italic,
      ),
      onTap: (index) {
        setState(() {
          _index = index;
        });
      },
    );
  }
}

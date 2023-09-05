import 'package:auto_size_text/auto_size_text.dart';
import 'package:book/src/features/noori_naats/domain/hamd/hamdDomain.dart';
import 'package:book/src/features/noori_naats/domain/kalam.dart';
import 'package:book/src/features/noori_naats/presentation/listPages/hamd.dart';
import 'package:book/src/features/noori_naats/presentation/listPages/manqabat.dart';
import 'package:book/src/features/noori_naats/presentation/listPages/naat.dart';
import 'package:book/src/features/noori_naats/presentation/listPages/salam.dart';
import 'package:book/src/features/noori_naats/presentation/search_kalam_screen.dart';
import 'package:flutter/material.dart';
import '../domain/manqabat/manqabarDomain.dart';
import '../domain/naat/naatDomain.dart';
import '../domain/salam/salamDomain.dart';
import '../utils/colors.dart';

class KalamList extends StatefulWidget {
  const KalamList({Key? key}) : super(key: key);

  @override
  State<KalamList> createState() => _KalamListState();
}

class _KalamListState extends State<KalamList> {
  List<Tab> tabs = <Tab>[
    Tab(text: 'حمد', height: 74),
    Tab(text: 'نعت', height: 74),
    Tab(text: 'منقبت', height: 74),
    Tab(text: 'سللام', height: 74),
  ];
  final List<Kalam> _kalams = [];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: tabs.length,
      child: Scaffold(
        backgroundColor: blueColor,
        appBar: _buildAppBar(),
        body: TabBarView(
          children: [
            HamdList(),
            NaatList(),
            ManqabatList(),
            SalamList(),
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      bottom: _tabBar(),
      leading: BackButton(
        style: ButtonStyle(
          iconSize: MaterialStateProperty.all(34),
        ),
        color: yellowColor,
      ),
      actions: [
        IconButton(
          onPressed: () {
            SearchKalams(_kalams);
          },
          icon: Icon(
            Icons.search,
            color: yellowColor,
          ),
        ),
      ],
      title: AutoSizeText(
        "نعتیں",
        style: TextStyle(
          fontSize: 32,
          color: yellowColor,
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true,
      elevation: 0,
      backgroundColor: blueColor,
    );
  }

  TabBar _tabBar() {
    return TabBar(
      labelStyle: TextStyle(fontSize: 20),
      labelColor: yellowColor,
      unselectedLabelColor: backgroundColor,
      indicatorWeight: 5,
      indicatorColor: yellowColor,
      tabs: tabs,
    );
  }
}

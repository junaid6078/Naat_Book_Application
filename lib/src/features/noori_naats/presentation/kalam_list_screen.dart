import 'package:auto_size_text/auto_size_text.dart';
import 'package:book/src/features/noori_naats/presentation/listPages/hamd.dart';
import 'package:book/src/features/noori_naats/presentation/listPages/manqabat.dart';
import 'package:book/src/features/noori_naats/presentation/listPages/naat.dart';
import 'package:book/src/features/noori_naats/presentation/listPages/salam.dart';
import 'package:book/src/features/noori_naats/presentation/search_kalam_screen.dart';
import 'package:flutter/material.dart';
import '../domain/kalam.dart';
import '../utils/colors.dart';

class KalamList extends StatefulWidget {
  const KalamList({Key? key}) : super(key: key);

  @override
  State<KalamList> createState() => _KalamListState();
}

class _KalamListState extends State<KalamList> {
  List<Tab> tabs = <Tab>[
    Tab(text: 'Hamd'),
    Tab(text: 'Naat'),
    Tab(text: 'Manqabat'),
    Tab(text: 'Salam'),
  ];
  final List<Kalam> _kalams = [];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: tabs.length,
      child: Scaffold(
        appBar: _buildAppBar(),
        floatingActionButton: _floatingActionButton(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        body: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/kalambg.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            TabBarView(
              children: [
                HamdList(),
                NaatList(),
                ManqabatList(),
                SalamList(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      bottom: _tabBar(),
      leading: BackButton(
        color: yellowColor,
      ),
      title: AutoSizeText(
        "نعتیں",
        style: TextStyle(
            fontSize: 32, color: yellowColor, fontWeight: FontWeight.bold),
      ),
      centerTitle: true,
      elevation: 0,
      backgroundColor: blueColor,
    );
  }

  TabBar _tabBar() {
    return TabBar(
      unselectedLabelColor: yellowColor,
      padding: EdgeInsets.fromLTRB(4, 0, 4, 8),
      indicator: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: yellowColor,
      ),
      tabs: tabs,
    );
  }

  FloatingActionButton _floatingActionButton() {
    return FloatingActionButton(
      backgroundColor: blueColor,
      onPressed: () {
        showSearch(context: context, delegate: SearchKalams(_kalams));
      },
      child: Icon(
        Icons.search,
        color: yellowColor,
      ),
      // label: const Text(
      //   "Search",
      //   style: TextStyle(
      //     fontSize: 20,
      //     color: Color.fromARGB(255, 247, 190, 25),
      //   ),
      // ),
    );
  }
}

import 'package:auto_size_text/auto_size_text.dart';
import 'package:book/src/features/noori_naats/presentation/otherBooks/books.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../utils/colors.dart';
import '../../kalam_list_screen.dart';
import '../favouriteKalam.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  final SearchController _searchController = SearchController();
  int _gridIndex = 0;
  final List _gridList = [
    "نعتیں",
    "کتابیں",
    "قاعدہ",
    "فضائل",
    "سٹوڈیو",
    "Favourite",
  ];
  final _gridPages = [
    KalamList(),
    BooksHomePage(),
    KalamList(),
    BooksHomePage(),
    KalamList(),
    FavouriteKalam(),
  ];

  @override
  Widget build(BuildContext context) {
    final heigth = MediaQuery.of(context).size.height;
    final weigth = MediaQuery.of(context).size.width;
    return Scaffold(
      key: _key,
      backgroundColor: backgroundColor,
      appBar: _buildAppBar(),
      endDrawer: _drawer(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(8, 24, 8, 12),
            //margin: EdgeInsets.fromLTRB(2, 0, 2, 0),
            height: heigth * 0.5,
            decoration: BoxDecoration(
              color: blueColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(18),
                topRight: Radius.circular(18),
              ),
            ),
            child: GridView.builder(
              itemCount: _gridList.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 2,
              ),
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    setState(
                      () {
                        _gridIndex = index;
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => _gridPages[_gridIndex],
                          ),
                        );
                      },
                    );
                  },
                  child: Card(
                    color: Colors.white,
                    margin: EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AutoSizeText(
                          "راہِ نجات",
                          style: TextStyle(
                              color: blueColor, fontSize: weigth * 0.01),
                        ),
                        AutoSizeText(
                          _gridList[index].toString(),
                          style: TextStyle(
                            fontSize: weigth * 0.06,
                            color: blueColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      actions: [
        IconButton(
          onPressed: () {
            _key.currentState!.openEndDrawer();
          },
          icon: Icon(
            Icons.menu_rounded,
            color: blueColor,
            size: 34,
          ),
        ),
      ],
      title: AutoSizeText(
        "Raah e Nijaat",
        style: TextStyle(
          fontSize: 24,
          color: blueColor,
        ),
      ),
      centerTitle: true,
      elevation: 0,
      backgroundColor: backgroundColor,
    );
  }

  Drawer _drawer() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                //bottomRight: Radius.circular(24),
                bottomLeft: Radius.circular(50),
              ),
              color: blueColor,
            ),
            child: Image(
              image: AssetImage("assets/images/logo_animated.gif"),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.account_circle,
              color: blueColor,
            ),
            title: Text('Profile'),
          ),
          ListTile(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => FavouriteKalam(),
                ),
              );
            },
            leading: Icon(
              Icons.favorite,
              color: Colors.red,
            ),
            title: Text('Favourite'),
          ),
          ListTile(
            leading: Icon(
              Icons.settings,
              color: blueColor,
            ),
            title: Text('Settings'),
          ),
        ],
      ),
    );
  }
}

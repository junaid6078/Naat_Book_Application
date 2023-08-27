import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import '../utils/colors.dart';
import 'kalam_list_screen.dart';

class NaatListPage extends StatefulWidget {
  const NaatListPage({super.key});

  @override
  _NaatListPageState createState() => _NaatListPageState();
}

class _NaatListPageState extends State<NaatListPage> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  @override
  Widget build(BuildContext context) {
    final heigth = MediaQuery.of(context).size.height;
    final weigth = MediaQuery.of(context).size.width;
    return Scaffold(
      key: _key,
      drawer: _drawer(),
      //appBar: _buildAppBar(),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/homebg1.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: heigth * 0.05,
            width: weigth * 0.2,
            child: IconButton(
              onPressed: () {
                _key.currentState!.openDrawer();
              },
              icon: const Icon(
                Icons.menu_rounded,
                size: 32,
                color: Colors.white,
              ),
            ),
          ),
          Positioned(
            top: heigth * 0.3,
            left: weigth * 0.4,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const KalamList(),
                  ),
                );
              },
              child: const Text(
                "نعتیں",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Positioned(
            top: heigth * 0.5,
            left: weigth * 0.4,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const KalamList(),
                  ),
                );
              },
              child: const Text(
                "کتابیں",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: AutoSizeText(
        "راہِ نجات",
        style: TextStyle(
            fontSize: 32, color: blueColor, fontWeight: FontWeight.bold),
      ),
      centerTitle: true,
      elevation: 0,
      backgroundColor: const Color.fromARGB(100, 9, 9, 121),
    );
  }

  Drawer _drawer() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: const <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.black,
            ),
            child: Text(
              'Menu',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.message),
            title: Text('Messages'),
          ),
          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text('Profile'),
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
          ),
        ],
      ),
    );
  }
}

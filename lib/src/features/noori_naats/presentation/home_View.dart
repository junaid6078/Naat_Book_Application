import 'dart:convert';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:book/src/features/noori_naats/domain/kalam_repository.dart';
import 'package:book/src/features/noori_naats/presentation/kalam_view_screen.dart';
import 'package:flutter/material.dart';

class NaatListPage extends StatefulWidget {
  const NaatListPage({super.key});

  @override
  _NaatListPageState createState() => _NaatListPageState();
}

class _NaatListPageState extends State<NaatListPage> {
  // List<Kalam> kalamName = [];
  // Future<List<Kalam>> getData() async {
  //   kalamName = await KalamRepositoryImpl(context).getAllKalams();
  //   // ignore: unrelated_type_equality_checks
  //   if (kalamName.hashCode != Null) {
  //     return kalamName;
  //   }
  //   return kalamName;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      drawer: _drawer(),
      appBar: _buildAppBar(),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                colorFilter: new ColorFilter.mode(
                  Colors.indigoAccent,
                  BlendMode.dstOver,
                ),
                image: AssetImage("assets/images/splash_image.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Color.fromRGBO(26, 30, 50, 80),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => NooriNaatsApp(
                    KalamRepositoryImpl(context),
                  ),
                ),
              );
            },
            child: Center(
              // child: Container(
              //   height: 300,
              //   width: 500,
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(36),
              //   ),
              //   child: Card(
              //     elevation: 8,
              //     color: Color.fromARGB(255, 26, 30, 50),
              //     margin: EdgeInsets.all(20),
              //     child: Center(
              //       child: Text(
              //         "نعتیں",
              //         style: TextStyle(
              //           fontSize: 36,
              //           fontWeight: FontWeight.bold,
              //           color: Color.fromARGB(255, 247, 190, 25),
              //         ),
              //       ),
              //     ),
              //   ),
              // ),


              child: Container(
                width: 350,
                height: 200,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white,
                    width: 4,
                  ),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Center(
                  child: Text(
                    "نعتیں",
                    style: TextStyle(
                      color: Color.fromARGB(255, 247, 190, 25),
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
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
          fontSize: 32,
          color: Color.fromARGB(255, 247, 190, 25),
          fontWeight: FontWeight.bold
        ),
      ),
      centerTitle: true,
      elevation: 8,
      shadowColor: Colors.black,
      backgroundColor: Color.fromARGB(255, 26, 30, 50),
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

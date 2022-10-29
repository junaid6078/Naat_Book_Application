import 'package:book/src/features/noori_naats/domain/kalam_repository.dart';
import 'package:book/src/features/noori_naats/presentation/search_kalam_screen.dart';
import 'package:book/src/features/noori_naats/presentation/widgets/kalam_page.dart';
import 'package:flutter/material.dart';

import '../domain/kalam.dart';
import '../utils/colors.dart';

class NooriNaatsApp extends StatefulWidget {
  final KalamRepository kalamRepository;

  NooriNaatsApp(this.kalamRepository);

  @override
  _NooriNaatsAppState createState() => _NooriNaatsAppState();
}

class _NooriNaatsAppState extends State<NooriNaatsApp> {
  PageController _controller = PageController(
    initialPage: 0,
  );
  List<Kalam> _kalams = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            colorFilter: new ColorFilter.mode(Colors.lightBlueAccent, BlendMode.overlay),
            image: AssetImage("assets/images/page_background.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: FutureBuilder<List<Kalam>>(
              initialData: [],
              future: widget.kalamRepository.getAllKalams(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final kalams = snapshot.data as List<Kalam>;
                  return Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Container(
                      padding: EdgeInsets.all(8),
                      child: PageView.builder(
                        reverse: true,
                        scrollDirection: Axis.horizontal,
                        controller: _controller,
                        itemBuilder: (context, position) {
                          Kalam kalam = kalams[position];
                          return _buildPage(kalam);
                        },
                        itemCount: kalams.length,
                      ),
                    ),
                  );
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              }),
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Text(
        " نعتیں",
        style: TextStyle(fontSize: 32, color: Color.fromARGB(255, 247, 190, 25)),
      ),
      centerTitle: true,
      elevation: 8,
      shadowColor: Colors.black,
      backgroundColor: Color.fromARGB(255, 26, 30, 50),
      actions: [
        IconButton(
          onPressed: () {
            showSearch(context: context, delegate: SearchKalams(_kalams));
          },
          icon: Icon(Icons.search, size: 28,),
          color: Color.fromARGB(255, 247, 190, 25),
        )
      ],
    );
  }

  Widget _buildPage(Kalam kalam) {
    return KalamPage(kalam: kalam);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}


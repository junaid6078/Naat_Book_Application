import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../domain/kalam.dart';
import '../../domain/kalam_repository.dart';
import '../kalam_view_screen.dart';

class NaatList extends StatefulWidget {
  const NaatList({super.key});

  @override
  State<NaatList> createState() => _NaatListState();
}

class _NaatListState extends State<NaatList> {
  @override
  Widget build(BuildContext context) {
    List<Kalam> naatlist = [];
    Future<List<Kalam>> getData() async {
      naatlist = await KalamRepositoryImpl(context).getAllKalams();
      if (naatlist.hashCode != Null) {
        return naatlist;
      }
      return naatlist;
    }

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: FutureBuilder(
          future: getData(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return ListView.separated(
                itemCount: naatlist.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => NooriNaatsApp(
                            naatlist[index].type.toString(),
                            naatlist[index].subject.toString(),
                            naatlist[index].poet.toString(),
                            naatlist[index].lines,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      color: Colors.transparent,
                      padding: const EdgeInsets.all(2.0),
                      margin: const EdgeInsets.all(2.0),
                      child: AutoSizeText(
                        naatlist[index].lines.first,
                        style: const TextStyle(
                          fontSize: 20,
                          color: Color.fromARGB(255, 26, 30, 50),
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.right,
                      ),
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) =>
                    Divider(color: Colors.blueGrey, thickness: 1),
              );
            }
          },
        ),
      ),
    );
  }
}

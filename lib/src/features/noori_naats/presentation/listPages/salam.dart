import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../domain/kalam.dart';
import '../../domain/kalam_repository.dart';
import '../kalam_view_screen.dart';

class SalamList extends StatefulWidget {
  const SalamList({super.key});

  @override
  State<SalamList> createState() => _SalamListState();
}

class _SalamListState extends State<SalamList> {
  @override
  Widget build(BuildContext context) {
    List<Salam> salamlist = [];
    Future<List<Salam>> getData() async {
      salamlist = await KalamRepositoryImpl(context).getAllSalams();
      if (salamlist.hashCode != Null) {
        return salamlist;
      }
      return salamlist;
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
                itemCount: salamlist.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => NooriNaatsApp(
                            salamlist[index].type.toString(),
                            salamlist[index].subject.toString(),
                            salamlist[index].poet.toString(),
                            salamlist[index].lines,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      color: Colors.transparent,
                      padding: const EdgeInsets.all(2.0),
                      margin: const EdgeInsets.all(2.0),
                      child: AutoSizeText(
                        salamlist[index].lines.first,
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
                separatorBuilder: (BuildContext context, int index) => Divider(
                  color: Colors.blueGrey,
                  thickness: 1,
                ),
              );
            }
          },
        ),
      ),
    );
  }
}

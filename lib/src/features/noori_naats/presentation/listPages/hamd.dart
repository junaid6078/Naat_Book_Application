import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../domain/kalam.dart';
import '../../domain/kalam_repository.dart';
import '../kalam_view_screen.dart';

class HamdList extends StatefulWidget {
  const HamdList({super.key});

  @override
  State<HamdList> createState() => _HamdListState();
}

class _HamdListState extends State<HamdList> {
  @override
  Widget build(BuildContext context) {
    List<Hamd> hamdlist = [];
    List<Hamd> list = [];
    Future<List<Hamd>> getData() async {
      hamdlist = await KalamRepositoryImpl(context).getAllHamds();
      return hamdlist;
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
                itemCount: hamdlist.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => NooriNaatsApp(
                            list[index].type.toString(),
                            list[index].subject.toString(),
                            list[index].poet.toString(),
                            list[index].lines,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      color: Colors.transparent,
                      padding: const EdgeInsets.all(2.0),
                      margin: const EdgeInsets.all(2.0),
                      child: AutoSizeText(
                        list[index].lines.first,
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

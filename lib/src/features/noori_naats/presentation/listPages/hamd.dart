import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../domain/hamd/hamdDomain.dart';
import '../../domain/hamd/hamd_repository.dart';
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
    Future<List<Hamd>> getData() async {
      hamdlist = await HamdRepositoryImpl(context).getAllHamds();
      return hamdlist;
    }

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: FutureBuilder(
          future: getData(),
          builder: (BuildContext context, snapshot) {
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
                            hamdlist[index].type.toString(),
                            hamdlist[index].subject.toString(),
                            hamdlist[index].poet.toString(),
                            hamdlist[index].lines,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      color: Colors.transparent,
                      padding: const EdgeInsets.all(2.0),
                      margin: const EdgeInsets.all(2.0),
                      child: AutoSizeText(
                        hamdlist[index].lines.first,
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

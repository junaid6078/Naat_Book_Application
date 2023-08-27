import 'package:auto_size_text/auto_size_text.dart';
import 'package:book/src/features/noori_naats/domain/manqabat/manqabarDomain.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../domain/manqabat/manqabat_repository.dart';
import '../kalam_view_screen.dart';

class ManqabatList extends StatefulWidget {
  const ManqabatList({super.key});

  @override
  State<ManqabatList> createState() => _ManqabatListState();
}

class _ManqabatListState extends State<ManqabatList> {
  @override
  Widget build(BuildContext context) {
    List<Manqabat> manqabatlist = [];
    Future<List<Manqabat>> getData() async {
      manqabatlist = await ManqabatRepositoryImpl(context).getAllManqabats();
      if (manqabatlist.hashCode != Null) {
        return manqabatlist;
      }
      return manqabatlist;
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
                itemCount: manqabatlist.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => NooriNaatsApp(
                            manqabatlist[index].type.toString(),
                            manqabatlist[index].subject.toString(),
                            manqabatlist[index].poet.toString(),
                            manqabatlist[index].lines,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      color: Colors.transparent,
                      padding: const EdgeInsets.all(2.0),
                      margin: const EdgeInsets.all(2.0),
                      child: AutoSizeText(
                        manqabatlist[index].lines.first,
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

import 'package:auto_size_text/auto_size_text.dart';
import 'package:book/src/features/noori_naats/domain/naat/naatDomain.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../domain/naat/naat_repository.dart';
import '../../utils/colors.dart';
import '../kalam_view_screen.dart';

class NaatList extends StatefulWidget {
  const NaatList({super.key});

  @override
  State<NaatList> createState() => _NaatListState();
}

class _NaatListState extends State<NaatList> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    List<Naat> naatlist = [];
    Future<List<Naat>> getData() async {
      naatlist = await NaatRepositoryImpl(context).getAllNaats();
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
              return ListView.builder(
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
                      margin: EdgeInsets.fromLTRB(16, 8, 16, 4),
                      padding: EdgeInsets.fromLTRB(0, 0, 8, 0),
                      height: height * 0.06,
                      width: width * 1,
                      decoration: BoxDecoration(
                        color: backgroundColor,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
                              child: AutoSizeText(
                                maxLines: 1,
                                overflow: TextOverflow.clip,
                                textAlign: TextAlign.right,
                                naatlist[index].lines.first,
                                style: TextStyle(
                                  color: blueColor,
                                  fontSize: width * 0.05,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: height*0.03,
                            width: width*0.1,
                            decoration: BoxDecoration(
                              color: blueColor,
                              borderRadius: BorderRadius.circular(24),
                            ),
                            child: Center(
                              child: Text(
                                (index + 1).toString(),
                                style: TextStyle(
                                  color: yellowColor,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}

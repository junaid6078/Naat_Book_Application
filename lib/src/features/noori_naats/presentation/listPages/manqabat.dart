import 'package:auto_size_text/auto_size_text.dart';
import 'package:book/src/features/noori_naats/domain/manqabat/manqabarDomain.dart';
import 'package:book/src/features/noori_naats/utils/colors.dart';
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
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
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
              return ListView.builder(
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
                      margin: EdgeInsets.fromLTRB(16, 8, 16, 4),
                      padding: EdgeInsets.fromLTRB(0, 0, 8, 0),
                      height: height * 0.05,
                      width: width * 1,
                      decoration: BoxDecoration(
                        color: backgroundColor,
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          // Padding(
                          //   padding: const EdgeInsets.fromLTRB(12, 0, 0, 0),
                          //   child: Icon(
                          //     Icons.favorite_border,
                          //     color: blueColor,
                          //   ),
                          // ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
                            child: AutoSizeText(
                              softWrap: true,
                              maxLines: 1,
                              overflow: TextOverflow.fade,
                              textAlign: TextAlign.right,
                              manqabatlist[index].lines.first,
                              style: TextStyle(
                                color: blueColor,
                                fontSize: width * 0.04,
                              ),
                            ),
                          ),
                          Container(
                            height: height * 0.03,
                            width: width * 0.1,
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

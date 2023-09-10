import 'package:auto_size_text/auto_size_text.dart';
import 'package:book/src/features/noori_naats/utils/colors.dart';
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
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    List<Hamd> hamdlist = [];
    Future<List<Hamd>> getData() async {
      hamdlist = await HamdRepositoryImpl(context).getAllHamds();
      return hamdlist;
    }

    return Scaffold(
      backgroundColor: blueColor,
      body: SafeArea(
        child: FutureBuilder(
          future: getData(),
          builder: (BuildContext context, snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return ListView.builder(
                itemCount: hamdlist.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        CupertinoPageRoute(
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
                                hamdlist[index].lines.first,
                                style: TextStyle(
                                  color: blueColor,
                                  fontSize: width * 0.05,
                                  fontWeight: FontWeight.bold,
                                ),
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

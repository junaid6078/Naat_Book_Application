import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../domain/salam/salamDomain.dart';
import '../../domain/salam/salam_repository.dart';
import '../../utils/colors.dart';
import '../kalam_view_screen.dart';

class SalamList extends StatefulWidget {
  const SalamList({super.key});

  @override
  State<SalamList> createState() => _SalamListState();
}

class _SalamListState extends State<SalamList> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    List<Salam> salamlist = [];
    Future<List<Salam>> getData() async {
      salamlist = await SalamRepositoryImpl(context).getAllSalams();
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
              return ListView.builder(
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
                                salamlist[index].lines.first,
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

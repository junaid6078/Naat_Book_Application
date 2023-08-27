import 'package:auto_size_text/auto_size_text.dart';
import 'package:book/src/features/noori_naats/presentation/listPages/naat.dart';
import 'package:book/src/features/noori_naats/presentation/widgets/kalam_line.dart';
import 'package:flutter/material.dart';
import '../utils/colors.dart';

class NooriNaatsApp extends StatefulWidget {
  final String type;
  final String subject;
  final String poet;
  final List<String> lines;

  const NooriNaatsApp(this.type, this.subject, this.poet, this.lines,
      {super.key});

  @override
  State<NooriNaatsApp> createState() => _NooriNaatsAppState();
}

class _NooriNaatsAppState extends State<NooriNaatsApp> {
  bool _isFavorited = false;
  List favouriteKalam = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: _buildAppBar(),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/kalambg.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                Container(
                  alignment: AlignmentDirectional.topCenter,
                  decoration: BoxDecoration(
                    color: blueColor,
                    borderRadius: const BorderRadius.vertical(
                      bottom: Radius.circular(40.0),
                    ),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 4.0,
                      ),
                      AutoSizeText(
                        widget.poet,
                        style: TextStyle(fontSize: 24, color: yellowColor),
                        textAlign: TextAlign.center,
                      ),
                      AutoSizeText(
                        widget.subject,
                        style: TextStyle(fontSize: 20, color: yellowColor),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(
                        height: 4.0,
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Colors.transparent,
                    padding: const EdgeInsets.all(12),
                    child: ListView.builder(
                      padding: const EdgeInsets.all(2),
                      itemCount: widget.lines.length,
                      physics: const ScrollPhysics(),
                      itemBuilder: (context, position) {
                        return _buildLineContainer(position);
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLineContainer(int position) {
    String line = widget.lines[position];
    return KalamLine(
      height: 40,
      text: line,
      color: Colors.transparent,
    );
  }

  void _toggleFavorite() {
    setState(() {
      _isFavorited = !_isFavorited;
      if (_isFavorited) {
        favouriteKalam.add(this);
      }
    });
  }

  AppBar _buildAppBar() {
    return AppBar(
      actions: [
        IconButton(
          icon: Icon(
            _isFavorited ? Icons.favorite : Icons.favorite_border,
            color: _isFavorited ? Colors.red : Colors.red,
            size: 28,
          ),
          onPressed: _toggleFavorite,
        ),
      ],
      leading: BackButton(
        color: yellowColor,
      ),
      title: Text(
        widget.type,
        style: TextStyle(fontSize: 32, color: yellowColor),
      ),
      centerTitle: true,
      elevation: 0,
      backgroundColor: blueColor,
    );
  }
}

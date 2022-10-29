import 'package:book/src/features/noori_naats/domain/kalam_repository.dart';
import 'package:book/src/features/noori_naats/presentation/kalam_view_screen.dart';
import 'package:book/src/features/noori_naats/presentation/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:book/src/features/noori_naats/presentation/home_View.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Noori Naats',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.lightBlue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // home: PdfBook(title: "Noori Naats",),x
      debugShowCheckedModeBanner: false,
      routes: {
        "/": (BuildContext context) => SplashScreen(),
        "/app": (BuildContext context) => NaatListPage(),
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kajaa/screens/car.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'screens/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  var email = preferences.getString('email');
  runApp(MaterialApp(
    home: email == null ? const MyApp() : const MainListView(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'KAJAA',
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(),
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(
        title: 'Home',
      ),
    );
  }
}

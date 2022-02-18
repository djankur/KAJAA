import 'package:flutter/material.dart';
import 'package:kajaa/screens/LoginPage.dart';
import 'package:kajaa/palatte.dart';
import 'package:kajaa/services/navigation.dart';
import 'LoginPage.dart';

// import 'package:kajaa/screens/car.dart';
// import 'car.dart';

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/painting.dart';
// import 'package:flutter/rendering.dart';
// import 'package:flutter/widgets.dart';

// import 'bike.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  login() {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: const Text("hello world"),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("OK"),
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: const AssetImage("assets/images/background.jpg"),
          fit: BoxFit.cover,
          colorFilter:
              ColorFilter.mode(Colors.black.withOpacity(0.3), BlendMode.darken),
        ),
      ),
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 100, horizontal: 50),
            child: Text(
              "Find the perfect car or bike for you.",
              style: TextStyle(
                  shadows: [
                    Shadow(
                        // bottomLeft
                        offset: Offset(-1.5, -1.5),
                        color: Colors.black),
                    Shadow(
                        // bottomRight
                        offset: Offset(1.5, -1.5),
                        color: Colors.black),
                    Shadow(
                        // topRight
                        offset: Offset(1.5, 1.5),
                        color: Colors.black),
                    Shadow(
                        // topLeft
                        offset: Offset(-1.5, 1.5),
                        color: Colors.black),
                  ],
                  color: Colors.white,
                  fontSize: 35,
                  fontWeight: FontWeight.w600),
            ),
          ),
          Positioned(
            bottom: 30,
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    "Get a great automobile at a great price.",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                ),
                ElevatedButton(
                  style: kButton,
                  onPressed: () {
                    AppNavigation.push(
                      context,
                      const Login(),
                    );
                  },
                  child: const Text('Get Started'),
                ),
                Row(
                  children: [
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 0),
                      child: Text(
                        "Not registered yet?",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w200),
                      ),
                    ),
                    TextButton(
                      onPressed: login,
                      child: const Text(
                        "Sign up.",
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize: 12,
                            fontWeight: FontWeight.w200),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}

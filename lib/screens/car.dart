import 'package:flutter/material.dart';
import 'package:kajaa/screens/profile.dart';
import 'package:kajaa/screens/components/allcar.dart';
import 'package:kajaa/screens/components/topcar.dart';

class MainListView extends StatefulWidget {
  const MainListView({Key? key}) : super(key: key);

  @override
  MainListViewState createState() => MainListViewState();
}

class MainListViewState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text("Rent a Car"),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Profile(),
                      ));
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.asset(
                    'assets/images/profile.jpg',
                  ),
                ),
              ),
            ),
          ],
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 0,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(children: const <Widget>[
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Top cars",
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 20),
                ),
              ),
              SizedBox(
                height: 220,
                child: TopCar(),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "All Cars",
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 20),
                ),
              ),
              AllCar(),
            ]),
          ),
        ));
  }
}

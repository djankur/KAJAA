import 'dart:ui';

import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:kajaa/screens/car_detail.dart';
import 'package:kajaa/services/url_service.dart';
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
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.asset(
                  'assets/images/profile.jpg',
                ),
              ),
            ),
          ],
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 0,
        ),
        body: Column(children: const <Widget>[
          Expanded(child: TopCar()),
          Expanded(child: AllCar())
        ]));
  }
}

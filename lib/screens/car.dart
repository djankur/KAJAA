import 'dart:ui';

import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class Bikedata {
  int id;
  String name;
  String image;
  String price;
  String category;

  Bikedata(
      {required this.id,
      required this.name,
      required this.image,
      required this.price,
      required this.category});

  factory Bikedata.fromJson(Map<String, dynamic> json) {
    return Bikedata(
        id: json['id'],
        name: json['name'],
        image: json['image'],
        price: json['price'],
        category: json['category']);
  }
}

class MainListView extends StatefulWidget {
  const MainListView({Key? key}) : super(key: key);

  @override
  MainListViewState createState() => MainListViewState();
}

class MainListViewState extends State {
  final String apiURL = 'http://app-site-database.000webhostapp.com/bike.php';

  Future<List<Bikedata>> fetchStudents() async {
    var response = await http.get(Uri.parse(apiURL));

    if (response.statusCode == 200) {
      final items = json.decode(response.body).cast<Map<String, dynamic>>();

      List<Bikedata> studentList = items.map<Bikedata>((json) {
        return Bikedata.fromJson(json);
      }).toList();

      return studentList;
    } else {
      throw Exception('Failed to load data from Server.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text("Rent a Two wheeler"),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.asset(
                  'assets/profile.gif',
                ),
              ),
            ),
          ],
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 0,
        ),
        body: FutureBuilder<List<Bikedata>>(
            future: fetchStudents(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                String street = "Street";
                String sport = "Sport";
                return ListView(
                  scrollDirection: Axis.vertical,
                  children: <Widget>[
                    Expanded(
                      child: Column(
                        children: <Widget>[
                          Center(
                            child: Text(
                              'Street',
                              style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.yellow.shade900),
                            ),
                          ),
                          SizedBox(
                            height: 500,
                            child: ListView(
                              scrollDirection: Axis.vertical,
                              children: snapshot.data!
                                  .map((data) => Column(
                                        children: <Widget>[
                                          if (street == data.category)
                                            Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      8, 8, 30, 8),
                                              child: Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 20,
                                                        horizontal: 10),
                                                child: Row(children: [
                                                  Expanded(
                                                    flex: 3,
                                                    child: Image.network(
                                                      'https://app-site-database.000webhostapp.com/' +
                                                          data.image,
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 2,
                                                    child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                            data.name,
                                                            style: const TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 16,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600),
                                                          ),
                                                          Text(
                                                            'Price: ' +
                                                                data.price,
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .blue
                                                                    .shade900,
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600),
                                                          ),
                                                        ]),
                                                  ),
                                                ]),
                                                width: double.maxFinite,
                                                height: 150,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                          Radius.circular(5)),
                                                  color: Colors.white,
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Colors.grey
                                                          .withOpacity(0.3),
                                                      blurRadius:
                                                          3.0, // soften the shadow
                                                      spreadRadius:
                                                          1.0, //extend the shadow
                                                      offset: const Offset(
                                                        0, // Move to right 10  horizontally
                                                        0, // Move to bottom 10 Vertically
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                        ],
                                      ))
                                  .toList(),
                            ),
                          ),
                          Center(
                            child: Text(
                              'Sport',
                              style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.yellow.shade900),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 20.0),
                            height: 230,
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: snapshot.data!
                                  .map((data) => Column(
                                        children: <Widget>[
                                          if (sport == data.category)
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 20,
                                                        horizontal: 10),
                                                child: Column(children: [
                                                  Expanded(
                                                    flex: 3,
                                                    child: Image.network(
                                                      'https://app-site-database.000webhostapp.com/' +
                                                          data.image,
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 2,
                                                    child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          Text(
                                                            data.name,
                                                            style: const TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 16,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600),
                                                          ),
                                                          Text(
                                                            'Price (per day): ' +
                                                                data.price,
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .blue
                                                                    .shade900,
                                                                fontSize: 14,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600),
                                                          ),
                                                        ]),
                                                  ),
                                                ]),
                                                width: 200,
                                                height: 200,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      const BorderRadius.all(
                                                          Radius.circular(10)),
                                                  color: Colors.white,
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Colors.grey
                                                          .withOpacity(0.3),
                                                      blurRadius:
                                                          3.0, // soften the shadow
                                                      spreadRadius:
                                                          1.0, //extend the shadow
                                                      offset: const Offset(
                                                        0, // Move to right 10  horizontally
                                                        0, // Move to bottom 10 Vertically
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                        ],
                                      ))
                                  .toList(),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                );
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              return const Center(child: CircularProgressIndicator());
            }));
  }
}

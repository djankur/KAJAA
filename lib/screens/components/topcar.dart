import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:kajaa/services/url_service.dart';

class TopCar extends StatefulWidget {
  const TopCar({Key? key}) : super(key: key);

  @override
  _TopCarState createState() => _TopCarState();
}

class _TopCarState extends State<TopCar> {
  var dio = Dio();

  List topCars = [];

  delete(String car_id) {
    // ignore: avoid_print
    print(car_id);
    //api for delete
  }

  getTopCars() async {
    var response = await dio.get(UrlService.topCars);
    var responseData = jsonDecode(response.data);
    if (responseData["success"]) {
      topCars = responseData["data"];
      // ignore: avoid_print
      print(responseData["data"]);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    getTopCars();
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        itemCount: topCars.length,
        itemBuilder: (context, index) {
          return Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                  child: Column(children: [
                    Expanded(
                      flex: 3,
                      child: Image.network(
                        'https://app-site-database.000webhostapp.com/',
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              topCars[index]["car_name"],
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600),
                            ),
                            Text(
                              'Price : ' + topCars[index]["price"],
                              style: TextStyle(
                                  color: Colors.blue.shade900,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600),
                            ),
                          ]),
                    ),
                  ]),
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        blurRadius: 3.0, // soften the shadow
                        spreadRadius: 1.0, //extend the shadow
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
          );
        });
  }
}

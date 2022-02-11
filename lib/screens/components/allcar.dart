import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:kajaa/screens/car_detail.dart';
import 'package:kajaa/services/url_service.dart';

class AllCar extends StatefulWidget {
  const AllCar({Key? key}) : super(key: key);

  @override
  _AllCarState createState() => _AllCarState();
}

class _AllCarState extends State<AllCar> {
  var dio = Dio();

  List allCars = [];

  delete(String car_id) {
    // ignore: avoid_print
    print(car_id);
    //api for delete
  }

  getCars() async {
    var response = await dio.get(UrlService.allCars);
    var responseData = jsonDecode(response.data);
    if (responseData["success"]) {
      allCars = responseData["data"];
      // ignore: avoid_print
      print(responseData["data"]);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    getCars();
    return ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: allCars.length,
        itemBuilder: (context, index) {
          return Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CarDetail(
                            carid: allCars[index]["car_id"](),
                          ),
                        ));
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 10),
                    child: Row(children: [
                      Expanded(
                        flex: 3,
                        child: Image.network(
                            'https://app-site-database.000webhostapp.com/'),
                      ),
                      Expanded(
                        flex: 2,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                allCars[index]["car_name"],
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600),
                              ),
                              Text(
                                'Price: ' + allCars[index]["price"].toString(),
                                style: TextStyle(
                                    color: Colors.blue.shade900,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600),
                              ),
                            ]),
                      ),
                    ]),
                    width: double.maxFinite,
                    height: 150,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
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
              ),
            ],
          );
        });
  }
}

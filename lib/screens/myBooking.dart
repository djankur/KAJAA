import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:kajaa/palatte.dart';
import 'package:kajaa/services/api_service.dart';
import 'package:kajaa/services/url_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyBooking extends StatefulWidget {
  const MyBooking({
    Key? key,
  }) : super(key: key);

  @override
  _MyBookingState createState() => _MyBookingState();
}

class _MyBookingState extends State<MyBooking> {
  final _client = Dio();

  Map<String, dynamic> bookingData = {};

  String email = "";
  String id = "";
  var userinfo = {};
  var bookData = {};
  bool isLoading = true;
  var api = ApiService();
  bool isData = false;

  getBookingDetails() async {
    var response = await api.getRequest(
        UrlService.viewBookingDetails + "?userid=" + userinfo["user_id"]);

    if (response["success"]) {
      setState(() {
        bookData = response["data"];
        isLoading = false;
      });
      if (response["data"] != null) {
        setState(() {
          isData = true;
        });
      }
    }
  }

  Future getEmail() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      email = preferences.getString('email')!;
    });
  }

  getUserDetails() async {
    var response = await api.getRequest(UrlService.user + "?email=" + email);

    if (response["success"]) {
      getBookingDetails();
      setState(() {
        userinfo = response["data"];
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getEmail();
  }

  @override
  Widget build(BuildContext context) {
    getUserDetails();
    return Scaffold(
      backgroundColor: const Color(
        0XFFF4F4FF,
      ),
      appBar: AppBar(
        title: const Text("My Bookings"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 25, horizontal: 50),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(500),
                      child: Image.network(
                        UrlService.baseUrl + userinfo["photo"],
                        width: 150,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            children: [
                              Text(
                                bookData["company"],
                                style: kBodyText2,
                              ),
                              const Text(
                                " ",
                              ),
                              Text(
                                bookData["car_name"],
                                style: kBodyText2,
                              )
                            ],
                          ),
                        ),
                        Divider(),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            children: [
                              Text(
                                "Registration no. : ",
                                style: kBodyText1,
                              ),
                              Text(
                                bookData["reg_no"],
                                style: kBodyText2,
                              )
                            ],
                          ),
                        ),
                        Divider(),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            children: [
                              Text(
                                "Status : ",
                                style: kBodyText1,
                              ),
                              Text(
                                bookData["issue_status"],
                                style: kBodyText2,
                              )
                            ],
                          ),
                        ),
                        Divider(),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            children: [
                              Text(
                                "Booking Date : ",
                                style: kBodyText1,
                              ),
                              Text(
                                bookData["issue_date"],
                                style: kBodyText2,
                              )
                            ],
                          ),
                        ),
                        Divider(),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Row(
                            children: [
                              Text(
                                "Return Date : ",
                                style: kBodyText1,
                              ),
                              Text(
                                bookData["return_date"],
                                style: kBodyText2,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
    );
  }
}

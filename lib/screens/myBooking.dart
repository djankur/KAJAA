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
    setState(() {
      isLoading = true;
    });
    var response =
        await api.getRequest(UrlService.viewBookingDetails + "?userid=" + id);

    if (response["success"]) {
      setState(() {
        bookData = response["data"];
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
      id = userinfo["user_id"];
    });
  }

  getUserDetails() async {
    var response = await api.getRequest(UrlService.user + "?email=" + email);

    if (response["success"]) {
      setState(() {
        userinfo = response["data"];
        isLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getEmail();

    getBookingDetails();
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
                    height: 380,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [Text(bookData["transaction_id"])],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("Status: "),
                            Text(bookData["issue_status"]),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("Reg no: "),
                            Text(bookData["reg_no"]),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("Booking Date: "),
                            Text(bookData["issue_date"]),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("Return Date: "),
                            Text(bookData["return_date"]),
                          ],
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

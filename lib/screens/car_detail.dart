import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:kajaa/palatte.dart';
import 'package:kajaa/services/api_service.dart';
import 'package:kajaa/services/url_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class CarDetail extends StatefulWidget {
  final String carid;
  const CarDetail({Key? key, required this.carid}) : super(key: key);

  @override
  _CarDetailState createState() => _CarDetailState();
}

class _CarDetailState extends State<CarDetail> {
  final _client = Dio();
  final DateRangePickerController _dateRangePickerController =
      DateRangePickerController();

  Map<String, dynamic> bookingData = {};

  String email = "";
  var userinfo = {};
  var carData = {};
  bool isLoading = true;
  var api = ApiService();
  var startDate = "No date selected";
  var endDate = "No date selected";

  date() async {
    showDialog<Widget>(
        context: context,
        barrierColor: Colors.white, // Background color
        barrierDismissible: false,
        builder: (BuildContext context) {
          return SfDateRangePicker(
            minDate: DateTime.now(),
            headerHeight: 70,
            showTodayButton: true,
            selectionMode: DateRangePickerSelectionMode.range,
            showActionButtons: true,
            allowViewNavigation: true,
            controller: _dateRangePickerController,
            onSubmit: (value) {
              startDate = _dateRangePickerController.selectedRange!.startDate
                  .toString();
              endDate =
                  _dateRangePickerController.selectedRange!.endDate.toString();
              Navigator.pop(context);
              Navigator.pop(context);
              carBook();
            },
            onCancel: () {
              _dateRangePickerController.selectedRange = null;
              Navigator.pop(context);
            },
          );
        });
  }

  carBook() async {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 300,
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text(
                  'Confirm booking',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text('Select booking duration',
                        style: TextStyle(
                          fontSize: 16,
                        )),
                    ElevatedButton(
                        child: const Text('Select'), onPressed: date),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text("Booking date:",
                    style: TextStyle(
                      fontSize: 16,
                    )),
                Text(startDate,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w800)),
                const SizedBox(
                  height: 15,
                ),
                const Text("Return date:",
                    style: TextStyle(
                      fontSize: 16,
                    )),
                Text(endDate,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w800)),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      style: kButton,
                      onPressed: booking_function,
                      child: const Text('Confirm'),
                    ),
                    ElevatedButton(
                      style: kButton,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Cancel'),
                    )
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }

  booking_function() async {
    var response = await _client.post(UrlService.bookCar,
        data: FormData.fromMap({
          "user_id": userinfo["user_id"],
          "reg_no": carData["reg_no"],
          "issue_date": startDate,
          "return_date": endDate
        }));
    print(response);
    var reply = jsonDecode(response.data);
    print(reply);
    if (reply == "success") {
      Navigator.pop(context);
      booked("Your Car has been booked successfully");
    } else {
      Navigator.pop(context);
      booked("Some error occurred");
    }
  }

  booked(reply) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text(reply),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("Continue"),
              )
            ],
          );
        });
  }

  getCarDetails() async {
    setState(() {
      isLoading = true;
    });
    var response = await api
        .getRequest(UrlService.viewCarDetails + "?carid=" + widget.carid);

    if (response["success"]) {
      setState(() {
        carData = response["data"];
      });
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
    getCarDetails();
  }

  @override
  Widget build(BuildContext context) {
    getUserDetails();
    return Scaffold(
        backgroundColor: const Color(
          0XFFF4F4FF,
        ),
        appBar: AppBar(
          title: const Text("Details"),
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 0,
        ),
        body: isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Stack(
                children: [
                  Expanded(
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Image.network(
                        UrlService.baseUrl + carData["photo"],
                        height: 400,
                        width: double.infinity,
                      ),
                    ),
                  ),
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 380,
                        ),
                        Container(
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(25.0),
                              topRight: Radius.circular(25.0),
                            ),
                          ),
                          padding: const EdgeInsets.symmetric(
                              vertical: 25, horizontal: 20),
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  carData["car_name"],
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 22.0,
                                    color: Color(0xFF333333),
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  "Rs. " + carData["price"] + " /day",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18.0,
                                    color: Colors.black.withOpacity(.5),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Card(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10, horizontal: 20),
                                      child: Column(
                                        children: [
                                          const Text(
                                            "Color",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          Text(
                                            "Black",
                                            style: TextStyle(
                                                color: Colors.black
                                                    .withOpacity(.5)),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Card(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10, horizontal: 20),
                                      child: Column(
                                        children: [
                                          const Text(
                                            "Color",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          Text(
                                            "Black",
                                            style: TextStyle(
                                                color: Colors.black
                                                    .withOpacity(.5)),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Card(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 10, horizontal: 20),
                                      child: Column(
                                        children: [
                                          const Text(
                                            "Color",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w600),
                                          ),
                                          Text(
                                            "Black",
                                            style: TextStyle(
                                                color: Colors.black
                                                    .withOpacity(.5)),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Text(
                                "You can wrap your Container in an InkWell or GestureDetector. The difference is that InkWell is a material widget that shows a visual indication that the touch was received, whereas GestureDetector is a more general purpose widget that shows no visual indicator.",
                                style: TextStyle(
                                  height: 1.5,
                                  fontSize: 16.0,
                                  color: Colors.black.withOpacity(.5),
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Center(
                                child: ElevatedButton(
                                  style: kButton,
                                  onPressed: carBook,
                                  child: const Text('Book Car'),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ));
  }
}

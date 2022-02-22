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
  final DateRangePickerController _dateRangePickerController =
      DateRangePickerController();

  String email = "";
  var userinfo = {};
  var carData = {};
  bool isLoading = true;
  var api = ApiService();
  var val = "No date selected";

  date() async {
    showDialog<Widget>(
        context: context,
        barrierColor: Colors.white, // Background color
        barrierDismissible: false,
        builder: (BuildContext context) {
          return SfDateRangePicker(
            selectionMode: DateRangePickerSelectionMode.range,
            showActionButtons: true,
            allowViewNavigation: true,
            controller: _dateRangePickerController,
            onSubmit: (value) {
              val = value.toString();
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

  carBook() {
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
                const Text('Select booking duration',
                    style: TextStyle(
                      fontSize: 16,
                    )),
                const SizedBox(
                  height: 15,
                ),
                ElevatedButton(child: const Text('Select'), onPressed: date),
                Text(val,
                    style: const TextStyle(
                      fontSize: 16,
                    )),
              ],
            ),
          ),
        );
      },
    );
  }

  // booked() async {
  //   return showDialog(
  //       context: context,
  //       builder: (context) {
  //         return AlertDialog(
  //           content: const Text(
  //               "Your car has been successfully booked. You can view your booking in the profile section."),
  //           actions: [
  //             TextButton(
  //               onPressed: () => Navigator.pop(context),
  //               child: const Text("Continue"),
  //             )
  //           ],
  //         );
  //       });
  // }

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
                      child: Image.asset(
                        'assets/images/test.png',
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

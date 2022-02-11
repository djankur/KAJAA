// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

class CarDetail extends StatefulWidget {
  final int carid;
  const CarDetail({Key? key, required this.carid}) : super(key: key);

  @override
  _CarDetailState createState() => _CarDetailState();
}

class _CarDetailState extends State<CarDetail>
    with SingleTickerProviderStateMixin {
  // Keep track of selected car index;
  int selectedIndex = 0;

  Map<String, dynamic> cardetails = {};

  getcardetails() async {}

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(
        0XFFF4F4FF,
      ),
      appBar: AppBar(
        title: const Text("Details"),
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
      body: cardetails["id"] == null
          ? const SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Center(child: Text("No details available.")),
            )
          : SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 24.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: kToolbarHeight,
                            ),
                            const SizedBox(
                              height: 25.0,
                            ),
                            const Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: "BMW 8 Series Coupe\n",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 22.0,
                                      color: Color(0xFF333333),
                                    ),
                                  ),
                                  TextSpan(
                                    text: "Starts from \$201,967",
                                    style: TextStyle(
                                      height: 1.7,
                                      fontSize: 14.0,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 30.0,
                            ),
                            Expanded(
                              // Lets create a list of all car image colors
                              child: Align(
                                alignment: Alignment.center,
                                child: Image.asset(
                                  'assets/images/test.png',
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: double.infinity,
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(50.0),
                            topRight: Radius.circular(50.0),
                          ),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24.0,
                          vertical: 32.0,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                _getTabItem("Inspire", true),
                                const SizedBox(
                                  width: 15.0,
                                ),
                                _getTabItem("Inform", false),
                                const SizedBox(
                                  width: 15.0,
                                ),
                                _getTabItem("Technical Data", false),
                              ],
                            ),
                            const SizedBox(
                              height: 25.0,
                            ),
                            Text(
                              "You can wrap your Container in an InkWell or GestureDetector. The difference is that InkWell is a material widget that shows a visual indication that the touch was received, whereas GestureDetector is a more general purpose widget that shows no visual indicator.",
                              style: TextStyle(
                                height: 1.5,
                                fontSize: 16.0,
                                color: Colors.black.withOpacity(.5),
                              ),
                            ),
                            const SizedBox(height: 15.0),
                            const Divider(),
                            const SizedBox(height: 15.0),
                            Expanded(
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(24.0),
                                ),
                                child: FlatButton(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 22.0,
                                  ),
                                  onPressed: () {},
                                  child: const Text(
                                    "Book",
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
    );
  }
}

class ScaleAnimation {}

class FadeSlide {}

Widget _getTabItem(String text, bool isActive) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        text,
        style: TextStyle(
          color: isActive ? Colors.amber : Colors.black.withOpacity(.5),
          fontSize: isActive ? 18.0 : 16.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      isActive
          ? Container(
              margin: const EdgeInsets.only(top: 5.0),
              height: 4.0,
              width: 40.0,
              decoration: BoxDecoration(
                color: isActive ? Colors.blue : Colors.transparent,
                borderRadius: BorderRadius.circular(10.0),
              ),
            )
          : const SizedBox.shrink()
    ],
  );
}

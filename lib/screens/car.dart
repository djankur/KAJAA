import 'package:flutter/material.dart';
import 'package:kajaa/services/api_service.dart';
import 'package:kajaa/services/navigation.dart';
import 'package:kajaa/screens/profile.dart';
import 'package:kajaa/screens/components/allcar.dart';
import 'package:kajaa/screens/components/topcar.dart';
import 'package:kajaa/services/url_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainListView extends StatefulWidget {
  const MainListView({Key? key}) : super(key: key);

  @override
  MainListViewState createState() => MainListViewState();
}

class MainListViewState extends State {
  String email = "";

  var userinfo = {};
  bool isLoading = true;
  var api = ApiService();

  Future getEmail() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      email = preferences.getString('email')!;
    });
  }

  getUserDetails() async {
    var response = await api.getRequest(UrlService.user + "?email=" + email);
    // print(response);
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
  }

  @override
  Widget build(BuildContext context) {
    getUserDetails();
    return isLoading
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              title: const Text("Rent a car"),
              actions: <Widget>[
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: GestureDetector(
                      onTap: () {
                        AppNavigation.push(
                          context,
                          const Profile(),
                        );
                      },
                      child: Text(userinfo["name"])
                      // ClipRRect(
                      //   borderRadius: BorderRadius.circular(50),
                      //   child: Image.asset(
                      //     'assets/images/profile.jpg',
                      //   ),
                      // ),
                      ),
                ),
              ],
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
              elevation: 0,
            ),
            body: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 20),
                        child: Text(
                          "Top cars",
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.black.withOpacity(.7)),
                        ),
                      ),
                      const SizedBox(
                        height: 220,
                        child: TopCar(),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 20),
                        child: Text(
                          "All Cars",
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.black.withOpacity(.7)),
                        ),
                      ),
                      const AllCar(),
                    ]),
              ),
            ));
  }
}

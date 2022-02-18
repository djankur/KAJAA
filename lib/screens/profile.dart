import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kajaa/palatte.dart';
import 'package:kajaa/services/navigation.dart';
import 'package:kajaa/screens/LoginPage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  ProfileState createState() => ProfileState();
}

class ProfileState extends State {
  String email = "";

  Future getEmail() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      email = preferences.getString('email')!;
    });
  }

  Future logOut(BuildContext context) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.remove('email');
    Fluttertoast.showToast(
        msg: "Logout Successful",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.amber,
        textColor: Colors.white,
        fontSize: 16.0);
    AppNavigation.push(
      context,
      const Login(),
    );
  }

  logout() async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: const Text("Are you sure?"),
            actions: [
              TextButton(
                onPressed: () {
                  logOut(context);
                },
                child: const Text("Yes"),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("No"),
              )
            ],
          );
        });
  }

  @override
  void initState() {
    super.initState();
    getEmail();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text("Profile"),
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 0,
          actions: [
            TextButton(
              onPressed: logout,
              child: const Text('Log Out'),
            ),
          ],
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(children: <Widget>[
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 25, horizontal: 50),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(500),
                  child: Image.asset(
                    'assets/images/profile.jpg',
                    width: 150,
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: ElevatedButton(
                        style: kButton,
                        onPressed: () {},
                        child: const Text('My Bookings'),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Username",
                      style: TextStyle(
                        color: Colors.black.withOpacity(.5),
                      ),
                    ),
                    const Text(
                      "Test Name",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    const Divider(),
                    Text(
                      "E-mail",
                      style: TextStyle(
                        color: Colors.black.withOpacity(.5),
                      ),
                    ),
                    Text(
                      email,
                      style: const TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    const Divider(),
                    Text(
                      "Registraion date",
                      style: TextStyle(
                        color: Colors.black.withOpacity(.5),
                      ),
                    ),
                    const Text(
                      "14/02/2022",
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ]),
          ),
        ));
  }
}

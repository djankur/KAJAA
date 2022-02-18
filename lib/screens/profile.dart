import 'package:flutter/material.dart';
import 'package:kajaa/palatte.dart';
import 'package:kajaa/services/navigation.dart';
import 'package:kajaa/screens/LoginPage.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  ProfileState createState() => ProfileState();
}

class ProfileState extends State {
  logout() async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: const Text("Are you sure?"),
            actions: [
              TextButton(
                onPressed: () {
                  AppNavigation.push(context, const Login());
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
                      "Registraion no.",
                      style: TextStyle(
                        color: Colors.black.withOpacity(.5),
                      ),
                    ),
                    const Text(
                      "TEST-1445544",
                      style: TextStyle(
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

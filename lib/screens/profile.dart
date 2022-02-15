import 'package:flutter/material.dart';
import 'package:kajaa/palatte.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  ProfileState createState() => ProfileState();
}

class ProfileState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text("Profile"),
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 0,
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
                    const SizedBox(
                      height: 20,
                    ),
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
                    Center(
                      child: ElevatedButton(
                        style: kButton,
                        onPressed: () {},
                        child: const Text('Log Out'),
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

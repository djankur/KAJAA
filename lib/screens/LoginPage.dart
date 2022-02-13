// ignore_for_file: deprecated_member_use, file_names

import 'package:flutter/material.dart';
import 'package:kajaa/palatte.dart';
import 'package:kajaa/screens/car.dart';

import "../widgets/widgets.dart";
import 'Registration.dart';

// ignore: camel_case_types
class Login_Page extends StatelessWidget {
  const Login_Page({Key? key, required String title}) : super(key: key);

  get child => null;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // ignore: prefer_const_constructors
        BackgroundImage(),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            child: SafeArea(
              child: Column(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  const SizedBox(
                    height: 150,
                    child: Center(
                      child: Text(
                        'oK AAJA',
                        style: kHeading,
                      ),
                    ),
                  ),
                  // ignore: avoid_unnecessary_containers
                  Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 120, horizontal: 40),
                    child: Column(
                      // crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[800]?.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: const TextField(
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 40,
                              ),
                              border: InputBorder.none,
                              hintText: 'Email',
                              hintStyle: kBodyText,
                            ),
                            style: kBodyText,
                            keyboardType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 20),
                          decoration: BoxDecoration(
                            color: Colors.grey[800]?.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: const TextField(
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 40,
                              ),
                              border: InputBorder.none,
                              hintText: 'Password',
                              hintStyle: kBodyText,
                            ),
                            obscureText: true,
                            style: kBodyText,
                            textInputAction: TextInputAction.done,
                          ),
                        ),
                        Column(
                          // crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            // ignore: avoid_unnecessary_containers
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.blue[900],
                                  borderRadius: BorderRadius.circular(50)),
                              child: FlatButton(
                                onPressed: () {},
                                child: const Text(
                                  'Login',
                                  style: kBodyText,
                                ),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.symmetric(vertical: 20),
                              decoration: BoxDecoration(
                                  color: Colors.blue[900],
                                  borderRadius: BorderRadius.circular(50)),
                              child: FlatButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const RegistrationPage(),
                                      ));
                                },
                                child: const Text(
                                  'Register Now',
                                  style: kBodyText,
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const MainListView(),
                                    ));
                              },
                              child: const Text(
                                "Forget Password ?",
                                style: kBodyLink,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  // const Text(
                  //   'forgot password?',
                  //   style: kBodyLink,
                  // )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

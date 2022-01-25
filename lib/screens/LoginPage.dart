// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:kajaa/palatte.dart';

import "../widgets/widgets.dart";

// ignore: camel_case_types
class LoginPage extends StatelessWidget {
  const LoginPage({Key? key, required String title}) : super(key: key);

  get child => null;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // ignore: prefer_const_constructors
        BackgroundImage(),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
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
                  padding:
                      const EdgeInsets.symmetric(vertical: 120, horizontal: 40),
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
                              onPressed: () {},
                              child: const Text(
                                'Register Now',
                                style: kBodyText,
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
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
      ],
    );
  }
}

// ignore: duplicate_ignore
// ignore: file_names, file_names
// ignore_for_file: deprecated_member_use

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:kajaa/widgets/backgroundimage.dart';

import '../palatte.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key}) : super(key: key);
  @override
  // ignore: override_on_non_overriding_member
  _Reg createState() => _Reg();
}

class _Reg extends State<RegistrationPage> {
  final _formKey = GlobalKey<FormState>();
  final _client = Dio();

  Map<String, dynamic> formData = {};
  signup() async {
    var formvalidate = _formKey.currentState!.validate();
    if (formvalidate) {
      _formKey.currentState!.save();
      var response = await _client.post(
          "http://your-ip-address/lily/signup.php",
          data: FormData.fromMap(formData));
      print(response);
    } else {
      print("Form is not validate");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // ignore: prefer_const_constructors
        BackgroundImage(),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Form(
            child: SingleChildScrollView(
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
                        vertical: 20, horizontal: 40),
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
                              hintText: 'Full Name',
                              hintStyle: kBodyText,
                            ),
                            style: kBodyText,
                            textInputAction: TextInputAction.next,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 10),
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
                          margin: const EdgeInsets.symmetric(vertical: 10),
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
                              hintText: 'Phone',
                              hintStyle: kBodyText,
                            ),
                            style: kBodyText,
                            textInputAction: TextInputAction.next,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 10),
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
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 10),
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
                              hintText: 'Licence Number',
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
                                  'Done',
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
                                  'Login',
                                  style: kBodyLink,
                                ),
                              ),
                            ),
                            // TextButton(
                            //   onPressed: () {},
                            //   child: const Text(
                            //     "Forget Password ?",
                            //     style: kBodyLink,
                            //   ),
                            // )
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

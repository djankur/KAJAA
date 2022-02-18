// ignore_for_file: deprecated_member_use, file_names
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kajaa/palatte.dart';
import 'package:kajaa/screens/car.dart';
import 'package:kajaa/services/navigation.dart';
import "../widgets/widgets.dart";
import 'Registration.dart';
import 'package:kajaa/services/url_service.dart';
import 'car.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final _client = Dio();

  Map<String, dynamic> formData = {};

  login() async {
    var formvalidate = _formKey.currentState!.validate();
    if (formvalidate) {
      _formKey.currentState!.save();

      var response = await _client.post(UrlService.loginP,
          data: FormData.fromMap(formData));

      print(response);
      var reply = jsonDecode(response.data);
      print(reply);
      if (reply == "success") {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const MainListView(),
            ));
      } else {
        Fluttertoast.showToast(
          msg: "No Account",
          backgroundColor: Colors.redAccent,
          gravity: ToastGravity.CENTER,
        );
      }
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Stack(
        children: [
          const BackgroundImage(),
          Scaffold(
            backgroundColor: Colors.transparent,
            body: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const Center(
                    child: Text(
                      'Login',
                      style: kHeading,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      onSaved: (value) => formData["email"] = value,
                      validator: (value) =>
                          value == "" ? "E-mail cannot be empty" : null,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        hintText: "Enter your e-mail",
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      validator: (value) =>
                          value == "" ? "password cannot be empty" : null,
                      onSaved: (value) => formData["password"] = value,
                      obscureText: true,
                      decoration: InputDecoration(
                        fillColor: Colors.white,
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        hintText: "Enter your password",
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: ElevatedButton(
                      style: kButton,
                      onPressed: login,
                      child: const Text(
                        "Login",
                        style: kBodyText,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Not registered yet? ",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w400),
                      ),
                      TextButton(
                        onPressed: () {
                          AppNavigation.push(
                            context,
                            const Signup(),
                          );
                        },
                        child: const Text(
                          "Sign up here.",
                          style: kBodyLink,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}



// ignore: camel_case_types
// class Login_Page extends StatelessWidget {
//   const Login_Page({Key? key, required String title}) : super(key: key);

//   get child => null;

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         // ignore: prefer_const_constructors
//         BackgroundImage(),
//         Scaffold(
//           backgroundColor: Colors.transparent,
//           body: SingleChildScrollView(
//             child: SafeArea(
//               child: Column(
//                 // ignore: prefer_const_literals_to_create_immutables
//                 children: [
//                   const SizedBox(
//                     height: 150,
//                     child: Center(
//                       child: Text(
//                         'oK AAJA',
//                         style: kHeading,
//                       ),
//                     ),
//                   ),
//                   // ignore: avoid_unnecessary_containers
//                   Container(
//                     padding: const EdgeInsets.symmetric(
//                         vertical: 120, horizontal: 40),
//                     child: Column(
//                       // crossAxisAlignment: CrossAxisAlignment.end,
//                       children: [
//                         Container(
//                           decoration: BoxDecoration(
//                             color: Colors.grey[800]?.withOpacity(0.5),
//                             borderRadius: BorderRadius.circular(16),
//                           ),
//                           child: const TextField(
//                             decoration: InputDecoration(
//                               contentPadding: EdgeInsets.symmetric(
//                                 horizontal: 40,
//                               ),
//                               border: InputBorder.none,
//                               hintText: 'Email',
//                               hintStyle: kBodyText,
//                             ),
//                             style: kBodyText,
//                             keyboardType: TextInputType.emailAddress,
//                             textInputAction: TextInputAction.next,
//                           ),
//                         ),
//                         Container(
//                           margin: const EdgeInsets.symmetric(vertical: 20),
//                           decoration: BoxDecoration(
//                             color: Colors.grey[800]?.withOpacity(0.5),
//                             borderRadius: BorderRadius.circular(16),
//                           ),
//                           child: const TextField(
//                             decoration: InputDecoration(
//                               contentPadding: EdgeInsets.symmetric(
//                                 horizontal: 40,
//                               ),
//                               border: InputBorder.none,
//                               hintText: 'Password',
//                               hintStyle: kBodyText,
//                             ),
//                             obscureText: true,
//                             style: kBodyText,
//                             textInputAction: TextInputAction.done,
//                           ),
//                         ),
//                         Column(
//                           // crossAxisAlignment: CrossAxisAlignment.end,
//                           children: [
//                             // ignore: avoid_unnecessary_containers
//                             Container(
//                               decoration: BoxDecoration(
//                                   color: Colors.blue[900],
//                                   borderRadius: BorderRadius.circular(50)),
//                               child: FlatButton(
//                                 onPressed: () {},
//                                 child: const Text(
//                                   'Login',
//                                   style: kBodyText,
//                                 ),
//                               ),
//                             ),
//                             Container(
//                               margin: const EdgeInsets.symmetric(vertical: 20),
//                               decoration: BoxDecoration(
//                                   color: Colors.blue[900],
//                                   borderRadius: BorderRadius.circular(50)),
//                               child: FlatButton(
//                                 onPressed: () {
//                                   Navigator.push(
//                                       context,
//                                       MaterialPageRoute(
//                                         builder: (context) =>
//                                             const RegistrationPage(),
//                                       ));
//                                 },
//                                 child: const Text(
//                                   'Register Now',
//                                   style: kBodyText,
//                                 ),
//                               ),
//                             ),
//                             TextButton(
//                               onPressed: () {
//                                 AppNavigation.push(
//                                   context,
//                                   const MainListView(),
//                                 );
//                               },
//                               child: const Text(
//                                 "Forget Password ?",
//                                 style: kBodyLink,
//                               ),
//                             )
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                   // const Text(
//                   //   'forgot password?',
//                   //   style: kBodyLink,
//                   // )
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }

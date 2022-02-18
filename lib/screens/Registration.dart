import 'dart:convert';

// ignore: import_of_legacy_library_into_null_safe
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kajaa/palatte.dart';
import 'package:kajaa/services/navigation.dart';
import 'package:kajaa/services/url_service.dart';
import 'package:kajaa/widgets/backgroundimage.dart';
import 'LoginPage.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final _formKey = GlobalKey<FormState>();
  final _client = Dio();

  Map<String, dynamic> formData = {};

  login() async {
    var formvalidate = _formKey.currentState!.validate();
    if (formvalidate) {
      _formKey.currentState!.save();

      var response = await _client.post(UrlService.signupP,
          data: FormData.fromMap(formData));

      print(response);
      var reply = jsonDecode(response.data);
      print(reply);
      if (reply == "success") {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const Login(),
            ));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
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
                    'Sign up',
                    style: kHeading,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    onSaved: (value) => formData["name"] = value,
                    validator: (value) =>
                        value == "" ? "Name cannot be empty" : null,
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      hintText: "Enter your name",
                    ),
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
                        value == "" ? "Password cannot be empty" : null,
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
                const SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                    style: kButton,
                    onPressed: login,
                    child: const Text(
                      "Sign Up",
                      style: kBodyText,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Already registered? ",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w400),
                    ),
                    TextButton(
                      onPressed: () {
                        AppNavigation.push(
                          context,
                          const Login(),
                        );
                      },
                      child: const Text(
                        "Login here.",
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
    );
  }
}

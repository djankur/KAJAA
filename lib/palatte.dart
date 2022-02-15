import 'package:flutter/material.dart';

const TextStyle kHeading = TextStyle(
  fontSize: 60,
  fontWeight: FontWeight.bold,
  color: Colors.white,
);

const TextStyle kBodyText = TextStyle(
  fontSize: 20,
  fontWeight: FontWeight.bold,
  color: Colors.white,
);

const TextStyle kBodyLink = TextStyle(
  fontSize: 15,
  fontWeight: FontWeight.normal,
  color: Colors.white,
);

var kButton = ElevatedButton.styleFrom(
    padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
    primary: Colors.lightBlue, // background
    onPrimary: Colors.white, // foreground
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)));

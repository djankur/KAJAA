import 'package:flutter/material.dart';

const TextStyle kHeading = TextStyle(
  fontSize: 40,
  fontWeight: FontWeight.w600,
  color: Colors.white,
);

const TextStyle kBodyText = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.w600,
  color: Colors.white,
);
const TextStyle kBodyText1 = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.w400,
  color: Colors.black,
);
const TextStyle kBodyText2 = TextStyle(
  fontSize: 18,
  fontWeight: FontWeight.w600,
  color: Colors.black,
);

const TextStyle kBodyLink = TextStyle(
  fontSize: 15,
  fontWeight: FontWeight.w400,
  color: Colors.blue,
);

var kButton = ElevatedButton.styleFrom(
    padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
    primary: Colors.lightBlue, // background
    onPrimary: Colors.white, // foreground
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)));

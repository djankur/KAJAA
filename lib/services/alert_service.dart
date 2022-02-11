import 'package:flutter/material.dart';

class AlertService {

static Future<bool> alert(String title,String message, BuildContext context) async {
   return await showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog(
            title: Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            content: Text(
              message,
            ),
            actions: <Widget>[
              TextButton(
                child: const Text("OK"),
                onPressed: () {
                  return Navigator.of(context).pop(true);
                },
              )
            ],
          );
        });
   }

}

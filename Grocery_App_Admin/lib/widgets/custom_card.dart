import 'dart:ui';
import 'package:flutter/material.dart';

Widget commoncard(
    {required String title,
    required int value,
    required Color color,
    required String image}) {
  return Card(
    color: color,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    child: Center(
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 45,
              backgroundColor: Colors.white.withOpacity(.4),
              child: Image.asset(
                image,
                height: 43,
                width: 43,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              "$value",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 30),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              title,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 23),
            ),
          ],
        ),
      ),
    ),
  );
}

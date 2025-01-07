

import 'package:flutter/material.dart';

Widget CommonCircle({required Color background, required String text,required String subtitle}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child:SizedBox(
      height: 160,
    child: Column(
      children: [
        Expanded(
          child: CircleAvatar(
            backgroundColor: background,
            radius: 30,
            child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 23,
              child: Center(
                child: Text(text),
              ),
            ),
          ),
        ),
        Expanded(child: Padding(padding: EdgeInsets.all(8),
          child: Text(subtitle,textAlign: TextAlign.center,),
        )),
      ],
    ),
    )
  );
}

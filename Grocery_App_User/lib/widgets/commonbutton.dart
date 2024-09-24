import 'package:flutter/material.dart';

Widget CommonButton({
  required void Function()? onPressed,
  required Widget text,
  required Color? backgroundcolor,
  required Color? foregroundcolor


}){
  return ElevatedButton(
      style: ElevatedButton.styleFrom(
        fixedSize: Size(350, 60),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12)
        ),
        backgroundColor: backgroundcolor,
        foregroundColor: foregroundcolor,
      ),
      onPressed: onPressed, child: text);
}
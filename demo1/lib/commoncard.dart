import 'package:flutter/material.dart';

Widget CommonCard(
    {required String model, required String time, required String address}) {
  return Card(
    shadowColor: Colors.grey,
    elevation: 3,
    child: Column(
      children: [
        Row(
          children: [
            Column(
              children: [
                Icon(Icons.motorcycle_outlined),
                Text(model),
                Text(time),
              ],
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(Icons.power_sharp, color: Colors.green),
                    SizedBox(
                      height: 20,
                    ),
                    Text("Power"),
                    Icon(Icons.power_sharp, color: Colors.green),
                    SizedBox(
                      height: 20,
                    ),
                    Text("Power"),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(Icons.power_sharp, color: Colors.green),
                    SizedBox(
                      height: 20,
                    ),
                    Text("Power"),
                    Icon(Icons.power_sharp, color: Colors.green),
                    SizedBox(
                      height: 20,
                    ),
                    Text("Power"),
                  ],
                ),
              ],
            )
          ],
        ),
        SizedBox(
          height: 10,
        ),
        ListTile(
          leading: Icon(Icons.location_on_outlined),
          title: Text(address),
        )
      ],
    ),
  );
}

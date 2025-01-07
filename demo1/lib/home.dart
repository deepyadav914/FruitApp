import 'package:demo1/commoncard.dart';
import 'package:demo1/commoncircle.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        leading: Icon(Icons.menu, color: Colors.white),
        title: Container(
          height: 32,
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: Colors.white),
          child: Text("  search"),
        ),
        actions: [
          Icon(Icons.notifications, color: Colors.white),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Icon(Icons.open_with_rounded),
          ),
        ],
      ),
      body: Expanded(
        flex: 2,
        child: Column(
          children: [
            Stack(
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      CommonCircle(
                          background: Colors.pink,
                          text: '285',
                          subtitle: 'Total Vehicle'),
                      CommonCircle(
                          background: Colors.orange,
                          text: '0',
                          subtitle: 'Over Speeding'),
                      CommonCircle(
                          background: Colors.orange,
                          text: '1',
                          subtitle: 'Moving'),
                      CommonCircle(
                          background: Colors.orange, text: '2', subtitle: 'Idle'),
                      CommonCircle(
                          background: Colors.orange,
                          text: '7',
                          subtitle: 'Stopped'),
                      CommonCircle(
                          background: Colors.orange,
                          text: '4',
                          subtitle: 'total'),
                      CommonCircle(
                          background: Colors.orange,
                          text: '8',
                          subtitle: 'title'),
                      CommonCircle(
                          background: Colors.orange, text: '9', subtitle: 'deep'),
                    ],
                  ),
                ),
              ],
            ),
            Expanded(
                flex: 8,
                child:
            CommonCard(model:"MARKON TESTING DEVICE 1" , time: "2024-06-26T14:33:27.89", address: "Yusuf Sarai Market,  Vasant Vihar Teshil,gdqiwduhdjhfshdcasdicuriqfobfasdajdscsdncmsdnnmasdfjsdhfieoriqieuroqwiefhdscskdncjksbdvjbvlsab")),
          ],
        ),
      ),
    );
  }
}

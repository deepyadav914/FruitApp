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
      body: Center(
        child:Padding(padding: const EdgeInsets.all(8),
        child: GridView.count(crossAxisCount: 2
        ,
        crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          childAspectRatio: 1/1.3,
          children:  [
            
          ],
        ),
        ),
      ),
    );
  }
}

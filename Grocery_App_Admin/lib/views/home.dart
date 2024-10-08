import 'dart:nativewrappers/_internal/vm/lib/core_patch.dart';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:fruit_app_admin/widgets/custom_card.dart';

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
        child: GridView.count(crossAxisCount: 2,
        // crossAxisSpacing: 8,
        //   mainAxisSpacing: 8,
        //   childAspectRatio: 1/1.3,
          children:  [
            InkWell(
              onTap: () {
                // Navigate to category list screen

              },
              child: commoncard(title: "Categories", value: 0, color: Colors.amber, image: ),
            ),
            

            
          ],
        ),
        ),
      ),
    );
  }

}

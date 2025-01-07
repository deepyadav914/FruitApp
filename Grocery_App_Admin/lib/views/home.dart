import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:fruit_app_admin/firebase/firebase_service.dart';
import 'package:fruit_app_admin/views/category_list.dart';
import 'package:fruit_app_admin/views/login.dart';
import 'package:fruit_app_admin/views/orders.dart';
import 'package:fruit_app_admin/views/product_list.dart';
import 'package:fruit_app_admin/views/users.dart';
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
      appBar: AppBar(
        title: Text("Dashborad"),
        centerTitle: true,
        backgroundColor: Colors.green,
        actions: [
          IconButton(
            onPressed: () {
              FirebaseServices().signOutAdmin();

              if (!context.mounted) return;
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => LoginScreen(),
                ),
                (route) => false,
              );
            },
            icon: Icon(Icons.logout_outlined),
          )
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            childAspectRatio: 1 / 1.2,
            children: [
              InkWell(
                onTap: () {
                  // Navigate to category list screen
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CategoryListScreen(),
                      ));
                },
                child: commoncard(
                    title: "Categories",
                    value: 0,
                    color: Colors.amber.shade400,
                    image: "assets/images/category.png"),
              ),
              InkWell(
                onTap: () {
                  // Navigate to Product List screen
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductListScreen(),
                      ));
                },
                child: commoncard(
                    title: "Products",
                    value: 0,
                    color: Colors.blue.shade400,
                    image: "assets/images/products.png"),
              ),
              InkWell(
                onTap: () {
                  // Navigate to Users screen
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UsersScreen(),
                      ));
                },
                child: commoncard(
                    title: "User",
                    value: 0,
                    color: Colors.pinkAccent.shade400,
                    image: "assets/images/user.png"),
              ),
              InkWell(
                onTap: () {
                  // Navigate to orders Screen
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => OrdersScreen(),
                      ));
                },
                child: commoncard(
                    title: "Order",
                    value: 0,
                    color: Colors.purple.shade400,
                    image: "assets/images/orders.png"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

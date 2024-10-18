import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fruit_app_admin/model/category.dart';
import 'package:fruit_app_admin/widgets/custom_buttton.dart';
import 'package:image_picker/image_picker.dart';

class CategoryManageListScreen extends StatefulWidget {
  CategoryModel? categoryModel;

  CategoryManageListScreen({super.key, this.categoryModel});

  @override
  State<CategoryManageListScreen> createState() =>
      _CategoryManageListScreenState();
}

class _CategoryManageListScreenState extends State<CategoryManageListScreen> {
  final formkey = GlobalKey<FormState>();
  XFile? newImage;
  final CategoryName = TextEditingController();
  final CategoryDesc = TextEditingController();
  bool isLoading = false;
  String? existingImageUrl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Category Manage Screen"),
        backgroundColor: Colors.amber.shade400,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Form(
            key: formkey,
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {},
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage:
                        existingImageUrl != null && newImage == null
                            ? NetworkImage(existingImageUrl!)
                            : newImage != null
                                ? FileImage(
                                    File(newImage!.path),
                                  )
                                : AssetImage("assets/images/logo.png")
                                    as ImageProvider,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      border: null, labelText: "Enter Category Name"),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      border: null, labelText: "Enter Category Description"),
                ),
                SizedBox(
                  height: 50,
                ),
                CustomButtton(
                    title: "Add Category",
                    backgroundColor: Colors.amber,
                    foregroundColor: Colors.white,
                    callback: () {},
                    isLoading: isLoading)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

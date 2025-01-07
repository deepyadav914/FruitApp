import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fruit_app_admin/firebase/firebase_service.dart';
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
  @override
  void initState() {
    if (widget.categoryModel != null) {
      categoryName.text = widget.categoryModel!.name;
      categoryDesc.text = widget.categoryModel!.description;
      existingImageUrl = widget.categoryModel!.imageUrl;
    }
    super.initState();
  }

  final _formkey = GlobalKey<FormState>();
  XFile? newImage;
  final categoryName = TextEditingController();
  final categoryDesc = TextEditingController();
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
            key: _formkey,
            child: Column(
              children: [
                GestureDetector(
                  onTap: () async {
                    await pickImage();
                  },
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
                  controller: categoryName,
                  decoration: InputDecoration(
                      border: null, labelText: "Enter Category Name"),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: categoryDesc,
                  maxLines: 3,
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
                    callback: () {
                      addCategory(
                          categoryName: categoryName.text.toString(),
                          categoryDesc: categoryDesc.text.toString(),
                          image: newImage);
                    },
                    isLoading: isLoading)
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        newImage = image;
        log(newImage!.path);
      });
    }
  }

  Future<void> addCategory(
      {required String categoryName,
      required String categoryDesc,
      required XFile? image}) async {
    await FirebaseServices().addCategoryInDataBase(
        context: context,
        categoryName: categoryName,
        categoryDesc: categoryDesc,
        image: newImage,
        categoryId: widget.categoryModel?.id,
        createdAt: widget.categoryModel?.createdAt,
        existingImageurl: widget.categoryModel?.imageUrl);
  }
}

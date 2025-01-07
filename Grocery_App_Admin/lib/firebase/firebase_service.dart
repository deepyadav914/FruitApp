import 'dart:developer';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:fruit_app_admin/model/category.dart';
import 'package:image_picker/image_picker.dart';

class FirebaseServices {
  static FirebaseServices instance = FirebaseServices.named();

  FirebaseServices.named();

  factory FirebaseServices() {
    return instance;
  }

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseDatabase _firebaseDatabase = FirebaseDatabase.instance;
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;

  // SignIn  with email password
  Future<User?> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final credential = await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return credential.user;
    } on FirebaseAuthException {
      rethrow;
    }
  }

  Future<void> signOutAdmin() async {
    await _firebaseAuth.signOut();
  }

  //  Add Category In DataBase
  Future<void> addCategoryInDataBase({
    String? categoryName,
    String? categoryDesc,
    XFile? image,
    int? createdAt,
    String? categoryId,
    String? existingImageurl,
    required BuildContext context,
  }) async {
    int? timeStamp = createdAt ?? DateTime.now().millisecondsSinceEpoch;
    String? newImageUrl;
    newImageUrl = existingImageurl ?? "";

    if (image != null) {
      String? filename = "${DateTime.now().millisecondsSinceEpoch}.png";
      File imageFile = File(image.path);
      TaskSnapshot snapshot = await _firebaseStorage
          .ref()
          .child("category")
          .child(filename)
          .putFile(imageFile);

      newImageUrl = await snapshot.ref.getDownloadURL();
    }

    //  upload all category data into real time database

    CategoryModel category = CategoryModel(
        name: categoryName!,
        description: categoryDesc!,
        imageUrl: newImageUrl,
        isActive: true,
        createdAt: timeStamp,
        id: categoryId);

    if(category.id==null){
      String? newIdGenerate= _firebaseDatabase.ref().child("category").push().key;

      category.id=newIdGenerate;

      await _firebaseDatabase.ref().child("category").child(newIdGenerate!).set(category.toJson()) ;

      Navigator.pop(context);

    }else{
      _firebaseDatabase
      .ref()
          .child("category").child(categoryId!).update(category.toJson());

      Navigator.pop(context);
    }
  }

  //  get all category data from database.

}

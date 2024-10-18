import 'package:flutter/material.dart';
import 'package:fruit_app_admin/views/category_manage_list.dart';

class CategoryListScreen extends StatefulWidget {
  const CategoryListScreen({super.key});

  @override
  State<CategoryListScreen> createState() => _CategoryListScreenState();
}

class _CategoryListScreenState extends State<CategoryListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Categorys List Screen"),
        backgroundColor: Colors.amber.shade400,
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Card(
          child: ListTile(
            leading: CircleAvatar(
              radius: 14,
              child: Image.asset("assets/images/user.png"),
            ),
            title: Column(
              children: [
                Text("name"),
                Text("desc"),
              ],
            ),
            trailing: IconButton(onPressed: () {}, icon: Icon(Icons.delete)),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CategoryManageListScreen(),
              ));
        },
        backgroundColor: Colors.amber.shade400,
        child: Icon(Icons.add),
      ),
    );
  }
}

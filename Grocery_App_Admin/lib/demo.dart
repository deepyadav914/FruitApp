import 'package:flutter/material.dart';
import 'package:fruit_app_admin/Custome.dart';

class DemoScreen extends StatefulWidget {
  const DemoScreen({super.key});

  @override
  State<DemoScreen> createState() => _DemoScreenState();
}

class _DemoScreenState extends State<DemoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        
          leading: Icon(Icons.menu,color: Colors.white,),
        title: Container(
          height: 30,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),

            color: Colors.white
        ),
          child: Text("  Search",style: TextStyle(
            color: Colors.grey.shade700
          ),),
        ),

        actions: [
          Icon(Icons.notifications,color: Colors.white,),

          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Icon(Icons.open_with_outlined),
          ),

        ],
        
        
        
      ),
      body: Stack(
        children: [
          Row(
            children: [

            ],
          )
        ],


      )

      ,
    );
  }
}

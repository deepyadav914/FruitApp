import 'package:flutter/material.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {

  final formkey = GlobalKey();
  bool isvisibility=false;
  bool isloading=false;

  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordcontroller =TextEditingController();

  void togglechnage(){
    setState(() {
      isvisibility=!isvisibility;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: formkey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(image: AssetImage("assets/images/signin.png")),
            Padding(
              padding: const EdgeInsets.only(left: 15, top: 5),
              child: Text(
                "Get your grocereis\nwith nectar",
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: TextFormField(
                validator: (value) {

                },
                controller: emailcontroller,
                decoration: InputDecoration(
                    hintText: "E-mail",
                    suffixIcon: Icon(Icons.mail_outline),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: TextFormField(
                validator: (value) {},
                controller: passwordcontroller,
                decoration: InputDecoration(
                    hintText: "Password",
                    suffixIcon: isvisibility?
                        IconButton(onPressed: togglechnage,
                    icon: Icon(Icons.visibility)):
                        IconButton(onPressed: togglechnage, icon: Icon(Icons.visibility_off)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)
                  ),
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.green.shade800,
                  fixedSize: Size(400, 55)
                ),
                  onPressed: () {
                  
                  },
                  child: Text(
                    "SignIn",
                    style: TextStyle(fontSize: 20,letterSpacing: 1.5),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}

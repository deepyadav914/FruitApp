import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fruit_app_admin/firebase/firebase_service.dart';
import 'package:fruit_app_admin/views/home.dart';
import '../widgets/custom_buttton.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          child: const Stack(
            children: [
              SizedBox(
                child: Image(
                  image: AssetImage("assets/images/bg.png"),
                  fit: BoxFit.fill,
                ),
                height: double.infinity,
                width: double.infinity,
              ),
              Center(
                child: LoginForm(),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formkey = GlobalKey<FormState>();
  bool isvisibility = false;
  bool isloading = false;

  final emailcontroller = TextEditingController();
  final passwordcontroller = TextEditingController();

  void toggleChange() {
    setState(() {
      isvisibility = !isvisibility;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Form(
          key: _formkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image(image: AssetImage("assets/images/logo.png")),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Get your grocereis\nwith nectar",
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.w600),
              ),

              Text(
                "Enter your email and password",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),

              SizedBox(
                height: 20,
              ),
              TextFormField(
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "Enter vaild Email";
                  } else {
                    return null;
                  }
                },
                keyboardType: TextInputType.emailAddress,
                controller: emailcontroller,
                decoration: InputDecoration(
                    hintText: "E-mail",
                    suffixIcon: const Icon(Icons.mail_outline),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    )),
              ),

              SizedBox(
                height: 20,
              ),

              TextFormField(
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "Enter vaild Password";
                  } else {
                    return null;
                  }
                },
                keyboardType: TextInputType.visiblePassword,
                controller: passwordcontroller,
                obscureText: isvisibility,
                decoration: InputDecoration(
                    hintText: "Password",
                    suffixIcon: isvisibility
                        ? IconButton(
                            onPressed: toggleChange,
                            icon: const Icon(Icons.visibility))
                        : IconButton(
                            onPressed: toggleChange,
                            icon: const Icon(Icons.visibility_off)),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15))),
              ),
              SizedBox(
                height: 40,
              ),
              CustomButtton(
                title: 'Login',
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                callback: () async {
                 await signInCheck(email: emailcontroller.text.toString(), password: passwordcontroller.text.toString());

                },
                isLoading: isloading,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> signInCheck(
      {required String email, required String password}) async {
    if (_formkey.currentState!.validate()) {
      setState(() {
        isloading = true;
      });

      try {
        final user = await FirebaseServices()
            .signInWithEmailAndPassword(email: email, password: password);

        if (user != null) {
          if (kDebugMode) {
            log(user.uid);
            log(user.email.toString());
          }

          if (!mounted) return;
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => HomeScreen(),
            ),
            (route) => false,
          );
        }
      } catch (e) {
        log(e.toString());
      } finally {
        setState(() {
          isloading = false;
        });
      }
    }
  }
}

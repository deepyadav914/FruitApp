import 'package:flutter/material.dart';
import 'package:fruit_app/widgets/commonbutton.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/onboarding.png"),
                    fit: BoxFit.fill)),
          ),
          Column(
            children: [
              Expanded(flex: 5, child: SizedBox()),
              Expanded(
                flex: 5,
                child: Container(
                  height: double.infinity,
                  width: double.infinity,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 40),
                        child: Image(image: AssetImage("assets/logo.png")),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 15,bottom: 0),
                        child: Text("   Welcome \n to our store",style: TextStyle(
                          color: Colors.white,
                          fontSize: 45,
                          fontWeight: FontWeight.w500
                        ),),
                      ),
                      Text("Get your groceries in as fast as one hour",style: TextStyle(
                        color: Colors.white,fontSize: 18,
                      ),),

                      Padding(
                        padding: const EdgeInsets.only(top: 30),
                        child: CommonButton(onPressed: () {

                        }, text: Text("Get Started",style: TextStyle(
                          fontSize: 18
                        ),), backgroundcolor: Colors.green.shade800, foregroundcolor: Colors.white  ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:sneaker_app/Router/router.gr.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({super.key});

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey[300],
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            height: 30,
          ),

          Container(
            width: w,
            color: Colors.transparent,
            child: const Text(
              "Change Your\nPerspective ln Style",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 35,
                height: 1.3,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Container(
            width: w,
            color: Colors.transparent,
            child: const Text(
              "Change The Quality Of Your Appearance\n Wear Your Heart On Your Feet! ",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                height: 1.8,
                color: Colors.grey,
              ),
            ),
          ),
          //  Image.asset("assets/image/kicks.png",height: 70,),
          const SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 80),
            child: Image.asset(
              "assets/image/shoes.png",
              height: 250,
            ),
          ),
          const SizedBox(height: 100),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: SizedBox(
              height: 50,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  context.router.push(const LoginRoute());
                },
                style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.black)),
                child: const Text(
                  "Shop Now",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ),
        ],
      )),
    );
  }
}

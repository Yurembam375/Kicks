// ignore_for_file: use_build_context_synchronously

import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:sneaker_app/Router/router.gr.dart';

import 'package:sneaker_app/widgets/squareTile.dart';

import '../../../core/cubit/authflow_cubit.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isVisible = false;

  final _formKey = GlobalKey<FormState>();

  Future signin() async {
    EasyLoading.show(status: "Please wait");
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      )
          .whenComplete(() async {
        EasyLoading.showSuccess("Login Sucessfull");

        final SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setBool("accountStatus", true);
      });
    } on FirebaseAuthException catch (e) {
      EasyLoading.showError(e.code);
      // if (e.code == "user-not-found") {
      //   errorEmail();
      // } else {
      //   if (e.code == "wrong-password") {
      //     errorPassword();
      //   }
      // }
    }
  }

  void errorPassword() {
    showDialog(
      context: context,
      builder: (context) {
        return const Text("Wrong Password");
      },
    );
  }

  void errorEmail() {
    showDialog(
      context: context,
      builder: (context) {
        return const Text("Wrong Email");
      },
    );
  }

  @override
  void initState() {
    initial();
    super.initState();
  }

  initial() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("accountStatus", false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.grey[100],
        body: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 25,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  Image.asset(
                    "assets/image/kicks.png",
                    height: 70,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 68),
                    child: Row(
                      children: [
                        Text(
                          "Get Your Favorite Sneakers!",
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 1),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "LOGIN",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 23,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 1),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Please Sign Up To Continue",
                          style: TextStyle(
                            color: Colors.grey[700],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please Fill up The Form";
                            }
                            return null;
                          },
                          controller: emailController,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                              color: Colors.grey.shade400,
                            )),
                            fillColor: Colors.grey[200],
                            filled: true,
                            prefixIcon:
                                const Icon(Icons.email, color: Colors.grey),
                            hintText: "Email",
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please Fill Up  The Form";
                            }
                            return null;
                          },
                          controller: passwordController,
                          obscureText: !isVisible,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                              color: Colors.grey.shade400,
                            )),
                            fillColor: Colors.grey[200],
                            filled: true,
                            prefixIcon:
                                const Icon(Icons.lock, color: Colors.grey),
                            hintText: "Password",
                            suffixIcon: isVisible
                                ? IconButton(
                                    onPressed: () {
                                      setState(() {
                                        isVisible = !isVisible;
                                      });
                                    },
                                    icon: const Icon(
                                      Icons.visibility,
                                      color: Colors.grey,
                                    ))
                                : IconButton(
                                    onPressed: () {
                                      setState(() {
                                        isVisible = !isVisible;
                                      });
                                    },
                                    icon: const Icon(
                                      Icons.visibility_off,
                                      color: Colors.grey,
                                    )),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                              onPressed: () {
                                context.router
                                    .push(const ForgotPasswordRoute());
                              },
                              child: const Text(
                                "Forgot Password?",
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        SizedBox(
                          height: 50,
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                await FirebaseAuth.instance
                                    .signInWithEmailAndPassword(
                                  email: emailController.text.trim(),
                                  password: passwordController.text.trim(),
                                )
                                    .whenComplete(() async {
                                  final SharedPreferences prefs =
                                      await SharedPreferences.getInstance();
                                  await prefs
                                      .setBool("accountStatus", true)
                                      .then((value) => context
                                          .read<AuthflowCubit>()
                                          .authFw());
                                });
                              } else {
                                EasyLoading.showError("Pless fill up The Form");
                              }
                            },
                            style: const ButtonStyle(
                                backgroundColor:
                                    WidgetStatePropertyAll(Colors.black)),
                            child: const Text(
                              "LOGIN",
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Divider(
                            thickness: 0.5,
                            color: Colors.grey[400],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          child: Text(
                            'Or continue with',
                            style: TextStyle(color: Colors.grey[700]),
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            thickness: 0.5,
                            color: Colors.grey[400],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  const SquareTile(imagePath: "assets/image/google3.png"),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't Have Account ? -",
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                      TextButton(
                        onPressed: () {
                          // log("message");
                          context.router.push(const SignupRoute());
                        },
                        child: const Text(
                          "Sign Up",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

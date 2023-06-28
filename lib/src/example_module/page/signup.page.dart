import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sneaker_app/Router/router.gr.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  final passwordController2 = TextEditingController();

  bool obscureText = false;
  bool obscureText1 = false;

  Future createAccount() async {
    EasyLoading.show(status: "Please wait");
    if (passwordConfirmed()) {
      try {
        await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
        )
            .then((user) {
          EasyLoading.showSuccess("Account Created...");
         saveUser();
        });
        //     .whenComplete(() async {
        //   SharedPreferences sp = await SharedPreferences.getInstance();
        //   EasyLoading.showSuccess(
        //       "Account Created...");
        //   await sp
        //       .setBool("accountStatus", false).then((value) => context.router.replace(const AuthFlowpage()));

        // });
      } on FirebaseAuthException catch (e) {
        if (e.code == "weak-password") {
          EasyLoading.showError(e.code);
        } else if (e.code == "email-alredy-in-use") {
          EasyLoading.showError(e.code);
        }
      } catch (e) {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("$e"),
            );
          },
        );
      }
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(
            title: Text("Password does not Match"),
          );
        },
      );
    }
  }

 // Obtain shared preferences.
  Future<void> saveUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setString('email', emailController.text);
    await prefs.setBool("accountStatus", false);
    //  var status =  prefs.getBool("accountStatus");

    //  EasyLoading.show(status: status.toString());
    // ignore: use_build_context_synchronously
    context.router.replace(const AuthFlowpage());
  }

  clearSp() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
    EasyLoading.dismiss();
  }

  bool passwordConfirmed() {
    if (passwordController.text.trim() == passwordController2.text.trim()) {
      return true;
    } else {
      return false;
    }
  }

  @override
  void dispose() {
    passwordController.clear();
    passwordController2.clear();
    emailController.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey[100],
      body: SingleChildScrollView(
        child: SafeArea(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 1),
                child: Row(
                  children: const [
                    Text("CREATE A NEW ACCOUNT",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 23,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 1),
                child: Row(
                  children: [
                    Text(
                      "Few More Steps To Your Account",
                      style: TextStyle(
                        color: Colors.grey[700],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
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
                        prefixIcon: const Icon(Icons.email, color: Colors.grey),
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
                      obscureText: !obscureText,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                          color: Colors.grey.shade400,
                        )),
                        fillColor: Colors.grey[200],
                        filled: true,
                        prefixIcon: const Icon(Icons.lock, color: Colors.grey),
                        hintText: "Password",
                        suffixIcon: obscureText
                            ? IconButton(
                                onPressed: () {
                                  setState(() {
                                    obscureText = !obscureText;
                                  });
                                },
                                icon: const Icon(
                                  Icons.visibility,
                                  color: Colors.grey,
                                ))
                            : IconButton(
                                onPressed: () {
                                  setState(() {
                                    obscureText = !obscureText;
                                  });
                                },
                                icon: const Icon(
                                  Icons.visibility_off,
                                  color: Colors.grey,
                                )),
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
                      controller: passwordController2,
                      obscureText: !obscureText1,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                          color: Colors.grey.shade400,
                        )),
                        fillColor: Colors.grey[200],
                        filled: true,
                        prefixIcon: const Icon(Icons.lock, color: Colors.grey),
                        hintText: "Comfrim Password",
                        suffixIcon: obscureText1
                            ? IconButton(
                                onPressed: () {
                                  setState(() {
                                    obscureText1 = !obscureText1;
                                  });
                                },
                                icon: const Icon(
                                  Icons.visibility,
                                  color: Colors.grey,
                                ))
                            : IconButton(
                                onPressed: () {
                                  setState(() {
                                    obscureText1 = !obscureText1;
                                  });
                                },
                                icon: const Icon(
                                  Icons.visibility_off,
                                  color: Colors.grey,
                                )),
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () async {
                          // clearSp();
                          if (_formKey.currentState!.validate()) {
                            // context.router.push(const SignupRoute());
                            createAccount();
                          } else {
                            EasyLoading.showError("Pless fill up The Form");
                          }
                        },
                        style: const ButtonStyle(
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.black)),
                        child: const Text(
                          "SIGN UP",
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "If You Already Have An Account? -",
                    style: TextStyle(
                      color: Colors.grey[700],
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      context.router.pop(const SignupRoute());
                    },
                    child: const Text(
                      "Sign in",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ],
              )
            ],
          ),
        )),
      ),
    );
  }
}

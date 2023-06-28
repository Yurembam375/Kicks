import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sneaker_app/core/cubit/authflow_cubit.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String? email;
  @override
  void initState() {
    // TODO: implement initState
    getUser();
    super.initState();
  }

  getUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    email = prefs.getString('email');
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Center(
          child: Text(
            "Profile",
            style: TextStyle(color: Colors.black, fontSize:15,fontWeight: FontWeight.bold),
          ),
        ),
        backgroundColor: Colors.grey[100],
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
              child: Center(
                child: Column(children: [
                  Stack(
                    children: [
                      SizedBox(
                        width: 120,
                        height: 120,
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: Colors.white,
                              border: Border.all(color: Colors.black)),
                          child: const Image(
                            image: AssetImage("assets/image/jordan.png"),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          width: 35,
                          height: 35,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Colors.black,
                          ),
                          child: const Icon(
                            CupertinoIcons.camera,
                            size: 20.0,
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 10),
                  Text(
                    email ?? '',
                    style: const TextStyle(color: Colors.black, fontSize: 15),
                  ),
                 // const SizedBox(height: 10),
                  // const Text(
                  //   "Password",style: TextStyle(color: Colors.black,fontSize: 15),
                  // ),
                 // const SizedBox(height: 20),
                  SizedBox(
                    width: 200,
                    child: ElevatedButton(
                      onPressed: () {
                        // context.router.push(const UpdateProfileRoute());
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        side: BorderSide.none,
                        shape: const StadiumBorder(),
                      ),
                      child: const Text(
                        "Edit Profile",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ]),
              ),
            ),
            const SizedBox(height: 5),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceAround,
            //   children: [
            //     Container(
            //       decoration:
            //           BoxDecoration(border: Border.all(color: Colors.black)),
            //       height: 35,
            //       width: 160,
            //       child: MaterialButton(
            //         animationDuration: const Duration(milliseconds: 3),
            //         highlightColor: Colors.grey,
            //         splashColor: Colors.grey,
            //         onPressed: () {},
            //         child: Row(
            //           mainAxisAlignment: MainAxisAlignment.center,
            //           children: const [
                      
            //             Text("Your Order")
            //           ],
            //         ),
            //       ),
            //     ),
            //     Container(
            //       decoration: BoxDecoration(
            //           color: Colors.redAccent,
            //           border: Border.all(color: Colors.redAccent)),
            //       height: 35,
            //       width: 160,
            //       child: MaterialButton(
            //         animationDuration: const Duration(milliseconds: 3),

            //         highlightColor: Colors.white,
            //         splashColor: Colors.redAccent,
            //         //
            //         onPressed: () {},
            //         child: Row(
            //           mainAxisAlignment: MainAxisAlignment.center,
            //           children: const [
            //             Icon(
            //               CupertinoIcons.bag,
            //               color: Colors.white,
            //               size: 17,
            //             ),
            //             Text(
            //               "   Buy Again",
            //               style: TextStyle(color: Colors.white),
            //             )
            //           ],
            //         ),
            //       ),
            //     )
            //   ],
            // ),
              ListTile(
              leading: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.done_rounded,
                  color: Colors.black,
                ),
              ),
              title:
                  const Text("Your Oder", style: TextStyle(color: Colors.black)),
            ),  ListTile(
              leading: IconButton(
                onPressed: () {},
                icon: const Icon(
                  CupertinoIcons.bag,
                  color: Colors.black,
                ),
              ),
              title:
                  const Text("Buy Again", style: TextStyle(color: Colors.black)),
            ),
            ListTile(
              leading: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.settings,
                  color: Colors.black,
                ),
              ),
              title:
                  const Text("Setting", style: TextStyle(color: Colors.black)),
            ),
            ListTile(
              leading: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.error_outline_rounded,
                  color: Colors.black,
                ),
              ),
              title: const Text("About", style: TextStyle(color: Colors.black)),
            ),
            ListTile(
              leading: IconButton(
                onPressed: () {
                  //  signout();
                },
                icon: const Icon(
                  Icons.message_outlined,
                  color: Colors.black,
                ),
              ),
              title: const Text("Feed Back",
                  style: TextStyle(color: Colors.black)),
            ),
            ListTile(
              leading: IconButton(
                onPressed: () {
                  //  signout();
                },
                icon: const Icon(
                  Icons.call,
                  color: Colors.black,
                ),
              ),
              title: const Text("Help Center",
                  style: TextStyle(color: Colors.black)),
            ),
            ListTile(
              leading: IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text("Log out of your account?"),
                      actions: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text(
                                  "No",
                                  style: TextStyle(color: Colors.black),
                                )),
                            TextButton(
                              onPressed: () {
                                context
                                    .read<AuthflowCubit>()
                                    .signOut()
                                    .then((value) => Navigator.pop(context));
                              },
                              child: const Text(
                                "Log Out",
                                style: TextStyle(color: Colors.red),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  );
                },
                icon: const Icon(
                  Icons.logout,
                  color: Colors.black,
                ),
              ),
              title:
                  const Text("Log out", style: TextStyle(color: Colors.black)),
            ),
          ],
        ),
      ),
    );
  }
}

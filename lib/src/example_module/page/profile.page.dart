import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Center(
          child: Text(
            "Profile",
            style: TextStyle(color: Colors.black, fontSize: 23),
          ),
        ),
        backgroundColor: Colors.grey[100],
        elevation: 0,
      ),
      body: SingleChildScrollView(  
        child: Column(
          children: [
            Padding(
              padding:  const EdgeInsets.fromLTRB(0,40,0,0),
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
                          border: Border.all(color: Colors.black)
                          ),
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
                  const Text(
                   "tomtomyurembam@gmail.com",style: TextStyle(color: Colors.black,fontSize: 15),
                  ),
                  const SizedBox(height: 10),
                  // const Text(
                  //   "Password",style: TextStyle(color: Colors.black,fontSize: 15),
                  // ),
                  const SizedBox(height: 20),
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
             const SizedBox(height: 20),
                  ListTile(
                    leading: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.settings,
                        color: Colors.black,
                      ),
                    ),

                    title: const Text("Setting",
                        style: TextStyle(color: Colors.black)),
                  ),
                  ListTile(
                    leading: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.error_outline_rounded,
                        color: Colors.black,
                      ),
                    ),
                    title: const Text("About",
                        style: TextStyle(color: Colors.black)),
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
                      //  signout();
                      },
                      icon: const Icon(
                        Icons.logout,
                        color: Colors.black,
                      ),
                    ),
                    title: const Text("Log out",
                        style: TextStyle(color: Colors.black)),
                  ),
          ],
        ),
        
      ),
    );
  }
}

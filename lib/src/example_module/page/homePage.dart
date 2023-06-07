import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sneaker_app/Utility/logger.dart';
import 'package:sneaker_app/core/cubit/authflow_cubit.dart';
import 'package:sneaker_app/model/search.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({super.key});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {

//   int _currentPage = 0;
//   @override
//   void initState() {
//     super.initState();
//   //  autoscroll();
//   }

//   void autoscroll(){
//  Timer.periodic(const Duration(seconds: 5), (Timer timer) {
//       Future.delayed(const Duration(seconds: 5), () {

//         setState(() {
//           if (_currentPage < 2) {
//             _currentPage++;
//           } else {
//             _currentPage = 0;
//           }
//           _controller.animateToPage(_currentPage,
//               duration: const Duration(milliseconds: 350),
//               curve: Curves.easeIn);
//         });
//       });
//     });
//   }

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final CollectionReference users =
      FirebaseFirestore.instance.collection('kicks');

  @override
  Widget build(BuildContext context) {
    final controller = PageController(initialPage: 0);
    return Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.black),
          elevation: 0,
          backgroundColor: Colors.grey[100],
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      showSearch(
                          context: context, delegate: MySearchDelegate());
                    },
                    icon: const Icon(
                      Icons.search,
                      color: Colors.black,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.favorite,
                      color: Colors.black,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.notifications,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
        drawer: Drawer(
          backgroundColor: Colors.grey[100],
          child: ListView(
            children: [
              DrawerHeader(
                child: Image.asset(
                  "assets/image/kicks.png",
                  height: 5,
                ),
              ),
              ListTile(
                leading: IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        actions: [
                          ElevatedButton(
                              onPressed: () {
                                context
                                    .read<AuthflowCubit>()
                                    .signOut()
                                    .then((value) => Navigator.pop(context));
                              },
                              child: const Text("data"))
                        ],
                      ),
                    );
                  },
                  icon: const Icon(
                    Icons.logout,
                    color: Colors.black,
                  ),
                ),
                title: const Text("Log out",
                    style: TextStyle(color: Colors.black, fontSize: 15)),
              )
            ],
          ),
        ),
        body: const ShoeWidget()
// body: SafeArea(
//           child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 10),
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const Text(
//                 "Top Brands",
//                 style: TextStyle(
//                   color: Colors.black,
//                   fontSize: 20,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               const SizedBox(
//                 height: 5,
//               ),
//               FadeInUp(
//                 delay: const Duration(milliseconds: 45),
//                 child: SizedBox(
//                   height: 110,
//                   width: double.infinity,
//                   child: ListView.builder(
//                     shrinkWrap: true,
//                     scrollDirection: Axis.horizontal,
//                     physics: const BouncingScrollPhysics(),
//                     itemCount: categories.length,
//                     itemBuilder: (context, index) {
//                       CategoriesModel current = categories[index];
//                       return Padding(
//                         padding: const EdgeInsets.all(10),
//                         child: Column(
//                           children: [
//                             CircleAvatar(
//                               radius: 30,
//                               backgroundColor: Colors.grey[200],
//                               child: Padding(
//                                 padding: const EdgeInsets.all(10.0),
//                                 child: Image.asset(
//                                   current.imgUrl,
//                                   // color: Colors.white,
//                                 ),
//                               ),
//                             ),
//                             const SizedBox(
//                               height: 5,
//                             ),
//                             Text(
//                               current.tittle,
//                               style: const TextStyle(
//                                   fontSize: 15, fontWeight: FontWeight.bold),
//                             )
//                           ],
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//               ),
//               FadeInUp(
//                 delay: const Duration(milliseconds: 45),
//                 child: SizedBox(
//                   width: double.infinity,
//                   height: 150,
//                   child: PageView.builder(
//                     controller: controller,
//                     physics: const BouncingScrollPhysics(),
//                     scrollDirection: Axis.horizontal,
//                     //shrinkWrap: true,
//                     itemCount: 3,
//                     itemBuilder: (context, index) {
//                       BaseModel data = sneakerList[index];
//                       return Container(
//                         height: 140,
//                         padding: const EdgeInsets.all(10),
//                         child: Column(children: [
//                           Stack(
//                             alignment: Alignment.center,
//                             fit: StackFit.loose,
//                             clipBehavior: Clip.hardEdge,
//                             children: [
//                               Container(
//                                 height: 130,
//                                 width: double.infinity,
//                                 decoration: BoxDecoration(
//                                   gradient: gradient[index],
//                                   borderRadius: BorderRadius.circular(20),
//                                 ),
//                               ),
//                               Positioned(
//                                 top: 5,
//                                 left: 50,
//                                 child: RotationTransition(
//                                   turns:
//                                       const AlwaysStoppedAnimation(-25 / 360),
//                                   child: Image.asset(
//                                     data.imageUrl,
//                                     width: 300,
//                                     height: 120,
//                                     // fit: BoxFit.cover,
//                                   ),
//                                 ),
//                               ),
//                               Positioned(
//                                 top: 5,
//                                 left: 10,
//                                 child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: const [
//                                     Text(
//                                       "TODAY ONLY",
//                                       style: TextStyle(
//                                         fontSize: 10,
//                                         fontWeight: FontWeight.bold,
//                                         color: Colors.white70,
//                                       ),
//                                     ),
//                                     Text(
//                                       "80% OFF\nWITH CODE:",
//                                       style: TextStyle(
//                                         fontSize: 22,
//                                         height: 1.3,
//                                         fontWeight: FontWeight.bold,
//                                         color: Colors.white,
//                                       ),
//                                     )
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ]),
//                       );
//                     },
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 142),
//                 child: SmoothPageIndicator(
//                   controller: controller,
//                   count: 3,
//                   effect: SwapEffect(
//                       activeDotColor: Colors.grey.shade700,
//                       dotHeight: 10,
//                       dotWidth: 10,
//                       dotColor: Colors.grey.withOpacity(0.5)),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 15),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     const Text(
//                       "Hot Picks🔥",
//                       style: TextStyle(
//                         color: Colors.black,
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     TextButton(onPressed: () {}, child: const Text("See all"))
//                   ],
//                 ),
//               ),
//               const SizedBox(
//                 height: 5,
//               ),
//               FadeInUp(
//                 delay: const Duration(milliseconds: 45),
//                 child: GridView.builder(
//                   physics: const BouncingScrollPhysics(),
//                   primary: false,
//                   itemCount: sneakerList.length,
//                   shrinkWrap: true,
//                   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                       mainAxisSpacing: 10, crossAxisCount: 2),
//                   itemBuilder: (context, index) {
//                     BaseModel data = sneakerList[index];

//                     return GestureDetector(
//                       onTap: () {
//                         context.router.push(DetailsRoute(data: data));
//                       },
//                       child: Column(
//                         children: [
//                           ClipRRect(
//                             borderRadius: BorderRadius.circular(10),
//                             child: Stack(
//                               alignment: Alignment.center,
//                               clipBehavior: Clip.hardEdge,
//                               fit: StackFit.loose,
//                               children: [
//                                 SizedBox(
//                                   height: 170,
//                                   width: 150,
//                                   child: Card(
//                                     color: Colors.grey[200],
//                                     child: RotationTransition(
//                                       turns: const AlwaysStoppedAnimation(
//                                           -25 / 360),
//                                       child: Image.asset(
//                                         data.imageUrl,
//                                         width: 150,
//                                         height: 100,
//                                         // fit: BoxFit.cover,
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                                 Positioned(
//                                   top: 4,
//                                   left: 5,
//                                   child: Text(
//                                     data.name,
//                                     style: const TextStyle(
//                                         color: Colors.black,
//                                         fontWeight: FontWeight.bold,
//                                         fontSize: 15),
//                                   ),
//                                 ),
//                                 Positioned(
//                                   bottom: 4,
//                                   left: 10,
//                                   child: Text(
//                                     "\$${data.price.toString()}",
//                                     style: const TextStyle(
//                                         color: Colors.black,
//                                         fontWeight: FontWeight.bold,
//                                         fontSize: 15),
//                                   ),
//                                 ),
//                                 Positioned(
//                                   bottom: -6,
//                                   right: 1,
//                                   child: ClipRRect(
//                                     borderRadius: const BorderRadius.only(
//                                         topLeft: Radius.circular(4)),
//                                     child: IconButton(
//                                       onPressed: () {
//                                         EasyLoading.showSuccess(
//                                           "Add to Cart",
//                                         );
//                                       },
//                                       icon: const Icon(
//                                         CupertinoIcons.shopping_cart,
//                                         // color: Colors.white,
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                                 const Positioned(
//                                     top: 5, right: 5, child: FavBotton())
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     );
//                   },
//                 ),
//               )
//             ],
//           ),
//         ),
//       )),
        );
  }
}

class ShoeWidget extends StatelessWidget {
  const ShoeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection("kicks").snapshots(),
      builder: (context,
          AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
        if (snapshot.data == null) {
          return const CircularProgressIndicator.adaptive();
        } else {
          List<Map<String, dynamic>> d =
              snapshot.data!.docs.map((e) {
                logger.e(e.id);
                return e.data();
              }).toList();
          return ListView.builder(
            itemCount: d.length,
            itemBuilder: (context, i) {
              return ListView.builder(
                shrinkWrap: true,
                itemCount: d[i]["shoes"].length,
                itemBuilder: (context, j) {
                  var p = d[i]["shoes"];
                  return ListTile(
                    onTap: () {
                      logger.d(p[j]["label"].toString());
                      

                      CollectionReference data =
                          FirebaseFirestore.instance.collection('kicks');
                       data.doc("UXzRvkNy7FG36Gzl941r").update({"test":"santa"});

                      // Future<void> updateUser() {
                      //   return users
                      //       .doc('ABC123')
                      //       .update({'company': 'Stokes and Sons'})
                      //       .then((value) => print("User Updated"))
                      //       .catchError((error) =>
                      //           print("Failed to update user: $error"));
                      // }
                    },
                    title: Text(p[j]["label"]),
                    leading: Image.network(p[j]["img_url"]),
                  );
              
                },
              );
            },
          );
        }
      },
    );
  }
}

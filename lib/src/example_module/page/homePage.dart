import 'package:animate_do/animate_do.dart';
import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:sneaker_app/Router/router.gr.dart';
import 'package:sneaker_app/core/cubit/authflow_cubit.dart';
import 'package:sneaker_app/model/basemodel.dart';
import 'package:sneaker_app/model/categories.dart';
import 'package:sneaker_app/model/search.dart';
import 'package:sneaker_app/src/example_module/data/app_data.dart';
import 'package:sneaker_app/widgets/shoeWidget.dart';
import 'package:badges/badges.dart' as badges;


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
                    showSearch(context: context, delegate: MySearchDelegate());
                  },
                  icon: const Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    context.router.push(const WishlistRoute());
                  },
                  icon: const Icon(
                    Icons.favorite_border,
                    color: Colors.black,
                  ),
                ),
                badges.Badge(
                  position: badges.BadgePosition.topEnd(top: 3, end: 7),
                  badgeStyle: badges.BadgeStyle(
                      badgeColor: Colors.red,
                      elevation: 0,
                      padding: const EdgeInsets.all(5),
                      borderRadius: BorderRadius.circular(4)),
                  badgeContent: const Text(
                    "3",
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                  child: IconButton(
                      onPressed: () {}, icon: const Icon(Icons.notifications)),
                )
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
              title: const Text("Log out",
                  style: TextStyle(color: Colors.black, fontSize: 15)),
            )
          ],
        ),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Top Brands",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              FadeInUp(
                delay: const Duration(milliseconds: 45),
                child: SizedBox(
                  height: 98,
                  width: double.infinity,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      CategoriesModel current = categories[index];
                      return GestureDetector(
                        onTap: () {
                          // logger.d(index.toString());
                          // logger.d(current.tittle);
                          context.router
                              .push(BrandDetailsRoute(tittle: current.tittle));
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            children: [
                              Container(
                                height: 55,
                                width: 55,
                                decoration: BoxDecoration(
                                    color: Colors.grey[100],
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        color: Colors.grey.withOpacity(0.5))),
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Image.asset(
                                    current.imgUrl,
                                    // color: Colors.white,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                current.tittle,
                                style: const TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              FadeInUp(
                delay: const Duration(milliseconds: 45),
                child: SizedBox(
                  width: double.infinity,
                  height: 150,
                  child: PageView.builder(
                    controller: controller,
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,

                    itemCount: 3,
                    itemBuilder: (context, index) {
                      BaseModel data = sneakerList[index];
                      return Container(
                        height: 140,
                        padding: const EdgeInsets.all(10),
                        child: Column(children: [
                          Stack(
                            alignment: Alignment.center,
                            fit: StackFit.loose,
                            clipBehavior: Clip.hardEdge,
                            children: [
                              Container(
                                height: 130,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  gradient: gradient[index],
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              Positioned(
                                top: 5,
                                left: 50,
                                child: RotationTransition(
                                  turns:
                                      const AlwaysStoppedAnimation(-25 / 360),
                                  child: Image.asset(
                                    data.imageUrl,
                                    width: 300,
                                    height: 120,
                                    // fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 5,
                                left: 10,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text(
                                      "TODAY ONLY",
                                      style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white70,
                                      ),
                                    ),
                                    Text(
                                      "20% OFF\nWITH CODE:",
                                      style: TextStyle(
                                        fontSize: 22,
                                        height: 1.3,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ]),
                      );
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 142),
                child: SmoothPageIndicator(
                  controller: controller,
                  count: 3,
                  effect: SwapEffect(
                      activeDotColor: Colors.grey.shade700,
                      dotHeight: 10,
                      dotWidth: 10,
                      dotColor: Colors.grey.withOpacity(0.5)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Hot Picks🔥",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(
                        onPressed: () {
                          context.router.push(const SeeallRoute());
                        },
                        child: const Text(
                          "See all",
                          style: TextStyle(color: Colors.black),
                        ))
                  ],
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              FadeIn(
                  delay: const Duration(microseconds: 45),
                  child: const ShoeWidget())
            ],
          ),
        ),
      )),
    );
  }
}

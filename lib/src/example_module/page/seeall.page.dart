import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sneaker_app/widgets/seeallwidget.dart';
import 'package:badges/badges.dart' as badges;

class SeeallPage extends StatefulWidget {
  const SeeallPage({super.key});

  @override
  State<SeeallPage> createState() => _SeeallPageState();
}

class _SeeallPageState extends State<SeeallPage> {
  int tabindex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0,
        backgroundColor: Colors.grey[100],
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:5 ),
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    //   showSearch(context: context, delegate: MySearchDelegate());
                  },
                  icon: const Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                ),
                 IconButton(
                  onPressed: () {
                    //   showSearch(context: context, delegate: MySearchDelegate());
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
                  onPressed: () {},
                  icon: const Icon(
                    CupertinoIcons.bag,
                    color: Colors.black,
                  ),
                ) // IconButton(

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
                  onPressed: () {},
                  icon: const Icon(
                    Icons.notifications,
                    color: Colors.black,
                  )),
            )
              ],
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 10),
              //   child: SizedBox(
              //     height: 30,
              //     width: double.infinity,
              //     child: ListView.builder(
              //       itemCount: categories.length,
              //       scrollDirection: Axis.horizontal,
              //       itemBuilder: (context, index) {
              //         CategoriesModel current = categories[index];
              //         return GestureDetector(
              //           onTap: () {
              //             setState(() {
              //               tabindex = index;
              //             });
              //           },
              //           child: Padding(
              //             padding: const EdgeInsets.all(3),
              //             child: Container(
              //               height: 30,
              //               width: 100,
              //               decoration: BoxDecoration(
              //                   shape: BoxShape.rectangle,
              //                   color: index == tabindex
              //                       ? Colors.black
              //                       : Colors.grey[100],
              //                   border: Border.all(
              //                       color: Colors.grey.withOpacity(0.5)),
              //                   borderRadius:
              //                       const BorderRadius.all(Radius.circular(7))),
              //               child: Center(
              //                 child: Text(
              //                   current.tittle,
              //                   style: TextStyle(
              //                     color: index == tabindex
              //                         ? Colors.grey[100]
              //                         : Colors.black,
              //                   ),
              //                 ),
              //               ),
              //             ),
              //           ),
              //         );
              //       },
              //     ),
              //   ),
              // ),
              // const SizedBox(
              //   height: 10,
              // ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 13),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Text(
                      "All Product ",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.red),
                    ),
                    // SizedBox(height: 5,),
                    Icon(
                      CupertinoIcons.tags,
                      size: 15,
                      color: Colors.red,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const SeeAllwidget(),
            ],
          ),
        ),
      ),
    );
  }
}

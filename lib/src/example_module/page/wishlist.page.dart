import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sneaker_app/widgets/wishlistWidget.dart';
import 'package:badges/badges.dart' as badges;

class WishlistPage extends StatefulWidget {
  const WishlistPage({super.key});

  @override
  State<WishlistPage> createState() => _WishlistPageState();
}

class _WishlistPageState extends State<WishlistPage> {
  //List<Map<String, dynamic>> favoriteShoes = favoriteShoes;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
          title: Column(
            children: const [
              Text(
                "Wishlist",
                style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold ),
              ),
             // Text()
            ],
          ),
          actions: [
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
          backgroundColor: Colors.grey[100],
          elevation: 0,
        ),
        body: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: WishlistWidget(),
        ));
  }
}

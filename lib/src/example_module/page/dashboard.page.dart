import 'package:auto_route/auto_route.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../Router/router.gr.dart';


class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {

    return AutoTabsRouter(
      // list of your tab routes
      // routes used here must be declaraed as children
      // routes of /dashboard
      routes: const [
        HomeRoute(),
        BrandRoute(),
        CartRoute(),
        ProfileRoute(),
      ],
      builder: (context, child, animation) {
        final tabsRouter = AutoTabsRouter.of(context);

        return Scaffold(
          backgroundColor: Colors.grey[100],
          body: FadeTransition(
            opacity: animation,
            child: child,
          ),
          bottomNavigationBar: CustomNavigationBar(
            currentIndex: tabsRouter.activeIndex,
            onTap: (index) {
              // here we switch between tabs
              tabsRouter.setActiveIndex(index);
            },
            iconSize: 20,
            bubbleCurve: Curves.linear,
            selectedColor: Colors.black,
            strokeColor: Colors.black,
            unSelectedColor: const Color(0xffacacac),
            backgroundColor: Colors.grey.shade100,
            scaleFactor: 0.1,
            items: [
              CustomNavigationBarItem(
                icon: const Icon(CupertinoIcons.home),
              ),
              CustomNavigationBarItem(icon: const Icon(CupertinoIcons.tags)),
              CustomNavigationBarItem(
                icon: const Icon(CupertinoIcons.bag),
              ),
              CustomNavigationBarItem(
                icon: const Icon(CupertinoIcons.person),
              ),
            ],
          ),
        );
      },
    );
  }
}

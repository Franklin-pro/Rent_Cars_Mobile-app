
import 'package:CarRent/UI/scan_page.dart';
import 'package:CarRent/UI/screens/home_screen.dart';
import 'package:CarRent/UI/screens/carts_page.dart';
import 'package:CarRent/UI/screens/favorite_screen.dart';
import 'package:CarRent/UI/screens/profile_Page.dart';
import 'package:CarRent/constraints.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int _bottomNavIndex = 0;

  List<Widget> page = const [
    Homescreen(),
    FavoriteScreen(),
    CartsPage(),
    ProfilePage()
  ];

  List<IconData> iconList = [
    Icons.home,
    Icons.favorite,
    Icons.shopping_cart,
    Icons.person
  ];

  List<String> titleList = ['Home', 'Favorite', 'Carts', 'Profile'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            titleList[_bottomNavIndex],
            style: TextStyle(
                color: Onboarding.blackColor,
                fontWeight: FontWeight.w500,
                fontSize: 24),
          ),
          Icon(
            Icons.notifications,
            color: Onboarding.blackColor,
            size: 30,
          ),
        ],
      ),
    ),
    body: IndexedStack(
      index: _bottomNavIndex,
      children: page,

    ),
    floatingActionButton: FloatingActionButton(onPressed: (){
    Navigator.push(context, PageTransition(child: const ScanPage(), type: PageTransitionType.bottomToTop));
    },
   backgroundColor: Onboarding.primaryColor,
    child: Image.asset('assets/images/scanning.png', height: 30.0,),
    ),
    floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    bottomNavigationBar: AnimatedBottomNavigationBar(
      splashColor: Onboarding.primaryColor,
      activeColor: Onboarding.blackColor,
      inactiveColor: Colors.black.withOpacity(0.5),
      icons: iconList,
      activeIndex: _bottomNavIndex,
      gapLocation: GapLocation.center,
      notchSmoothness: NotchSmoothness.softEdge,
      onTap: (index){
        setState(() {
          _bottomNavIndex =index;
        });
      },
    ),
    );
  }

}

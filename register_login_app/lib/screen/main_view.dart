import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:ionicons/ionicons.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import 'account_screen.dart';
import 'home_screen.dart';
import 'setting_screen.dart';
import 'wallet_screen.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  final PersistentTabController _controller =
      PersistentTabController(initialIndex: 0);

  List<Widget> _buildScreens() {
    return [
      const HomeScreen(),
      const SettingScreen(),
      const WalletScreen(),
      const AccountScreen(),
    ];
  }

  // List persistan button navbar

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(IconlyLight.home),
        title: ("Home"),
        activeColorPrimary: Colors.blueAccent,
        inactiveColorPrimary: Colors.black54.withOpacity(0.5),
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Icons.favorite_outline),
        title: ("Favourite"),
        activeColorPrimary: Colors.blueAccent,
        inactiveColorPrimary: Colors.black54.withOpacity(0.5),
      ),
      PersistentBottomNavBarItem(
        icon: Icon(IconlyLight.wallet),
        title: ("Wallet"),
        activeColorPrimary: Colors.blueAccent,
        inactiveColorPrimary: Colors.black54.withOpacity(0.5),
      ),
      PersistentBottomNavBarItem(
        icon: Icon(Ionicons.person_outline),
        title: ("Account"),
        activeColorPrimary: Colors.blueAccent,
        inactiveColorPrimary: Colors.black54.withOpacity(0.5),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Colors.white, // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset:
          true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows:
          true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle:
          NavBarStyle.style1, // Choose the nav bar style with this property.
    );
  }
}

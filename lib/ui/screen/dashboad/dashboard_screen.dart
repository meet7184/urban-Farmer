import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:urban_farmer/const/app_color.dart';
import 'package:urban_farmer/route/route_generator_n.dart';
import 'package:urban_farmer/ui/screen/saved/saved_screen.dart';

import '../../../const/app_icon.dart';
import '../home/home_screen.dart';
import '../notification/notification_screen.dart';
import '../search/search_screen.dart';

enum TabItem { home, search, saved, notification }

class BottomTabModel {
  final String? label;
  final String icon;

  const BottomTabModel(this.icon, {this.label});
}

class DashBoardScreen extends StatefulWidget {
  static const String routeName = "/dashboardScreen";
  const DashBoardScreen({Key? key}) : super(key: key);

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  int selectIndex = 0;

  Map<TabItem, BottomTabModel> tabNameIconMap = {
    TabItem.home: BottomTabModel(
      AppAssets.homeImage,
    ),
    TabItem.search: BottomTabModel(
      AppAssets.searchImage,
    ),
    TabItem.saved: BottomTabModel(
      AppAssets.bookImage,
    ),
    TabItem.notification: BottomTabModel(
      AppAssets.notificationImage,
    ),
  };

  TabItem _currentTab = TabItem.home;
  PageController pageController = PageController();

  final Map<TabItem, GlobalKey<NavigatorState>> _navigatorKeyStateMap = {
    TabItem.home: GlobalKey<NavigatorState>(),
    TabItem.search: GlobalKey<NavigatorState>(),
    TabItem.saved: GlobalKey<NavigatorState>(),
    TabItem.notification: GlobalKey<NavigatorState>(),
  };

  final Map<TabItem, String> _initialRoutesMap = {
    TabItem.home: HomeScreen.routeName,
    TabItem.search: SearchScreen.routeName,
    TabItem.saved: SavedScreen.routeName,
    TabItem.notification: NotificationScreen.routeName,
  };

  void _selectTab(TabItem tabItem) async {
    final oldCurrentTab = _currentTab;
    if (tabItem == _currentTab) {
      final isFirstRouteInCurrentTab =
          !await _navigatorKeyStateMap[tabItem]!.currentState!.maybePop();
      if (!isFirstRouteInCurrentTab) {
        _navigatorKeyStateMap[tabItem]
            ?.currentState
            ?.popUntil((route) => route.isFirst);
      }
    } else {
      _currentTab = tabItem;
      final index = TabItem.values.indexOf(tabItem);
      pageController.jumpToPage(index);
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final isFirstRouteInCurrentTab =
            await _navigatorKeyStateMap[_currentTab]
                    ?.currentState
                    ?.maybePop() ==
                false;
        if (isFirstRouteInCurrentTab) {
          if (_currentTab != TabItem.home) {
            _selectTab(TabItem.home);
            return false;
          }
        }
        return isFirstRouteInCurrentTab;
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
          child: Container(
            height: 60,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 35),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: tabNameIconMap
                    .map((tab, value) => MapEntry(
                          tab,
                          GestureDetector(
                            onTap: () {
                              _selectTab(tab);
                            },
                            child: _currentTab == tab
                                ? Container(
                                    height: 60,
                                    width: 55,
                                    decoration: BoxDecoration(
                                      color: AppColor.kPrimaryGreen,
                                      borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(20),
                                          topRight: Radius.circular(20)),
                                    ),
                                    child: Center(
                                      child: Image.asset(value.icon,
                                          height: 25,
                                          width: 25,
                                          color: Colors.white),
                                    ),
                                  )
                                : Container(
                                    height: 60,
                                    width: 55,
                                    decoration: BoxDecoration(
                                      color: Colors.transparent,
                                      borderRadius: const BorderRadius.only(
                                          topLeft: Radius.circular(20),
                                          topRight: Radius.circular(20)),
                                    ),
                                    child: Center(
                                      child: Image.asset(value.icon,
                                          height: 25,
                                          width: 25,
                                          color: Colors.black),
                                    ),
                                  ),
                          ),
                        ))
                    .values
                    .toList(),
              ),
            ),
          ),
        ),
        body: PageView(
          controller: pageController,
          physics: NeverScrollableScrollPhysics(),
          children: _navigatorKeyStateMap.entries
              .map((entry) => TabNavigator(
                    initialRoute: _initialRoutesMap[entry.key]!,
                    navigatorKey: _navigatorKeyStateMap[entry.key]!,
                  ))
              .toList(),
        ),
      ),
    );
  }
}

class TabNavigator extends StatelessWidget {
  final GlobalKey<NavigatorState> navigatorKey;
  final String initialRoute;

  const TabNavigator({
    Key? key,
    required this.initialRoute,
    required this.navigatorKey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      initialRoute: initialRoute,
      observers: [AppRouteObserver()],
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}

class AppRouteObserver extends RouteObserver<Route<dynamic>> {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPush(route, previousRoute);
    if (route is PageRoute) {
      log("ROUTES :: GOING TO ROUTE => ${route.settings.name}");
    }
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    if (newRoute is PageRoute) {
      log("ROUTES :: REPLACE FROM ${oldRoute!.settings.name} TO ROUTE => ${newRoute.settings.name}");
    }
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPop(route, previousRoute);
    if (previousRoute != null) {
      log("ROUTES :: POP FROM => ${previousRoute.settings.name}");
    }
  }
}

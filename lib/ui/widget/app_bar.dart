import 'package:flutter/material.dart';

import '../../const/app_icon.dart';
import '../screen/profile/profile_screen.dart';
import 'back_button.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context, rootNavigator: true)
            .pushNamed(ProfileScreen.routeName);
      },
      child: CircleAvatar(
        backgroundImage: AssetImage(AppAssets.user),
        radius: 19,
      ),
    );
  }
}

PreferredSizeWidget backAndUserAppBar() {
  return PreferredSize(
    preferredSize: const Size.fromHeight(45),
    child: Padding(
      padding: EdgeInsets.only(top: 35, right: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CommonBackButton(),
          UserProfile(),
        ],
      ),
    ),
  );
}

PreferredSizeWidget textAndBackAndUserAppBar(String text) {
  return PreferredSize(
    preferredSize: const Size.fromHeight(45),
    child: Padding(
      padding: EdgeInsets.only(top: 35, right: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CommonBackButton(),
          Text(
            text,
            style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20),
          ),
          UserProfile(),
        ],
      ),
    ),
  );
}

PreferredSizeWidget backAndTextAppBar(String text) {
  return PreferredSize(
    preferredSize: const Size.fromHeight(50),
    child: Padding(
      padding: EdgeInsets.only(right: 15, top: 30),
      child: Row(
        children: [
          CommonBackButton(),
          Expanded(
            child: Center(
              child: Text(
                text,
                style: TextStyle(fontWeight: FontWeight.w800, fontSize: 19),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

PreferredSizeWidget backAndTextAndIconAppBar(String text) {
  return PreferredSize(
    preferredSize: const Size.fromHeight(50),
    child: Padding(
      padding: EdgeInsets.only(right: 15, top: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CommonBackButton(),
          Text(
            text,
            style: TextStyle(fontWeight: FontWeight.w800, fontSize: 19),
          ),
          Icon(Icons.shopping_bag_outlined, size: 28),
        ],
      ),
    ),
  );
}

PreferredSizeWidget backAndShoppingIconAppbar() {
  return PreferredSize(
    preferredSize: const Size.fromHeight(50),
    child: Padding(
      padding: const EdgeInsets.only(right: 15, top: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const CommonBackButton(),
          const Spacer(),
          Icon(Icons.shopping_bag_outlined, size: 28),
        ],
      ),
    ),
  );
}

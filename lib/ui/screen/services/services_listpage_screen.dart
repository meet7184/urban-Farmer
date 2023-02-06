import 'package:flutter/material.dart';
import 'package:urban_farmer/ui/screen/services/services_category_screen.dart';

import '../../../const/app_icon.dart';

class ServicesListPageScreen extends StatelessWidget {
  static const String routeName = "/servicesListPageScreen";
  const ServicesListPageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: [
                SizedBox(height: 20),
                ...List.generate(
                  5,
                  (index) => Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context, rootNavigator: true)
                              .pushNamed(ServicesCategoryScreen.routeName);
                        },
                        child: Container(
                          margin: EdgeInsets.only(bottom: 25),
                          //height: 180,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Color(0xffCD895C),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 15, right: 15, top: 20, bottom: 20),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Kitchen Garden",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 18),
                                      ),
                                      SizedBox(height: 20),
                                      Text(
                                        "Lorem Ipsum is that it has a more-or-less Lorem Ipsum is that it has a more-or-less"
                                        "Kitchen Garden",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 15),
                                      ),
                                    ],
                                  ),
                                ),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.asset(
                                    AppAssets.kitchenGardenImage,
                                    height: 120,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget appBar() {
    return PreferredSize(
      preferredSize: const Size.fromHeight(45),
      child: Padding(
        padding: EdgeInsets.only(top: 25, right: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BackButton(),
            CircleAvatar(
              backgroundImage: AssetImage(AppAssets.user),
              radius: 19,
            ),
          ],
        ),
      ),
    );
  }
}

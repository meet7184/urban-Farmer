import 'package:flutter/material.dart';
import 'package:urban_farmer/ui/screen/profile/t&c_screen.dart';
import '../../../const/app_icon.dart';
import '../../widget/app_bar.dart';

class SubscriptionScreen extends StatelessWidget {
  static const String routeName = "/subscriptionScreen";
  const SubscriptionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: backAndTextAndIconAppBar("Your Subscription"),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 50),
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                    height: 300,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Color(0xff68D391), Colors.white],
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 60),
                          Text(
                            "John Davis !",
                            style: TextStyle(
                                fontWeight: FontWeight.w800, fontSize: 18),
                          ),
                          Text(
                            "Have fun exploring all Urban \nFarmer has to offer",
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 17),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: -60,
                    right: -0,
                    child: Image.asset(AppAssets.screenshotImage, height: 325),
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    bottom: -140,
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 25),
                      height: 180,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.5),
                              blurRadius: 5)
                        ],
                        borderRadius: BorderRadius.circular(2),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 40),
                            Row(
                              children: [
                                Text(
                                  "Monthly Plan",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w800,
                                      fontSize: 22),
                                ),
                                Spacer(),
                                Container(
                                  height: 30,
                                  width: 75,
                                  decoration: BoxDecoration(
                                    color: Color(0xff68D391),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Active",
                                      style: TextStyle(
                                          fontSize: 11,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 25),
                            Text(
                              "Next Charge Rs. 2999 on 02/02/2023",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 15),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 170),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Actions",
                      style:
                          TextStyle(fontWeight: FontWeight.w800, fontSize: 21),
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        CircleAvatar(radius: 16, backgroundColor: Colors.grey),
                        SizedBox(width: 30),
                        Text(
                          "Cancel Subscription",
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 19),
                        ),
                        Spacer(),
                        Icon(Icons.arrow_forward_ios_sharp, size: 17),
                      ],
                    ),
                    SizedBox(height: 40),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context, rootNavigator: true)
                            .pushNamed(TcScreen.routeName);
                      },
                      child: Center(
                        child: Text(
                          "T&C Apply",
                          style: TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 14,
                              color: Colors.black),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

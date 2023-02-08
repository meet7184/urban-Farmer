import 'package:flutter/material.dart';
import '../../../const/app_icon.dart';
import '../../widget/back_button.dart';

class OnlineGardeningScreen extends StatelessWidget {
  static const String routeName = '/onlineGardeningScreen';
  const OnlineGardeningScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                const Text(
                  "Find your \nfavorite  plants",
                  style: TextStyle(fontWeight: FontWeight.w800, fontSize: 33),
                ),
                const SizedBox(height: 45),
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      height: 170,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color(0xffFDDCE0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            SizedBox(height: 30),
                            Text(
                              "30% OFF",
                              style: TextStyle(
                                  fontWeight: FontWeight.w800, fontSize: 30),
                            ),
                            SizedBox(height: 15),
                            Text(
                              "02 - 10 Dec",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400, fontSize: 25),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      right: 0,
                      bottom: 10,
                      child: Image.asset(AppAssets.onlineGardeningScreenImage,
                          height: 210),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const Text(
                  "Subscriptions",
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 28),
                ),
                const SizedBox(height: 20),
                SingleChildScrollView(
                  clipBehavior: Clip.none,
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  child: Row(
                    children: List.generate(
                      4,
                      (index) => Container(
                        margin: const EdgeInsets.only(right: 20),
                        width: 190,
                        decoration: BoxDecoration(
                          color: const Color(0xffC1D6FA),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              const SizedBox(height: 10),
                              Image.asset(AppAssets.bookImage, height: 23),
                              Row(
                                children: [
                                  RotatedBox(
                                    quarterTurns: 3,
                                    child: RichText(
                                      text: const TextSpan(
                                        text: 'Monthly',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 20,
                                            color: Colors.black),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Center(
                                    child: Image.asset(AppAssets.galinaImage,
                                        height: 130),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Text(
                                    "Rs.",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 19),
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    "2999",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 28),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              GestureDetector(
                                onTap: () {},
                                child: Center(
                                  child: Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 15),
                                    height: 40,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: const Center(
                                      child: Text(
                                        "Add to cart",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 17),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 10),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

PreferredSizeWidget appbar() {
  return PreferredSize(
    preferredSize: const Size.fromHeight(50),
    child: Padding(
      padding: const EdgeInsets.only(right: 15, top: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const CommonBackButton(),
          const Spacer(),
          Image.asset(AppAssets.shoppingBagImage, height: 23),
        ],
      ),
    ),
  );
}

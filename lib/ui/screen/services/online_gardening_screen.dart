import 'package:flutter/material.dart';
import '../../../const/app_icon.dart';
import '../../widget/app_bar.dart';
import '../cart/cart_screen.dart';

class OnlineGardeningScreen extends StatefulWidget {
  static const String routeName = '/onlineGardeningScreen';
  const OnlineGardeningScreen({Key? key}) : super(key: key);

  @override
  State<OnlineGardeningScreen> createState() => _OnlineGardeningScreenState();
}

class _OnlineGardeningScreenState extends State<OnlineGardeningScreen> {
  bool bookMark = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: backAndShoppingIconAppbar(),
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
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
                ),
                const SizedBox(height: 45),
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      height: 150,
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
                                  fontWeight: FontWeight.w800, fontSize: 26),
                            ),
                            SizedBox(height: 15),
                            Text(
                              "02 - 10 Dec",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400, fontSize: 22),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      right: 0,
                      bottom: 10,
                      child: Image.asset(AppAssets.onlineGardeningScreenImage,
                          height: 200),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const Text(
                  "Subscriptions",
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 23),
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
                        width: 150,
                        margin: const EdgeInsets.only(right: 20),
                        decoration: BoxDecoration(
                          color: const Color(0xffC1D6FA),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Column(
                            children: [
                              const SizedBox(height: 10),
                              Row(
                                children: [
                                  Spacer(),
                                  GestureDetector(
                                      onTap: () {
                                        bookMark = !bookMark;
                                        setState(() {});
                                      },
                                      child: bookMark
                                          ? Icon(
                                              Icons.bookmark_border,
                                              size: 22,
                                              color: Colors.black45,
                                            )
                                          : Icon(
                                              Icons.bookmark,
                                              size: 22,
                                              color: Colors.black,
                                            )),
                                ],
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  RotatedBox(
                                    quarterTurns: 3,
                                    child: RichText(
                                      text: const TextSpan(
                                        text: 'Monthly',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 16,
                                            color: Colors.black),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Center(
                                    child: Image.asset(AppAssets.galinaImage,
                                        height: 110),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              Row(
                                children: const [
                                  const SizedBox(width: 10),
                                  Text(
                                    "Rs.",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 15),
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    "2999",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 24),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context, rootNavigator: true)
                                      .pushNamed(CartScreen.routeName);
                                },
                                child: Container(
                                  // margin: const EdgeInsets.symmetric(
                                  //     horizontal: 15),
                                  height: 38,
                                  width: 100,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: const Center(
                                    child: Text(
                                      "Add to cart",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 14),
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

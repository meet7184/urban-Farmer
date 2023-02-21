import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:urban_farmer/const/app_icon.dart';
import 'package:urban_farmer/ui/screen/home/controller/home_controller.dart';

class CarouselWithIndicator extends StatefulWidget {
  const CarouselWithIndicator({Key? key}) : super(key: key);

  @override
  State<CarouselWithIndicator> createState() => _CarouselWithIndicatorState();
}

class _CarouselWithIndicatorState extends State<CarouselWithIndicator> {
  int _current = 0;
  CarouselController carouselController = CarouselController();

  List<String> imgList = [
    "assets/image/onboarding_1.png",
    "assets/image/onboarding_1.png",
    "assets/image/onboarding_1.png",
  ];
  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      builder: (HomeController controller) {
        if (controller.isLoading) {
          return Center(child: CircularProgressIndicator());
        }
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              CarouselSlider(
                carouselController: carouselController,
                items: controller.bannerList
                    .asMap()
                    .map((index, value) => MapEntry(
                        index,
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            height: double.infinity,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Color(0xffC8DCB7),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 15),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    children: [
                                      Text(
                                        value.bannerName,
                                        style: TextStyle(
                                            fontSize: 23,
                                            fontWeight: FontWeight.w700),
                                      ),
                                      SizedBox(height: 15),
                                      Text(
                                        "15% off on Product",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w700),
                                      ),
                                      SizedBox(height: 15),
                                      Container(
                                        height: 35,
                                        width: 110,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: Center(
                                            child: Text(
                                          "Shop Now",
                                          style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w600),
                                        )),
                                      ),
                                    ],
                                  ),
                                  Spacer(),
                                  Image.asset(
                                    AppAssets.lorenInsumImage,
                                    height: 150,
                                    width: 150,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )))
                    .values
                    .toList(),
                options: CarouselOptions(
                  height: 170,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _current = index;
                    });
                  },
                  viewportFraction: 1,
                  initialPage: 1,
                  autoPlay: true,
                ),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Text(
                    "Lorem Ipsum",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                  ),
                  Spacer(),
                  Container(
                    height: 25,
                    width: 80,
                    decoration: BoxDecoration(
                      color: Color(0xffC8DCB7),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Text(
                        "Discover",
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: imgList.asMap().entries.map((entry) {
                  return GestureDetector(
                    onTap: () => carouselController.animateToPage(entry.key),
                    child: Container(
                      width: _current == entry.key ? 30 : 10,
                      height: 3,
                      margin:
                          EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: _current == entry.key
                            ? Colors.black
                            : Color(0xffD9D9D9),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        );
      },
    );
  }
}

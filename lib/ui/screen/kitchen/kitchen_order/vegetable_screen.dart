import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:urban_farmer/const/app_color.dart';

import '../../../../const/app_icon.dart';

class VegetableScreen extends StatefulWidget {
  const VegetableScreen({Key? key}) : super(key: key);

  @override
  State<VegetableScreen> createState() => _VegetableScreenState();
}

class _VegetableScreenState extends State<VegetableScreen> {
  int quantityIndex = 0;
  bool bookMark = true;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        children: [
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: AlignedGridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 8,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            Container(
                              height: 150,
                              width: double.infinity,
                              child: Image.asset(AppAssets.vegetableImage,
                                  fit: BoxFit.fill),
                            ),
                            Positioned(
                              right: 0,
                              child: IconButton(
                                  onPressed: () {
                                    bookMark = !bookMark;
                                    setState(() {
                                      if (bookMark) {
                                        print("true");
                                      } else {
                                        print("false");
                                      }
                                    });
                                  },
                                  icon: bookMark
                                      ? Icon(
                                          Icons.bookmark_border,
                                          size: 20,
                                          color: Colors.white,
                                        )
                                      : Icon(
                                          Icons.bookmark,
                                          size: 20,
                                          color: AppColor.kPrimaryGreen,
                                        )),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Column(
                            //crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 10),
                              Text(
                                "Lorem Ipsum",
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w600),
                              ),
                              Text(
                                "Lorem Ipsum has a verified",
                                style: TextStyle(
                                    fontSize: 13, fontWeight: FontWeight.w500),
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Rs. 540",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Spacer(),
                                  GestureDetector(
                                    onTap: () {
                                      if (quantityIndex <= 0) {
                                      } else {
                                        quantityIndex = quantityIndex - 1;
                                        setState(() {});
                                      }
                                    },
                                    child: Container(
                                      height: 18,
                                      width: 18,
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.black),
                                        shape: BoxShape.circle,
                                      ),
                                      child: Icon(Icons.remove, size: 15),
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Text(
                                    quantityIndex.toString(),
                                    style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  SizedBox(width: 10),
                                  GestureDetector(
                                    onTap: () {
                                      quantityIndex = quantityIndex + 1;
                                      setState(() {});
                                    },
                                    child: Container(
                                      height: 18,
                                      width: 18,
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.black),
                                        shape: BoxShape.circle,
                                      ),
                                      child: Icon(Icons.add, size: 15),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}

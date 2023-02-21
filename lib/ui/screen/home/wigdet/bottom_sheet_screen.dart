import 'package:flutter/material.dart';
import 'package:get/get.dart';

void sortBottomSheet() async {
  Get.bottomSheet(
    const SortBottomSheetScreen(),
    backgroundColor: Colors.white,
    isScrollControlled: true,
  );
}

class SortBottomSheetScreen extends StatefulWidget {
  const SortBottomSheetScreen({Key? key}) : super(key: key);

  @override
  State<SortBottomSheetScreen> createState() => _SortBottomSheetScreenState();
}

class _SortBottomSheetScreenState extends State<SortBottomSheetScreen> {
  List<String> list = [
    "What's new",
    "Prince - high to low",
    "Popularity",
    "Discount",
    "Price - low to high",
    "Customer Rating"
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 40),
          Text(
            "SORT DY",
            style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Colors.black38,
                fontSize: 16),
          ),
          Divider(thickness: 1.5),
          SizedBox(height: 10),
          ...list
              .asMap()
              .map((index, value) => MapEntry(
                  index,
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 15, left: 5),
                        child: Text(
                          value,
                          style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.black54,
                              fontSize: 17),
                        ),
                      ),
                    ],
                  )))
              .values
              .toList(),
        ],
      ),
    );
  }
}

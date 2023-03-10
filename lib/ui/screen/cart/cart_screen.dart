import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:urban_farmer/ui/screen/cart/address_screen.dart';
import 'package:urban_farmer/ui/screen/cart/controller/car_controller.dart';
import '../../widget/back_button.dart';
import 'offers_screen.dart';

class CartScreen extends StatefulWidget {
  static const String routeName = "/cartScreen";
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<String> list = ["Offers", "Address"];
  int select = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff0f1f4),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 5),
              child: Row(
                children: [
                  CommonBackButton(),
                  Expanded(
                    child: Center(
                      child: Text(
                        "Kitchen Garden",
                        style: TextStyle(
                            fontWeight: FontWeight.w800, fontSize: 19),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Container(
              height: 50,
              width: double.infinity,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: list
                      .asMap()
                      .map((index, value) => MapEntry(
                          index,
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 30),
                            child: Row(
                              children: [
                                TextButton(
                                  onPressed: () {
                                    select = index;
                                    setState(() {});
                                  },
                                  child: Text(
                                    value,
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700,
                                        color: select == index
                                            ? Colors.black
                                            : Colors.grey),
                                  ),
                                ),
                              ],
                            ),
                          )))
                      .values
                      .toList(),
                ),
              ),
            ),
            Expanded(
              child: IndexedStack(
                index: select,
                children: const [
                  OffersScreen(),
                  AddressScreen(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

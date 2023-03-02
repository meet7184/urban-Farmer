import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:urban_farmer/core/utils/global.dart';
import 'package:urban_farmer/ui/screen/cart/address_screen.dart';
import 'package:urban_farmer/ui/screen/cart/cart_screen.dart';
import 'package:urban_farmer/ui/screen/cart/controller/add_address_controller.dart';

import '../../../const/app_color.dart';
import '../../../core/bindings/dispose_keyboard.dart';
import '../../../core/network/utils/base_response.dart';
import '../../../core/utils/flitter_toast.dart';
import '../../widget/app_bar.dart';
import '../../widget/common_text_field.dart';

class AddAddressScreen extends StatefulWidget {
  static const String routeName = '/addAddressScreen';
  const AddAddressScreen({Key? key}) : super(key: key);

  @override
  State<AddAddressScreen> createState() => _AddAddressScreenState();
}

class _AddAddressScreenState extends State<AddAddressScreen> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        disposeKeyboard();
      },
      child: Form(
        key: formKey,
        child: Scaffold(
          appBar: backAndTextAppBar("Add New Address"),
          body: GetBuilder(
            builder: (AddAddressController controller) {
              return SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Container(
                                height: 25,
                                width: 25,
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(Icons.done,
                                    size: 14, color: Colors.white),
                              ),
                              SizedBox(height: 5),
                              Text(
                                "Place Order",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12,
                                    color: Colors.green),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Container(
                                  height: 25,
                                  width: 25,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(color: Colors.black38),
                                    shape: BoxShape.circle,
                                  ),
                                  child: Center(
                                    child: Container(
                                      height: 14,
                                      width: 14,
                                      decoration: BoxDecoration(
                                        color: Colors.black38,
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                  )),
                              SizedBox(height: 5),
                              Text(
                                "Select Address",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    color: Colors.black38),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Container(
                                  height: 25,
                                  width: 25,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(color: Colors.green),
                                    shape: BoxShape.circle,
                                  ),
                                  child: Center(
                                    child: Container(
                                      height: 14,
                                      width: 14,
                                      decoration: BoxDecoration(
                                        color: Colors.green,
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                  )),
                              SizedBox(height: 5),
                              Text(
                                "Order List",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                    color: Colors.green),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                        height: 25,
                        width: double.infinity,
                        color: Colors.black12),
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Contact Details",
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 20),
                          ),
                          SizedBox(height: 30),
                          CustomTextField(
                            validator: (val) =>
                                val!.trim().isEmpty ? "field required" : null,
                            textFieldType: TextFieldType.name2,
                            textEditingController:
                                controller.userNameController,
                          ),
                          SizedBox(height: 20),
                          CustomTextField(
                            validator: (val) =>
                                val!.trim().isEmpty ? "field required" : null,
                            textFieldType: TextFieldType.phoneNumber2,
                            textEditingController:
                                controller.phoneNumberController,
                          ),
                          SizedBox(height: 5),
                          CustomTextField(
                            validator: (val) =>
                                val!.trim().isEmpty ? "field required" : null,
                            textFieldType: TextFieldType.emailEdit2,
                            textEditingController: controller.emailIdController,
                          ),
                          SizedBox(height: 20),
                          Text(
                            "Address",
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 20),
                          ),
                          SizedBox(height: 20),
                          CustomTextField(
                            validator: (val) =>
                                val!.trim().isEmpty ? "field required" : null,
                            textFieldType: TextFieldType.zipcode2,
                            textEditingController: controller.zipcodeController,
                          ),
                          SizedBox(height: 5),
                          CustomTextField(
                            validator: (val) =>
                                val!.trim().isEmpty ? "field required" : null,
                            textFieldType: TextFieldType.addressEdit2,
                            textEditingController: controller.addressController,
                          ),
                          SizedBox(height: 20),
                          Row(
                            children: [
                              Expanded(
                                child: CustomTextField(
                                  validator: (val) => val!.trim().isEmpty
                                      ? "field required"
                                      : null,
                                  textFieldType: TextFieldType.city2,
                                  textEditingController:
                                      controller.cityController,
                                ),
                              ),
                              SizedBox(width: 15),
                              Expanded(
                                child: CustomTextField(
                                  validator: (val) => val!.trim().isEmpty
                                      ? "field required"
                                      : null,
                                  textFieldType: TextFieldType.state2,
                                  textEditingController:
                                      controller.stateController,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          GestureDetector(
                            onTap: () async {
                              disposeKeyboard();
                              if (formKey.currentState!.validate()) {
                                formKey.currentState!.save();
                                context.loaderOverlay.show();
                                final response =
                                    await controller.getAddAddress();
                                context.loaderOverlay.hide();
                                response.when(
                                  success: (data) {
                                    Navigator.pop(context);
                                    showToast("Your Address Successfully add");
                                  },
                                  failure: (ErrorType type, String? message) {
                                    showToast(getMessageFromErrorType(type));
                                  },
                                );
                              }
                            },
                            child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 50),
                              height: 40,
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black.withOpacity(0.4),
                                      blurRadius: 4)
                                ],
                                color: AppColor.kPrimaryGreen,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: Text(
                                  "Checkout",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 18,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

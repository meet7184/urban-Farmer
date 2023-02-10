import 'package:flutter/material.dart';
import 'package:urban_farmer/core/bindings/dispose_keyboard.dart';

import '../../../../const/app_color.dart';
import '../../widget/app_bar.dart';
import '../../widget/back_button.dart';
import '../../widget/common_text_field.dart';
import '../../widget/phone_number_textfield.dart';
import '../cart/cart_screen.dart';

class GardenersVisitScreen extends StatefulWidget {
  static const String routeName = 'gardenersVisitScreen';
  const GardenersVisitScreen({Key? key}) : super(key: key);

  @override
  State<GardenersVisitScreen> createState() => _GardenersVisitScreenState();
}

class _GardenersVisitScreenState extends State<GardenersVisitScreen> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  TextEditingController intialdateval = TextEditingController();
  TextEditingController timeCtl = TextEditingController();

  Future _selectDate() async {
    DateTime? picked = await showDatePicker(
        context: context,
        initialDate: new DateTime.now(),
        firstDate: new DateTime(2020),
        lastDate: new DateTime(2030));
    if (picked != null)
      setState(
        () => {
          //data.registrationdate = picked.toString(),
          intialdateval.text = picked.toString()
        },
      );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        disposeKeyboard();
      },
      child: Scaffold(
        appBar: backAndTextAppBar("Ask for Gardener’s Visit"),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 30),
                  Text(
                    "Lorem Ipsum is that it has a more-or-less",
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 21),
                  ),
                  SizedBox(height: 10),
                  Text(
                    "You can reach us anytime viahi@gmail.com",
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 21),
                  ),
                  SizedBox(height: 30),
                  getTitle("Name"),
                  SizedBox(height: 10),
                  CustomTextField(
                    validator: (val) =>
                        val!.trim().isEmpty ? "field required" : null,
                    textFieldType: TextFieldType.firstName,
                    textEditingController: firstNameController,
                  ),
                  SizedBox(height: 30),
                  getTitle("Mobile Number"),
                  SizedBox(height: 10),
                  MobileNumberField(),
                  SizedBox(height: 10),
                  getTitle("Address"),
                  SizedBox(height: 10),
                  CustomTextField(
                    validator: (val) =>
                        val!.trim().isEmpty ? "field required" : null,
                    textFieldType: TextFieldType.address,
                    textEditingController: addressController,
                  ),
                  SizedBox(height: 30),
                  getTitle("Date & Time of Visit"),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 50,
                          child: TextFormField(
                            autocorrect: false,
                            readOnly: true,
                            controller: intialdateval,
                            onSaved: (value) {
                              //data.registrationdate = value;
                            },
                            onTap: () {
                              _selectDate();
                              FocusScope.of(context)
                                  .requestFocus(new FocusNode());
                            },
                            validator: (value) {
                              if (value!.isEmpty || value.length < 1) {
                                return 'Choose Date';
                              }
                            },
                            decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(7),
                                  borderSide: BorderSide(color: Colors.black38),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(7),
                                  borderSide: BorderSide(color: Colors.black38),
                                ),
                                hintText: "Date",
                                contentPadding: EdgeInsets.only(
                                    top: 10, left: 10, right: 10)),
                          ),
                        ),
                      ),
                      SizedBox(width: 40),
                      Expanded(
                        child: SizedBox(
                          height: 50,
                          child: TextFormField(
                            maxLines: 1,
                            controller: timeCtl,
                            readOnly: true, // add this line.
                            decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.only(top: 10, left: 10, right: 10),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(7),
                                borderSide: BorderSide(color: Colors.black38),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(7),
                                borderSide: BorderSide(color: Colors.black38),
                              ),
                              hintText: 'Time',
                            ),
                            onTap: () async {
                              TimeOfDay time = TimeOfDay.now();
                              FocusScope.of(context)
                                  .requestFocus(new FocusNode());

                              TimeOfDay? picked = await showTimePicker(
                                  context: context, initialTime: time);
                              if (picked != null && picked != time) {
                                timeCtl.text =
                                    picked.toString(); // add this line.
                                setState(() {
                                  time = picked;
                                });
                              }
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'cant be empty';
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 30),
                  getTitle("Inclusions : "),
                  SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(left: 60),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        inclusionsText("1. Home Visit"),
                        inclusionsText("2. Area Measurement"),
                        inclusionsText("3. Requirement Mapping"),
                        inclusionsText("4. 5 Kg Organic Manure"),
                      ],
                    ),
                  ),
                  SizedBox(height: 40),
                  Center(
                    child: submitButton(
                      "Make Payment",
                      () => Navigator.of(context, rootNavigator: true)
                          .pushNamed(CartScreen.routeName),
                    ),
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget getTitle(String text) {
    return Text(
      text,
      style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
    );
  }

  Widget inclusionsText(String text) {
    return Text(
      text,
      style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17),
    );
  }
}

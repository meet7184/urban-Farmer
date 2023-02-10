import 'package:flutter/material.dart';

class CommonSubmitTextFieldWidget extends StatelessWidget {
  const CommonSubmitTextFieldWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

Widget submitTextField(String text, TextEditingController controller) {
  return Row(
    children: [
      Text(
        text,
        style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
      ),
      Expanded(
        child: SizedBox(
          height: 40,
          child: TextFormField(
            controller: controller,
            style: TextStyle(fontSize: 20),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(bottom: 10),
            ),
          ),
        ),
      ),
    ],
  );
}

Widget containerBoxShadowWidget(Widget child) {
  return Container(
    width: double.infinity,
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.3), blurRadius: 5),
        ]),
    child: Padding(
        padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
        child: child),
  );
}

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class CommonDropdownButton extends StatefulWidget {
  final String title;
  final List<String> items;
  final String? select;
  final Function(String? val) onChangeValue;
  const CommonDropdownButton(
      {Key? key,
      required this.title,
      required this.items,
      this.select,
      required this.onChangeValue})
      : super(key: key);

  @override
  State<CommonDropdownButton> createState() => _CommonDropdownButtonState();
}

class _CommonDropdownButtonState extends State<CommonDropdownButton> {
  String? selectedValue;
  @override
  void initState() {
    selectedValue = widget.select;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(color: Colors.black.withOpacity(0.4), blurRadius: 6),
            ]),
        child: DropdownButton2(
          hint: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              widget.title,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
            ),
          ),
          icon: const Padding(
            padding: EdgeInsets.only(right: 10),
            child: Icon(Icons.keyboard_arrow_down_outlined),
          ),
          items: widget.items
              .map(
                (item) => DropdownMenuItem<String>(
                  value: item.toString(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 12, left: 20),
                        child: Text(
                          item,
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                      ),
                      Divider(thickness: 1, color: Colors.grey),
                    ],
                  ),
                ),
              )
              .toList(),
          value: selectedValue,
          onChanged: (value) {
            selectedValue = value as String;
            setState(() {});
            widget.onChangeValue(selectedValue);
          },
        ),
      ),
    );
  }
}

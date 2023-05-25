import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  final Function(String?)? onChanged;
  final double padding;
  final bool size;
  final bool onRegPage;
  final bool obscureText;
  final int minLine;
  final int? maxLine;
  final Color cursorColor;
  final TextEditingController? controller;
  // final int initialValue;

  CustomTextField(
      {
      // required this.initialValue,
      required this.onChanged,
      // required this.initialValue,
      this.padding = 0,
      this.size = false,
      this.onRegPage = false,
      this.cursorColor = Colors.black,
      this.maxLine = null,
      this.minLine = 1,
      this.obscureText = false,
      this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: padding),
        child: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            border: Border.all(width: 0.5, color: Colors.black12),
            borderRadius: BorderRadius.circular(10),
            color: Color.fromRGBO(255, 255, 255, 0.3),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 16),
            child: TextFormField(
              controller: controller,
              onChanged: onChanged,
              obscureText: obscureText,
              cursorColor: cursorColor,
              minLines: minLine,
              maxLines: maxLine,
              keyboardType: TextInputType.number,
              // initialValue: initialValue.toString(),
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                // labelText: labelText,
                // labelStyle: TextStyle(fontSize: 16, color: Colors.white),
                hintStyle: TextStyle(
                    fontSize: 16,
                    color: Colors.black38,
                    fontWeight: FontWeight.normal),
              ),
            ),
          ),
        ));
  }
}

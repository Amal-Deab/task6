import 'package:flutter/material.dart';

import '../../core/const_data/app_color.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final bool obscureText;
  final Widget? suffixIcon;
  final String hint;
  final label;

  const CustomTextField(
      {super.key,
      required this.controller,
      required this.hint,
      this.label,
      required this.obscureText,
      this.suffixIcon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500,color: AppColor.blacktext),
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            obscureText: obscureText,
            controller: controller,
            decoration: InputDecoration(
              suffixIcon: suffixIcon,
              hintText: hint,
              filled: true,
              fillColor: AppColor.background_color,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(color: AppColor.primarycolor)),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'This Field is required';
              }
              return null;
            },
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}

import 'package:api_demo_project/color/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;

  CustomTextFormField({required this.hintText, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: controller,
        style: TextStyle(fontSize: 14.h),
        decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(fontWeight: FontWeight.w400, fontSize: 14.h),
            filled: true,
            fillColor: CustomColor.textFieldColor,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.r),
                borderSide: BorderSide(color: Colors.transparent, width: 2.w)),
            contentPadding:
                EdgeInsets.symmetric(horizontal: 16.2, vertical: 14.h)),
      ),
    );
  }
}

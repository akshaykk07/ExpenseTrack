import 'package:expense_tracker/constants/colors.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    // custom TextField........
    super.key,
    required this.hint,
    required this.controller,
    required this.validator,
  });

  final String hint;

  final TextEditingController controller;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15).r,
      child: TextFormField(
        keyboardType: TextInputType.number,
        controller: controller,
        validator: validator,
        style: const TextStyle(color: customBlack1),
        decoration: InputDecoration(
            label: Text(hint),
            labelStyle: const TextStyle(color: Colors.grey),
            contentPadding:
                EdgeInsets.symmetric(vertical: 10.h, horizontal: 15.w),
            focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: customBlack1),
                borderRadius: BorderRadius.circular(8).r),
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: customBlack1),
                borderRadius: BorderRadius.circular(8).r),
            border: const OutlineInputBorder(
                borderSide: BorderSide(color: customBlack2))),
      ),
    );
  }
}

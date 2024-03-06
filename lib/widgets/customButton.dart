import 'package:expense_tracker/widgets/appText.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key, //Custom Button......
    required this.btnname,
    required this.btntheam,
    required this.textcolor,
    required this.click,
  });

  final String btnname;
  final Color btntheam;
  final Color textcolor;

  final void Function() click;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: click,
      child: Container(
        height: 50.h,
        width: double.infinity.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8).r,
          color: btntheam,
        ),
        child: Center(
          child: AppText(
              text: btnname,
              textcolor: textcolor,
              size: 16.sp,
              weight: FontWeight.w700),
        ),
      ),
    );
  }
}

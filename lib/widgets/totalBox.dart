import 'package:expense_tracker/constants/colors.dart';
import 'package:expense_tracker/widgets/appText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TotalBox extends StatelessWidget {
  const TotalBox({
    super.key,
    required this.title,
    required this.value,
    required this.theam,
  });
  final String title;
  final String value;
  final Color theam;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.h,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 5.0,
            offset: const Offset(0.0, 3.0)),
      ], borderRadius: BorderRadius.circular(15).r, color: theam),
      child: Padding(
        padding: const EdgeInsets.only(left: 20).r,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppText(
                text: title,
                weight: FontWeight.w400,
                size: 15,
                textcolor: white),
            AppText(
                text: value,
                weight: FontWeight.w600,
                size: 22,
                textcolor: white),
          ],
        ),
      ),
    );
  }
}

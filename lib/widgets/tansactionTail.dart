import 'package:expense_tracker/constants/colors.dart';
import 'package:expense_tracker/widgets/appText.dart';
import 'package:flutter/material.dart';

//custom List Tail.......................
class TransactionTail extends StatelessWidget {
  const TransactionTail({
    super.key,
    required this.title,
    required this.stitile,
    required this.income,
    required this.expense,
    required this.timestamp,
    this.delete,
  });
  final String title;
  final String stitile;
  final String income;

  final String expense;
  final String timestamp;
  final void Function()? delete;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: white,
      title: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        AppText(
            text: title,
            weight: FontWeight.w500,
            size: 17,
            textcolor: customBalck),
        AppText(
            text: "+ $income",
            weight: FontWeight.w400,
            size: 17,
            textcolor: customGreen),
      ]),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            AppText(
                text: stitile,
                weight: FontWeight.w500,
                size: 15,
                textcolor: customHash),
            AppText(
                text: "- $expense",
                weight: FontWeight.w400,
                size: 15,
                textcolor: customRed),
          ]),
          AppText(
              text: timestamp,
              weight: FontWeight.w600,
              size: 12,
              textcolor: customHash),
        ],
      ),
      trailing: IconButton(
          onPressed: delete,
          icon: const Icon(
            Icons.close,
            color: customHash,
          )),
    );
  }
}

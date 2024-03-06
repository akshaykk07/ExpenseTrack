import 'package:expense_tracker/constants/colors.dart';
import 'package:expense_tracker/widgets/appText.dart';
import 'package:expense_tracker/widgets/customButton.dart';
import 'package:expense_tracker/widgets/customTextFiled.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//Custom Total income and expense box......
class DialogBox extends StatelessWidget {
  DialogBox({
    super.key,
    required this.incomeControllor,
    required this.expencecontrollor,
    required this.add,
  });

  final TextEditingController incomeControllor;
  final TextEditingController expencecontrollor;
  final void Function() add;
  final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 470.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), color: whiteone),
      child: Padding(
        padding: const EdgeInsets.all(20).r,
        child: Padding(
          padding: const EdgeInsets.all(15).r,
          child: Form(
            key: formkey,
            child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const AppText(
                            text: "Enter Details",
                            weight: FontWeight.w500,
                            size: 20,
                            textcolor: customBalck),
                        IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(Icons.close))
                      ],
                    ),
                    CustomTextField(
                        hint: "Enter Income",
                        controller: incomeControllor,
                        validator: (value) {
                          if (value!.isEmpty || value == null) {
                            return "Enter income";
                          }
                        }),
                    CustomTextField(
                        hint: "Enter Expense",
                        controller: expencecontrollor,
                        validator: (value) {
                          if (value!.isEmpty || value == null) {
                            return "Enter expense";
                          }
                        }),
                    SizedBox(
                      height: 40.h,
                    ),
                    CustomButton(
                        btnname: "Add",
                        btntheam: customBlack1,
                        textcolor: white,
                        click: () {
                          if (formkey.currentState!.validate()) {
                            add();
                          }
                        }),
                    SizedBox(
                      height: 20.h,
                    ),
                   
                    CustomButton(
                        btnname: "Clear",
                        btntheam: whiteone,
                        textcolor: customBlack1,
                        click: () {
                          incomeControllor.clear();
                          expencecontrollor.clear();
                        })
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:expense_tracker/db/dbfunctions.dart';
import 'package:expense_tracker/db/model.dart';
import 'package:expense_tracker/widgets/dialogBox.dart';
import 'package:expense_tracker/widgets/tansactionTail.dart';
import 'package:expense_tracker/widgets/totalBox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:expense_tracker/constants/colors.dart';
import 'package:expense_tracker/widgets/appText.dart';
import 'package:intl/intl.dart';

class ExpenceTracker extends StatefulWidget {
  const ExpenceTracker({super.key});

  @override
  State<ExpenceTracker> createState() => _ExpenceTrackerState();
}

class _ExpenceTrackerState extends State<ExpenceTracker> {
  final incomeControllor = TextEditingController(); //textediting controllor....
  final expencecontrollor =
      TextEditingController(); //textediting controllor....
  double totalincome = 0.0;
  double totalexpense = 0.0;
  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteone,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: whiteone),
        title: const AppText(
            text: "Expense Tracker",
            weight: FontWeight.w400,
            size: 18,
            textcolor: white),
        backgroundColor: customBlack1,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20).r,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20.h,
            ),
            const AppText(
                text: "Hi,User",
                weight: FontWeight.w600,
                size: 23,
                textcolor: customBlack1),
            const AppText(
                text: "Track your dailyIncome & Expenses",
                weight: FontWeight.w400,
                size: 17,
                textcolor: customBlack1),
            SizedBox(
              height: 20.h,
            ),
            Row(children: [
              Expanded(
                child: TotalBox(
                    title: "Total Income",
                    value: totalincome.toString(),
                    theam: customYellow),
              ),
              SizedBox(
                width: 10.w,
              ),
              Expanded(
                child: TotalBox(
                    title: "Total Expense",
                    value: totalexpense.toString(),
                    theam: customBlack1),
              ),
            ]),
            SizedBox(
              height: 20.h,
            ),
            const AppText(
                text: "All History",
                weight: FontWeight.w500,
                size: 19,
                textcolor: customBlack1),
            SizedBox(
              height: 10.h,
            ),
            Expanded(
              child: entries.isEmpty
                  ? const Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.post_add,
                            color: customHash,
                            size: 60,
                          ),
                          AppText(
                              text: "Add Transcaction",
                              weight: FontWeight.w500,
                              size: 19,
                              textcolor: customHash),
                        ],
                      ),
                    )
                  : ListView.builder(
                      itemBuilder: (context, index) {
                        final entry = entries[index];

                        return TransactionTail(
                          title: "Income",
                          stitile: "Expense",
                          income: entry.income.toString(),
                          expense: entry.expense.toString(),
                          timestamp: DateFormat('dd-MM-yyy HH:mm:ss')
                              .format(entry.dateTime),
                          delete: () {
                            deleteDat(entry.id, index);
                            // deleteData(entry.id);
                            // setState(() {
                            //   entries.removeAt(index);
                            //   getData();
                            // });
                          },
                        );
                      },
                      itemCount: entries.length,
                    ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          add(context);
        },
        shape: const CircleBorder(),
        backgroundColor: customBlack1,
        child: const Icon(
          Icons.add,
          color: whiteone,
        ),
      ),
      drawer: const Drawer(
        backgroundColor: whiteone,
      ),
    );
  }

//DailogBox Function......................
  Future<void> add(BuildContext context) async {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
          child: DialogBox(
              incomeControllor: incomeControllor,
              expencecontrollor: expencecontrollor,
              add: () {
                double income = double.parse(incomeControllor.text);
                double expense = double.parse(expencecontrollor.text);
                setState(() {
                  inserData(Entry(
                      income: income,
                      expense: expense,
                      dateTime: DateTime.now()));
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text(
                      "item adedd successfully",
                      style: TextStyle(color: customBlack1),
                    ),
                    behavior: SnackBarBehavior.floating,
                    backgroundColor: customYellow,
                  ));
                  getData();
                });
                Navigator.pop(context);
                incomeControllor.clear();
                expencecontrollor.clear();
              }),
        );
      },
    );
  }

  Future<void> getData() async {
    //get data from database..............
    final data = await db.rawQuery('SELECT * FROM expense');

    double tempTotalIncome = 0.0;
    double tempTotalExpense = 0.0;
    List<Entry> tempEntries = [];

    for (var map in data) {
      final entry = Entry.fromMap(map);
      tempTotalIncome += entry.income;
      tempTotalExpense += entry.expense;
      tempEntries.add(entry);
    }

    setState(() {
      totalincome = tempTotalIncome;
      totalexpense = tempTotalExpense;
      entries = tempEntries;
    });
  }

//delete alert box...................
  Future<void> deleteDat(id, index) async {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: whiteone,
          title: const AppText(
              text: "Are you sure!!",
              weight: FontWeight.w600,
              size: 20,
              textcolor: customBlack1),
          content: const Text("Are you sure you want to delete this item"),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  "cancel",
                  style: TextStyle(color: customBlack1, fontSize: 18),
                )),
            TextButton(
                onPressed: () {
                  deleteData(id);
                  setState(() {
                    entries.removeAt(index);
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text(
                        "item removed",
                        style: TextStyle(color: customBlack1),
                      ),
                      behavior: SnackBarBehavior.floating,
                      backgroundColor: customYellow,
                    ));
                    getData();
                  });
                },
                child: const Text(
                  "ok",
                  style: TextStyle(color: customRed, fontSize: 18),
                ))
          ],
        );
      },
    );
  }
}

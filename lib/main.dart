

import 'package:expense_tracker/db/usermodel.dart';
import 'package:expense_tracker/screens/ele.dart';
import 'package:expense_tracker/screens/elechome.dart';
import 'package:expense_tracker/screens/homeScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'package:hive_flutter/adapters.dart';

import 'db/hiveFunction.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
await Hive.initFlutter();
 Hive.registerAdapter(UserAdapter());
 await TodoService().openBox();
 Get.put(TodoService());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      //screenutil packege for adaptive ui............
      designSize: const Size(390, 844),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: ElecHome()),
    );
  }
}

import 'package:expense_tracker/db/dbfunctions.dart';
import 'package:expense_tracker/screens/homeScreen.dart';
import 'package:expense_tracker/screens/secondscreen.dart';
import 'package:expense_tracker/screens/thirdscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDatabase();

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
        home:  ListScreen(),
      ),
    );
  }
}

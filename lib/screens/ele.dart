import 'package:expense_tracker/db/usermodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../db/hiveFunction.dart';

class ElecDart extends StatefulWidget {
  const ElecDart({super.key});

  @override
  State<ElecDart> createState() => _ElecDartState();
}

// TodoService data = TodoService();
final name = TextEditingController();
final age = TextEditingController();
// List<User> datas = [];
final TodoService datas = Get.find();

class _ElecDartState extends State<ElecDart> {
  // Future<void> _loadTodos() async {
  //   datas = await data.getTodos();
  //   setState(() {});
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   _loadTodos();
  // }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: size.height / 40,
              ),
              Text(
                "Fill up Deatails",
                style: TextStyle(
                    color: Colors.purple,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: size.height / 40,
              ),
              TextFormField(controller: name,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: "Name"),
              ),
              SizedBox(
                height: size.height / 40,
              ),
              TextFormField(
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: "Address"),
              ),
              SizedBox(
                height: size.height / 40,
              ),
              TextFormField(controller: age,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: "Phone"),
              ),
              SizedBox(
                height: size.height / 40,
              ),
              TextFormField(
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), labelText: "VoterId"),
              ),
              SizedBox(
                height: size.height / 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        datas.addTodo(User(name: name.text, age: age.text));
                        datas.getData();
                      });
                    },
                    style: const ButtonStyle(
                        shape:
                            MaterialStatePropertyAll(BeveledRectangleBorder()),
                        backgroundColor:
                            MaterialStatePropertyAll(Colors.purple)),
                    child: const Text(
                      "Clear",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  SizedBox(
                    width: size.width / 10,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        datas.addTodo(User(name: name.text, age: age.text));
                        datas.getData();
                   Navigator.pop(context);
                      });
                    },
                    style: const ButtonStyle(
                        shape:
                            MaterialStatePropertyAll(BeveledRectangleBorder()),
                        backgroundColor:
                            MaterialStatePropertyAll(Colors.purple)),
                    child: const Text(
                      "Submit",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),

            ],
          ),
        ),
      ),

    );
  }
}

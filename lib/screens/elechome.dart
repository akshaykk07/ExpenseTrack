import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../db/hiveFunction.dart';
import 'ele.dart';

class ElecHome extends StatelessWidget {
   ElecHome({super.key});
  final TodoService datas = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(backgroundColor: Colors.purple,), body:Obx(
          () => ListView.builder(
        itemBuilder: (context, index) {
          return ListTile(
            title:  Text(datas.userlist[index].name.toString(),style:TextStyle(color: Colors.black) ,),
            leading: IconButton(
                onPressed: () {
                  datas.deleteTodo(index);
                  datas.getData();
                },
                icon: const Icon(Icons.delete)),
          );
        },
        itemCount: datas.userlist.length,
      ),
    ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
         Navigator.push(context, MaterialPageRoute(builder: (context) =>  ElecDart(),));
        },
        backgroundColor: Colors.purple,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}

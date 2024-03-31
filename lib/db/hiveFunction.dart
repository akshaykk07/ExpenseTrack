import 'package:expense_tracker/db/usermodel.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class TodoService extends GetxController {
  Box<User>? _todoBox;
  RxList<User> userlist = <User>[].obs;

  Future<void> openBox() async {
    _todoBox = await Hive.openBox<User>('todos');
  }


  getData()async{
     userlist.value= await getTodos();
  }

  Future<void> closeBox() async {
    await _todoBox!.close();
  }


  Future<void> addTodo(User user) async {
    if (_todoBox == null) {
      await openBox();
    }
    await _todoBox!.add(user);
  }

  Future<List<User>> getTodos() async {
    if (_todoBox == null) {
      await openBox();
    }

    return _todoBox!.values.toList();
  }

  Future<void> updateTodo(int index, User user) async {
    if (_todoBox == null) {
      await openBox();
    }

    await _todoBox!.putAt(index, user);

  }

  Future<void> deleteTodo(int index) async {
    if (_todoBox == null) {
      await openBox();
    }

    await _todoBox!.deleteAt(index);
  }
}

import 'package:hive_flutter/hive_flutter.dart';

class TodoDatabase {
  List todoList = [];
  final _mybox = Hive.box("mybox");

  void createInitialState() {
    todoList = [
      ["hi", false]
    ];
  }

  void loadData() {
    todoList = _mybox.get("TODOLIST");
  }

  void updateDatabase() {
    _mybox.put("TODOLIST", todoList);
  }
}

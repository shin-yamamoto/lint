import 'package:flutter/cupertino.dart';

// Lintなしだと何も表示されませんが実はたくさんバグがあります
class TodoModel extends ChangeNotifier {
  late List todoList = [];

  String? taskName;

  init() {
    todoList = fetchTodo();
    notifyListeners();
  }

  fetchTodo() async {
    Future<void>.delayed(Duration(seconds: 1));
    return [
      {'taskName': '掃除', 'complete': false},
      {'taskName': '洗濯', 'complete': false},
      {'taskName': 'サウナ', 'complete': false},
    ];
  }

  toggleComplete(index) {
    todoList[index]['complete'] = !todoList[index]['complete'];
    notifyListeners();
  }

  addTodo() {
    todoList.add({taskName: taskName, 'complete': false});
    notifyListeners();
  }

  completeCounter() {
    todoList.where((element) => element['complete'] == true).length;
  }
}

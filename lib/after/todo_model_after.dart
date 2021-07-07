import 'package:flutter/cupertino.dart';

// pedantic_monoに従って直していくとだいぶきれいになります
class TodoModelAfter extends ChangeNotifier {
  List<Map<String, dynamic>> todoList = [];

  String? taskName;

  Future<void> init() async {
    todoList = await fetchTodo();
    notifyListeners();
  }

  Future<List<Map<String, dynamic>>> fetchTodo() async {
    await Future<void>.delayed(const Duration(seconds: 1));
    return [
      <String, dynamic>{'taskName': '掃除', 'complete': false},
      <String, dynamic>{'taskName': '洗濯', 'complete': false},
      <String, dynamic>{'taskName': 'サウナ', 'complete': false},
    ];
  }

  void toggleComplete(int index) {
    final dynamic complete = todoList[index]['complete'];
    if (complete is bool) {
      todoList[index]['complete'] = !complete;
    } else {
      return;
    }
    notifyListeners();
  }

  void addTodo() {
    todoList.add(<String, dynamic>{'taskName': taskName, 'complete': false});
    notifyListeners();
  }

  int completeCounter() {
    return todoList.where((element) => element['complete'] == true).length;
  }
}

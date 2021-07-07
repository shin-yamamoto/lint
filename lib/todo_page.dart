import 'package:flutter/material.dart';
import 'package:lint_sample/todo_model.dart';
import 'package:provider/provider.dart';

// Lintなしだと何も表示されませんが実はたくさんバグがあります
class TodoPage extends StatelessWidget {
  TodoPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TodoModel()..init(),
      child: Consumer<TodoModel>(
        builder: (context, model, child) {
          return Scaffold(
            appBar: AppBar(title: Text('TODO')),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('達成数: ' + model.completeCounter()),
                ListView.builder(
                  itemCount: model.todoList.length,
                  itemBuilder: (_, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Container(
                            width: 200,
                            child: Text(model.todoList[index]),
                          ),
                          IconButton(
                            onPressed: () {
                              model.toggleComplete(index);
                            },
                            icon: Icon(
                              Icons.check,
                              color: model.todoList[index]['complete']
                                  ? Colors.blue
                                  : Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
                TextFormField(
                  onChanged: (value) {
                    model.taskName = value;
                  },
                ),
                ElevatedButton(
                    onPressed: () {
                      model.addTodo();
                    },
                    child: Text('追加する')),
              ],
            ),
          );
        },
      ),
    );
  }
}

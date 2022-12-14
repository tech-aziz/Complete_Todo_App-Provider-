import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/provider/todos.dart';
import 'package:todo_app/widgets/todo_widget.dart';

class TodoListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TodosProvider>(context);
    final todos = provider.todos;
    return todos.isEmpty
        ? const Center(
          child: Text(
              'No Todos',
              style: TextStyle(fontSize: 20),
            ),
        )
        : ListView.separated(
            separatorBuilder: (context, int index) => const Divider(
                  color: Colors.black12,
                  thickness: 5,
                ),
            physics: const BouncingScrollPhysics(),
            
            padding: const EdgeInsets.all(16),
            itemBuilder: ((context, index) {
              final todo = todos[index];
              return TodoWidget(
                todo: todo,
              );
            }),
            itemCount: todos.length);
  }
}

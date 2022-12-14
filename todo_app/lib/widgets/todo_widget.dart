import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/model/todo.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../provider/todos.dart';
import '../utils.dart';

class TodoWidget extends StatelessWidget {
  final Todo todo;
  const TodoWidget({required this.todo});

  @override
  Widget build(BuildContext context) => ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Slidable(
            // key: key(todo.id),

            startActionPane: ActionPane(motion: ScrollMotion(), children: [
              SlidableAction(
                onPressed: ((context) {
                  // edit here
                }),
                icon: Icons.edit,
                label: 'Edit',
                backgroundColor: Colors.purple,
              ),
            ]),
            endActionPane: ActionPane(motion: ScrollMotion(), children: [
              SlidableAction(
                onPressed: ((context) => deleteTodo(context, todo)),
                icon: Icons.delete_forever,
                backgroundColor: Colors.red,
                label: 'Delete',
              ),
            ]),
            child: buildTodo(context)),
      );
  Widget buildTodo(BuildContext context) => Container(
        padding: const EdgeInsets.all(20),
        color: Colors.white,
        child: Row(
          children: [
            Checkbox(
              activeColor: Theme.of(context).primaryColor,
              checkColor: Colors.white,
              value: todo.isDone,
              onChanged: (value) {
                final provider = Provider.of<TodosProvider>(context, listen: false);
                
              },
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    todo.title,
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor),
                  ),
                  if (todo.description.isNotEmpty)
                    Container(
                      child: Text(
                        todo.description,
                        style: TextStyle(fontSize: 20, height: 1.7),
                      ),
                    ),
                  // Text(todo.description)
                ],
              ),
            )
          ],
        ),
      );

  deleteTodo(BuildContext context, Todo todo) {
    final provider = Provider.of<TodosProvider>(context, listen: false);
    provider.removeTodo(todo);
    Utils.showSnackBar(context, 'Deleted the task');
  }
}

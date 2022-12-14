import 'package:flutter/cupertino.dart';
import 'package:todo_app/model/todo.dart';

class TodosProvider extends ChangeNotifier{

    
    List<Todo> _todos = [
      Todo(
      createdTime: DateTime.now(), 
      title: 'Walk the dog', 
      description: ''
      ),
       Todo(
      createdTime: DateTime.now(), 
      title: 'Buy foods\n -egg\n-milk \n-bread \n-water',
      description: ''
      ),
       Todo(
      createdTime: DateTime.now(), 
      title: 'plan family tour to america \n-rent hotel \n rent-car \nfind resturent',
      description: ''
      ),
       Todo(
      createdTime: DateTime.now(), 
      title: 'Go shoping', 
      description: ''
      ),
      Todo(
      createdTime: DateTime.now(), 
      title: 'Walking in the Lake', 
      description: ''
      ),
      Todo(
      createdTime: DateTime.now(), 
      title: 'Reading Books', 
      description: ''
      ),
      Todo(
      createdTime: DateTime.now(), 
      title: 'Travelling with friends', 
      description: ''
      ),
    ];
    List<Todo> get todos => _todos.where((todo) => todo.isDone == false).toList();

  void addTodo(Todo todo) {
    _todos.add(todo);
    notifyListeners();
  }

  void removeTodo(Todo todo) {
    _todos.remove(todo);
    notifyListeners();
  }
  

}
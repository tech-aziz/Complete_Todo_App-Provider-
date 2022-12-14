
class Todo {
  DateTime createdTime;
  String? id;
  String description;
  String title;
  bool? isDone;


  Todo({
   required this.createdTime, 
   required this.title, 
   this.id, 
   required this.description, 
   this.isDone = false,

    });
}

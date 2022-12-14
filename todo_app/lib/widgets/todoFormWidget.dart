import 'package:flutter/material.dart';

class ToDoFormWidget extends StatelessWidget {
  final String? title;
  final String? description;
  final ValueChanged<String>? onChangedTitle;
  final ValueChanged<String>? onDescription;
  final VoidCallback? onSavedTodo;

  // ignore: use_key_in_widget_constructors
  const ToDoFormWidget(
      {Key? key,
      this.title,
      this.description,
      required this.onChangedTitle,
      required this.onDescription,
      required this.onSavedTodo});

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              buildTitle(),
              SizedBox(
                height: 8,
              ),
              buildDescription(),
              SizedBox(
                height: 8,
              ),
              buildButton()
            ],
          ),
        ),
      );

  buildTitle() => TextFormField(
        maxLines: 1,
        initialValue: title,
        onChanged: onChangedTitle,
        validator: ((title) {
          if (title!.isEmpty) {
            return "The title cannot be empty";
          }
          return null;
        }),
        decoration: InputDecoration(
          labelText: 'Title',
          border: UnderlineInputBorder(),
        ),
      );

  buildDescription() => TextFormField(
        maxLines: 3,
        initialValue: description,
        
        onChanged: onDescription,
        validator: ((description) {
          if (description!.isEmpty) {
            return "The description cannot be empty";
          }
          return null;
        }),
        decoration: InputDecoration(
            labelText: 'Description', border: UnderlineInputBorder()),
      );

  buildButton() => SizedBox(
    width: double.infinity,
    child: ElevatedButton(
      
        style: ButtonStyle(     
        backgroundColor: MaterialStateProperty.all(Colors.purple)),
        onPressed: onSavedTodo,
        child: Text('Save')),
  );
}

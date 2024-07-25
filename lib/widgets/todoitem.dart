import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/constants/color.dart';
import 'package:todo_app/model/todo.dart';


class Todoitem extends StatelessWidget {
  final ToDo todo;
  final onTodoChanged;
  final onTodoDeleted;

  const Todoitem({super.key, required this.todo, required this.onTodoChanged, required this.onTodoDeleted});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom:20),
      child : ListTile(
        onTap: (){
          // print('clicked');
          onTodoChanged(todo);
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        tileColor: Colors.white,
        leading: Icon(todo.isDone? Icons.check_box : Icons.check_box_outline_blank, color: tdBlue,),
        title: Text(todo.todotext!, style: TextStyle(
          fontSize: 16, 
          color:tdBlack, 
          decoration: todo.isDone? TextDecoration.lineThrough: null),),
        contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
        trailing: Container(
          padding: EdgeInsets.all(0),
          margin: EdgeInsets.symmetric(vertical: 12),
          height: 35,
          width: 35,
          decoration: BoxDecoration(
            color: tdRed,
            borderRadius: BorderRadius.circular(5)
          ),
          child: IconButton(
            color: Colors.white,
            icon: Icon(Icons.delete),
            iconSize: 18,
            onPressed: (){
                print(todo.id);
                onTodoDeleted(todo.id);
            },
            ),
        ),
      )
      );  
  }
}
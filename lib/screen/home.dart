import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:todo_app/constants/color.dart';
import 'package:todo_app/widgets/todoitem.dart';
import 'package:todo_app/model/todo.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);
  
  final todoslist = ToDo.todosList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tdBGColor,
      appBar: _buildAppbar(),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Column(
          children: [
            searchBox(),
            _buildListView(),
          ],
        ),
      ),
    );
  }

  Widget searchBox() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextField(
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(0),
          prefixIcon: Icon(
            Icons.search,
            color: tdBlack,
            size: 20,
          ),
          prefixIconConstraints: BoxConstraints(
            maxHeight: 20,
            maxWidth: 25,
          ),
          border: InputBorder.none,
          hintText: 'Search',
          hintStyle: TextStyle(color: tdBlack),
        ),
      ),
    );
  }

  Widget _buildListView() {
    return Expanded(
      child: ListView(
        children: [
          Container(
            margin: EdgeInsets.only(top: 50, bottom: 20),
            child: Text(
              'All To Do',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
            ),
          ),
          for(ToDo todo1 in todoslist)
             Todoitem(todo : todo1),
          
        ],
      ),
    );
  }

  AppBar _buildAppbar() {
    return AppBar(
      elevation: 0,
      backgroundColor: tdBGColor,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(
            Icons.menu,
            color: tdBlack,
            size: 30,
          ),
          Container(
            // color: tdRed,
            height: 40,
            width: 40,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset('assets/images/avatar.png'),
            ),
          ),
        ],
      ),
    );
  }
}

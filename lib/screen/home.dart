import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:todo_app/constants/color.dart';
import 'package:todo_app/widgets/todoitem.dart';
import 'package:todo_app/model/todo.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<ToDo> todoslist = ToDo.todosList();
  List<ToDo> _foundTodo = [];
  final _todoController = TextEditingController();

  @override
  void initState() {
    _foundTodo = todoslist ;
    super.initState();
  }

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
            add_todo(),
          ],
        ),
      ),
    );
  }

  void runfilter(String inputsearchbar){
    List<ToDo> results = [];
    if(inputsearchbar.isEmpty){
      results = todoslist ; 
    }else {
      results = todoslist.where((item)=> item.todotext!.toLowerCase().contains(inputsearchbar.toLowerCase())).toList();
    }
    setState(() {
      _foundTodo = results;
    });
  }

  void _handleTodoitem(ToDo todo) {
    setState(() {
      todo.isDone = !todo.isDone;
    });
  }
  void _handleTodoDelete(String id){
    setState(() {
      todoslist.removeWhere((item)=> item.id == id);
   });
  }

  void _onTodoAddItem(String toDo){
    if(toDo.isNotEmpty){
      setState(() {
            todoslist.add(ToDo(id: DateTime.now().millisecondsSinceEpoch.toString(), todotext: toDo));
    });
    }
       _todoController.clear();
  }

  Widget add_todo() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 4,
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    offset: Offset(0, 4),
                    blurRadius: 10,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: TextField(
                controller: _todoController,
                decoration: InputDecoration(
                  hintText: 'Add a new ToDo...',
                  hintStyle: TextStyle(color: tdBlack),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(left: 15),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1, // 25% of the row (1 part out of 4)
            child: Container(
              height: 65,
              margin: EdgeInsets.only(left: 15),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2), // Shadow color with opacity
                    offset: Offset(0, 4), // Shadow position
                    blurRadius: 8, // Blur effect
                    spreadRadius: 1, // How much the shadow spreads
                  ),
                ],
              ),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: tdBlue, // Button background color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20), // Button border radius
                  ),
                ),
                onPressed: () {
                  _onTodoAddItem(_todoController.text);
                },
                child: Text(
                  '+',
                  style: TextStyle(color: Colors.white, fontSize: 30),
                ),
              ),
            ),
          )
        ],
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
        onChanged: (value) => runfilter(value),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(0),
          prefixIcon: Icon(Icons.search, color: tdBlack, size: 20),
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
          for (ToDo todo1 in _foundTodo.reversed) 
            Todoitem(
              todo: todo1,
              onTodoChanged: _handleTodoitem, 
              onTodoDeleted: _handleTodoDelete
              ),
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

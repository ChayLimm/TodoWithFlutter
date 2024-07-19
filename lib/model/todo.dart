class ToDo{
  String? id;
  String? todotext;
  bool isDone ;

  ToDo({
    required this.id,
    required this.todotext,
    this.isDone = false,
  });

  static List<ToDo> todosList(){
    return [
      ToDo(id: '01', todotext: 'Do the assignment', isDone: true),
      ToDo(id: '02', todotext: 'Do the assignment', isDone: true),
      ToDo(id: '03', todotext: 'Do the assignment'),
      ToDo(id: '04', todotext: 'Do the assignment'),
      ToDo(id: '05', todotext: 'Do the assignment'),
    ];

  }

}
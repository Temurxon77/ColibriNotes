import 'package:todoapp/pages/db.dart';

class Todo {
  int id;
  String name;
  String info;
  bool isDeleted;

  Todo(this.id,this.name,this.info,this.isDeleted);
  Todo.fromJson(Map<String,dynamic> json){
    this.id = json[DataBaseCreator.id];
    this.name = json[DataBaseCreator.name];
    this.info = json[DataBaseCreator.info];
    this.isDeleted = json[DataBaseCreator.isDeleted] == 1; 
  }
}

class RepositoryServiceTodo {
  static Future<List<Todo>> getAllTodos() async {
    final sql = '''SELECT * FROM ${DataBaseCreator.todoTable}
    WHERE ${DataBaseCreator.isDeleted} == 0''';
    final data = await db.rawQuery(sql);
    List<Todo> todos = List();

    for(final node in data){
      final todo = Todo.fromJson(node);
      todos.add(todo);
    }
    return todos;
  }
  static Future<Todo> getTodo(int id) async {
    final sql = '''SELECT * FROM ${DataBaseCreator.todoTable}
    WHERE ${DataBaseCreator.id} == $id''';
    final data = await db.rawQuery(sql);

    final todo = Todo.fromJson(data[0]);
    return todo;
  }

  static Future<void> addTodo(Todo todo) async {
    final sql = '''INSERT INTO ${DataBaseCreator.todoTable}
    (
      ${DataBaseCreator.id}
      ${DataBaseCreator.name}
      ${DataBaseCreator.info}
      ${DataBaseCreator.isDeleted}
    )
    VALUES
    (
      ${todo.id}
      ${todo.name}
      ${todo.info}
      ${todo.isDeleted ? 1 : 0}
    )
    ''';
    final result = await db.rawInsert(sql);
    DataBaseCreator.dataBaseLog("Add Todo", sql,null,result);
  }

  static Future<void> deleteTodo(Todo todo) async {
    final sql = '''UPDATE ${DataBaseCreator.todoTable}
    SET ${DataBaseCreator.isDeleted} = 1
    WHERE ${DataBaseCreator.id} == ${todo.id}
    ''';
    final result  = await db.rawUpdate(sql);
    DataBaseCreator.dataBaseLog("Delete Todo", sql,null,result);
  }

  static  Future<void> updateTodo(Todo todo) async {
    final sql = '''UPDATE ${DataBaseCreator.todoTable}
    SET ${DataBaseCreator.name} = "${todo.name}"
    WHERE ${DataBaseCreator.id} == ${todo.id}
    ''';

    final result = await db.rawUpdate(sql);
    DataBaseCreator.dataBaseLog("Update Todo", sql,null,result);
  }
  static Future<int> todosCount() async {
    final data = await db.rawQuery(
      '''SELECT COUNT(*) FROM ${DataBaseCreator.todoTable}'''
    );
    int count = data[0].values.elementAt(0);
    return count;
  }
}
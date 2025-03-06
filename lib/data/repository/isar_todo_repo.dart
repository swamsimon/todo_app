import 'package:to_do_app/data/models/isar_todo.dart';
import 'package:to_do_app/domain/models/todo.dart';
import 'package:to_do_app/domain/respository/todo_repo.dart';
import 'package:isar/isar.dart';

class IsarTodoRepo implements TodoRepo {
  final Isar db;

  IsarTodoRepo(this.db);

  @override
  Future<List<Todo>> getTodos() async {
    final todos = await db.todoIsars.where().findAll();
    //fetch from db and return as list of todos and give back to domain
    return todos.map((todoIsar) => todoIsar.toDomain()).toList();
  }
  @override
  Future<void> addTodo(Todo newtodo) async{

    final todoIsar = TodoIsar.fromDomain(newtodo);
    //convert todo into isartodo so we can store it in our isardb
    return db.writeTxn(() => db.todoIsars.put(todoIsar));
  }
  @override
  Future<void> updateTodo(Todo todo) {

    final todoIsar = TodoIsar.fromDomain(todo);
  
    return db.writeTxn(() => db.todoIsars.put(todoIsar));
  }
  @override
  Future<void> deleteTodo(Todo todo) async{
    await db.writeTxn(() => db.todoIsars.delete(todo.id),);

  }
}

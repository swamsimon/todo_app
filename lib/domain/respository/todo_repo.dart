/*
Create
Read
Update
Delete
*/

import 'package:to_do_app/domain/models/todo.dart';

abstract class TodoRepo {
  Future <List<Todo>> getTodos();

  Future <void> addTodo(Todo newtodo);

  Future <void> updateTodo(Todo todo);

  Future <void> deleteTodo(Todo todo);

}

//independent of any framework or technology
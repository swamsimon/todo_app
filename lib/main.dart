import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:to_do_app/data/models/isar_todo.dart';
import 'package:to_do_app/data/repository/isar_todo_repo.dart';
import 'package:to_do_app/domain/respository/todo_repo.dart';
import 'package:to_do_app/presentation/todo_page.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  //get directory name for stroring data

  final dir = await getApplicationDocumentsDirectory();

  //open asir database

  final isar = await Isar.open([TodoIsarSchema],directory: dir.path);

  final isarTodoRepo = IsarTodoRepo(isar);




  runApp(MyApp(todoRepo: isarTodoRepo,));
}


class MyApp extends StatelessWidget {
  const MyApp({super.key,required this.todoRepo});

  final TodoRepo todoRepo;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TodoPage(todoRepo: todoRepo),
      
    );
  }
}


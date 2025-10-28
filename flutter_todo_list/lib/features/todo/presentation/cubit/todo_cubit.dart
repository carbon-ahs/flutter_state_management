import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../data/models/todo_model.dart';

part 'todo_state.dart';

class TodoCubit extends Cubit<List<Todo>> {
  TodoCubit() : super([]);

  void addTodo(String title) {
    final todo = Todo(name: title, createdAt: DateTime.now());

    emit([...state, todo]);
  }
}

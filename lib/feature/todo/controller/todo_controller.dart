import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/data_source/remote_data_source.dart';
import 'package:todo/feature/todo/widgets/snack_bar.dart';
import 'package:todo/model/todo_model.dart';

final todoControllerProvider =
    StateNotifierProvider<TodoController, bool>((ref) {
  return TodoController(remoteData: ref.watch(remoteDataProvider));
});

final getTodoProvider = FutureProvider.autoDispose<List<Todo>>((ref) async {
  return ref.watch(remoteDataProvider).getTodo();
});

class TodoController extends StateNotifier<bool> {
  //remote data source class injected in the TodoController
  final RemoteData _rData;

  TodoController({required RemoteData remoteData})
      : _rData = remoteData,
        super(false);

  Future<void> addTodoCtrl({
    required String title,
    required String details,
    required BuildContext context,
  }) async {
    String test = 'TETSTS';
    final Todo todo = Todo(id: test, title: title, details: details);
    state = true;
    await _rData
        .addTodo(todo: todo)
        .then((value) => Alerts.snackBar(context, 'To added'));
    state = false;
  }

  Future<void> deleteTodoCtrl({
    required String todoId,
    required BuildContext context,
  }) async {
    state = true;
    await _rData
        .deleteTodo(todoId: todoId)
        .then((value) => Alerts.snackBar(context, 'To added'));
    state = false;
  }

  Future<void> updateTodoCtrl({
    required Todo todo,
    required BuildContext context,
  }) async {
    state = true;
    await _rData
        .updateTodo(todo: todo)
        .then((value) => Alerts.snackBar(context, 'To added'));
    state = false;
  }
}

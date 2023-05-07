import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/data_source/remote_data_source.dart';
import 'package:todo/feature/todo/widgets/snack_bar.dart';
import 'package:todo/model/todo_model.dart';
import 'package:uuid/uuid.dart';

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

  void addTodoCtrl({
    required String title,
    required String details,
    required BuildContext context,
    required Function success,
  }) async {
    state = true;
    String id = const Uuid().v1();
    final Todo todo = Todo(id: id, title: title, details: details);
    final response = await _rData.addTodo(todo: todo);
    state = false;
    response.fold(
      (l) => Alerts.snackBar(context, 'Error ${l.error}'),
      (r) => success,
    );
  }

  void deleteTodoCtrl({
    required String todoId,
    required BuildContext context,
  }) async {
    state = true;
    final response = await _rData.deleteTodo(todoId: todoId);
    state = false;
    response.fold(
      (l) => Alerts.snackBar(context, 'Error $l'),
      (r) => Alerts.snackBar(context, 'Todo deleted'),
    );
  }

  void updateTodoCtrl({
    required Todo todo,
    required BuildContext context,
  }) async {
    state = true;
    final response = await _rData.updateTodo(todo: todo);

    state = false;
    response.fold((l) => Alerts.snackBar(context, 'Error $l'),
        (r) => Alerts.snackBar(context, 'Todo updated'));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/feature/todo/controller/todo_controller.dart';
import 'package:todo/feature/todo/screens/add_todo.dart';
import 'package:todo/feature/todo/widgets/todo_card.dart';
import 'package:todo/model/todo_model.dart';


class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todoProvider = ref.watch(getTodoProvider);
    final todoCtrlState = ref.watch(todoControllerProvider);
    return Scaffold(
        appBar: AppBar(
          title: const Text('TODO MASTER'),
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) =>  AddTodoScreen(isUpdate: false,)));
          },
          child: const Text('Add'),
        ),
        body: todoProvider.when(
            data: (todoList) {
              return ListView.builder(
                      itemCount: todoList.length,
                      itemBuilder: (context, index) {
                        final todo = todoList[index];
                        return todoList.isEmpty? Center(child: Text('NO items added yet'),) :TodoCard(
                          todo: todo,
                        );
                      });
            },
            error: (error, trace) {
              return Center(child: Text('Error ${error.toString()}'));
            },
            loading: () =>
                const Center(child: CircularProgressIndicator.adaptive())));
  }
}

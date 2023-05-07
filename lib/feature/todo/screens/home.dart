import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/feature/todo/controller/todo_controller.dart';
import 'package:todo/feature/todo/screens/add_todo.dart';
import 'package:todo/feature/todo/widgets/todo_card.dart';
import 'package:todo/model/todo_model.dart';

List<Todo> todoList = [
  Todo(id: 'id', title: 'Hello', details: 'I want to blow the cash'),
  Todo(id: 'id', title: 'Hello', details: 'I want to blow the cash'),
];

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todoProvider = ref.watch(getTodoProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('TODO MASTER'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const AddTodoScreen()));
        },
        child: const Text('Add'),
      ),
      body: ListView.builder(
        shrinkWrap: true,
          itemCount: todoList.length,
          itemBuilder: (context, index) {
           
            return TodoCard(
              todo: todoList[index],
            );
          }),
      /*todoProvider.when(
              data: (todoList) {
                todoList
                    .add(Todo(id: 'dd', title: 'Helllo', details: 'WJHHHS'));
                return ListView.builder(
                    itemCount: todoList.length,
                    itemBuilder: (context, index) {
                      final todo = todoList[index];
                      return TodoCard(
                        todo: todo,
                      );
                    });
              },
              error: (error, trace) {
                return Center(
                  child: ListView.builder(
                      itemCount: todoList.length,
                      itemBuilder: (context, index) {
                        final todo = todoList[index];
                        return TodoCard(
                          todo: todo,
                        );
                      }),
                );
              },
              loading: () =>
                  const Center(child: CircularProgressIndicator.adaptive()))*/
    );
  }
}

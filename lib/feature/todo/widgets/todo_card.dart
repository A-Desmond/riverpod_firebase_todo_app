import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/feature/todo/controller/todo_controller.dart';
import 'package:todo/feature/todo/screens/add_todo.dart';
import 'package:todo/model/todo_model.dart';

class TodoCard extends ConsumerWidget {
  final Todo todo;
  const TodoCard({
    super.key,
    required this.todo,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todoCtrl = ref.watch(todoControllerProvider.notifier);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 150,
        decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(12),
            shape: BoxShape.rectangle),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.center,
                child: Text(
                  todo.title,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w800),
                ),
              ),
              const Divider(height: 3),
              Expanded(
                child: Text(
                  todo.details,
                  textAlign: TextAlign.right,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w400),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(9),
                    color: Colors.green.withOpacity(0.3)),
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AddTodoScreen(
                                        isUpdate: true,
                                        todo: todo,
                                      )));
                        },
                        icon: const Icon(Icons.update)),
                    Spacer(),
                    IconButton(
                        onPressed: () {
                          todoCtrl.deleteTodoCtrl(
                              todoId: todo.id, context: context);
                        },
                        icon: const Icon(Icons.delete)),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/feature/todo/controller/todo_controller.dart';
import 'package:todo/model/todo_model.dart';

class TodoCard extends ConsumerWidget {
  final Todo todo;
  const TodoCard({
    super.key,
    required this.todo,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todoCtrlState = ref.watch(todoControllerProvider);
    final todoCtrl = ref.watch(todoControllerProvider.notifier);
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(12),
          shape: BoxShape.rectangle),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                todo.title,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.w800),
              ),
              const Divider(height: 3),
              Expanded(
                child: Text(
                  todo.details,
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w800),
                ),
              ),
              const SizedBox(height: 2),
              Container(
                child: todoCtrlState
                    ? const CircularProgressIndicator()
                    : Row(
                        children: [
                          IconButton(
                              onPressed: () => todoCtrl.deleteTodoCtrl(
                                  todoId: todo.id, context: context),
                              icon: const Icon(Icons.delete)),
                          IconButton(
                              onPressed: () => todoCtrl.updateTodoCtrl(
                                  todo: todo, context: context),
                              icon: const Icon(Icons.update)),
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

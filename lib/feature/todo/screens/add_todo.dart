import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/feature/todo/controller/todo_controller.dart';

class AddTodoScreen extends ConsumerStatefulWidget {
  const AddTodoScreen({super.key});

  @override
  ConsumerState<AddTodoScreen> createState() => _AddTodoScreenState();
}

class _AddTodoScreenState extends ConsumerState<AddTodoScreen> {
  final titleController = TextEditingController();
  final detailsController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add To '),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(hintText: 'Title'),
            ),
            const SizedBox(height: 30),
            TextField(
              controller: detailsController,
              decoration: const InputDecoration(hintText: 'Details'),
            ),
            const SizedBox(
              height: 70,
            ),
            ElevatedButton(
                onPressed: () {
                  ref.watch(todoControllerProvider.notifier).addTodoCtrl(
                        title: titleController.text,
                        details: detailsController.text,
                        context: context,
                      );
                },
                child: const Text('ADD TODO'))
          ],
        ),
      ),
    );
  }
}

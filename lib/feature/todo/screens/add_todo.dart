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
  void dispose() {
    super.dispose();
    titleController.dispose();
    detailsController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(todoControllerProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Todo '),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: titleController,
                decoration: InputDecoration(
                    hintText: 'Title',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5)))),
              ),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                maxLines: 10,
                controller: detailsController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    hintText: 'Details'),
              ),
            ),
            const SizedBox(
              height: 70,
            ),
            state
                ? CircularProgressIndicator.adaptive()
                : ElevatedButton(
                    onPressed: () {
                      ref.watch(todoControllerProvider.notifier).addTodoCtrl(
                            title: titleController.text,
                            details: detailsController.text,
                            context: context,
                            success: () => Navigator.of(context).pop(),
                          );
                    },
                    child: const Text('ADD TODO'),
                  )
          ],
        ),
      ),
    );
  }
}

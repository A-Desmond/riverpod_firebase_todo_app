import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/feature/todo/controller/todo_controller.dart';
import 'package:todo/model/todo_model.dart';

class AddTodoScreen extends ConsumerStatefulWidget {
  Todo? todo;
  final bool isUpdate;
  AddTodoScreen({super.key, required this.isUpdate, this.todo});

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
    final actions = ref.watch(todoControllerProvider.notifier);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.isUpdate ? 'Update Todo' : 'Add Todo '),
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
                    hintText: widget.isUpdate ? widget.todo!.title : 'Title',
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
                decoration: InputDecoration(
                    border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5))),
                    hintText:
                        widget.isUpdate ? widget.todo!.details : 'Details'),
              ),
            ),
            const SizedBox(
              height: 70,
            ),
            state
                ? CircularProgressIndicator.adaptive()
                : ElevatedButton(
                    onPressed: () {
                      widget.isUpdate
                          ? actions.updateTodoCtrl(
                              todo: Todo(
                                  id: widget.todo!.id,
                                  title: titleController.text,
                                  details: detailsController.text),
                              context: context)
                          : actions.addTodoCtrl(
                              title: titleController.text,
                              details: detailsController.text,
                              context: context,
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

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todo/model/todo_model.dart';

final remoteDataProvider = Provider((ref) => RemoteData());

class RemoteData {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //create Todo
  Future<void> addTodo({required Todo todo}) async {
    try {
      await _firestore.collection('todo').doc(todo.id).set(todo.toMap());
     } on FirebaseException catch (e) {
      print(e);
      rethrow;
    }
  }

  //delete Todo
  Future<void> deleteTodo({required String todoId}) async {
    try {
      await _firestore.collection('todo').doc(todoId).delete();
     } on FirebaseException catch (e) {
      print(e);
      rethrow;
    }
  }

//update Todo
  Future<void> updateTodo({required Todo todo}) async {
    try {
      await _firestore
          .collection('todo')
          .doc(todo.id)
          .update(todo.copyWith().toMap());
    } on FirebaseException catch (e) {
      print(e);
      rethrow;
    }
  }

// get list of all todo
  Future<List<Todo>> getTodo() async {
    try {
      final todos = await _firestore.collection('todo').get();
      final todoList =
          todos.docs.map((todo) => Todo.fromMap(todo.data())).toList();
      return todoList;
    } on FirebaseException catch (e) {
      print(e);
      rethrow;
    }
  }
}

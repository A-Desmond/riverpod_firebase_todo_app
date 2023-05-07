import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:todo/core/failure.dart';
import 'package:todo/core/type_def.dart';
import 'package:todo/model/todo_model.dart';

final remoteDataProvider = Provider((ref) => RemoteData());

class RemoteData {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //create Todo
  FutureEither<bool> addTodo({required Todo todo}) async {
    try {
      await _firestore.collection('todo').doc(todo.id).set(todo.toMap());
      return right(true);
    } on FirebaseException catch (e) {
      return left(Failure(e.toString()));
    }
  }

  //delete Todo
  FutureEither<bool> deleteTodo({required String todoId}) async {
    try {
      await _firestore.collection('todo').doc(todoId).delete();
      return right(true);
    } on FirebaseException catch (e) {
      return left(Failure(e.toString()));
    }
  }

//update Todo
  FutureEither<bool> updateTodo({required Todo todo}) async {
    try {
      await _firestore
          .collection('todo')
          .doc(todo.id)
          .update(todo.copyWith().toMap());
      return right(true);
    } on FirebaseException catch (e) {
      return left(Failure(e.toString()));
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
      rethrow;
    }
  }
}

import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:todo_app/model/todo.dart';

class TodoServices {
  static Future<String> createTodo(Todo todo) async {
    final docTodo = FirebaseFirestore.instance.collection('todo').doc();

    todo.id = docTodo.id;
    await docTodo.set(todo.toJson());

    return docTodo.id;
  }

  // static StreamTransformer transformer<T>(
  //         T Function(Map<String, dynamic> json) fromJson) =>
  //     StreamTransformer<QuerySnapshot, List<T>>.fromHandlers(
  //       handleData: (QuerySnapshot data, EventSink<List<T>> sink) {
  //         final snaps = data.docs.map((doc) => doc.data()).toList();
  //         final objects = snaps.map((json) => fromJson(Map<String, dynamic> json)).toList();

  //         sink.add(objects);
  //       },
  //     );

  //TODO : COMPELTE LATER
  // static Stream<List<Todo>> readTodos() => FirebaseFirestore.instance
  //     .collection('todo')
  //     .doc()
  //     .snapshots()
  //     .transform(transformer(Todo.fromJson));

  static Future updateTodo(Todo todo) async {
    final docTodo = FirebaseFirestore.instance.collection('todo').doc(todo.id);

    await docTodo.update(todo.toJson());
  }

  static Future deleteTodo(Todo todo) async {
    final docTodo = FirebaseFirestore.instance.collection('todo').doc(todo.id);

    await docTodo.delete();
  }
}


import 'dart:convert';

import 'package:http/http.dart' as http;

import '../Model/todo.dart';

class Service {
  Future<List<Todo>> getData() async {
    List<Todo> data = [];
    final url = 'https://jsonplaceholder.typicode.com/todos';
    final uri = Uri.parse(url);

    final res = await http.get(uri);

    if (res.statusCode == 200) {
      var json = jsonDecode(res.body);
      return data = json.map((e) {
        return Todo.fromJson(e);
      })
          .cast<Todo>()
          .toList();
    }
    return data;
  }
}

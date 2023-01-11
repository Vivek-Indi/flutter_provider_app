import 'package:flutter/material.dart';
import 'package:flutter_provider_app/api/service.dart';

import '../Model/todo.dart';

class TodoProvider with ChangeNotifier {
  Service _service = Service();
  bool isLoading = false;

  List<Todo> _todos = [];
  get todo => _todos;

  List<Todo> _todosfiltered = [];
  get todofiltered => _todosfiltered;

  Future<void> getList() async {
    isLoading = true;
    notifyListeners();

    _todos = await _service.getData();
    notifyListeners();

    isLoading = false;
    notifyListeners();
  }

  List<Todo> search(text) {
    _todosfiltered = _todos.where((element) {
      return element.title.toString().contains(text);
    }).toList();
    notifyListeners();
    return _todosfiltered;
  }
}

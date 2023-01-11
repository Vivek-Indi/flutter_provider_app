class Todo {
  int? id;
  String? title;

  Todo({required this.id, required this.title});

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(id: json['id'], title: json['title']);
  }
}

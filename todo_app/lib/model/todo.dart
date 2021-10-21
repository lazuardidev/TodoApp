class Todo {
  String id;
  String title;
  String description;
  bool isDone;

  Todo({
    this.id = '',
    this.title = '',
    this.description = '',
    this.isDone = false,
  });

  static Todo fromJson(Map<String, dynamic> json) => Todo(
        id: json['id'],
        title: json['title'],
        description: json['description'],
        isDone: json['isDone'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'description': description,
        'isDone': isDone,
      };
}

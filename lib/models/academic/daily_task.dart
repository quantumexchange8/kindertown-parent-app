import 'dart:convert';

List<DailyTask> listDailyTaskFromJson(String json) {
  List data = jsonDecode(json);
  return List<DailyTask>.from(data.map((e) => DailyTask.fromMap(e)).toList());
}

// ignore_for_file: public_member_api_docs, sort_constructors_first
class DailyTask {
  int id;
  String task;
  bool done;
  DailyTask({
    required this.id,
    required this.task,
    required this.done,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'task': task,
      'done': done,
    };
  }

  factory DailyTask.fromMap(Map<String, dynamic> map) {
    return DailyTask(
      id: map['id'] as int,
      task: map['task'] as String,
      done: map['done'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory DailyTask.fromJson(String source) =>
      DailyTask.fromMap(json.decode(source));
}

import 'dart:convert';

class Friend {
  static int num = 0;
  static Friend? edit;
  static Friend? view;
  final int userId;
  String? id;
  Map<String, dynamic> formValues;
  Friend({required this.formValues, required this.userId, this.id}) {
    num++;
  }

  // Factory constructor to instantiate object from json format
  factory Friend.fromJson(Map<String, dynamic> json) {
    return Friend(
      formValues: json['formValues'],
      userId: json['userId'],
      id: json['id'],
    );
  }

  static List<Friend> fromJsonArray(String jsonData) {
    final Iterable<dynamic> data = jsonDecode(jsonData);
    return data.map<Friend>((dynamic d) => Friend.fromJson(d)).toList();
  }

  Map<String, dynamic> toJson(Friend friend) {
    return {
      'userId': friend.userId,
      'formValues': friend.formValues,
    };
  }
}
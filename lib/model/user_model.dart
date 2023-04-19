import 'dart:convert';

import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  const UserModel({
    required this.name,
    required this.avatar,
    required this.id,
    required this.createdAt,
  });

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));

  factory UserModel.fromMap(List json) {
    final map = json[0];
    return UserModel(
      name: map['name'] ?? '',
      avatar: map['avatar'] ?? '',
      id: map['id'] ?? '',
      createdAt: map['createdAt'] ?? '',
    );
  }

  final String avatar;
  final String createdAt;
  final String id;
  final String name;

  static List<UserModel> fromJsonList(List list) {
    return list.map((e) => UserModel.fromMap(e)).toList();
  }

  @override
  List<Object> get props => [name, avatar, id, createdAt];

  @override
  String toString() {
    return 'UserModel(name: $name, avatar: $avatar, id: $id, createdAt: $createdAt)';
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'avatar': avatar,
      'id': id,
      'createdAt': createdAt,
    };
  }

  String toJson() => json.encode(toMap());
}

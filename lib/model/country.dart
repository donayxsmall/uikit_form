import 'dart:convert';

import 'package:equatable/equatable.dart';

class Country extends Equatable {
  const Country({
    required this.id,
    required this.name,
  });

  factory Country.fromJson(String source) =>
      Country.fromMap(json.decode(source));

  factory Country.fromMap(Map<String, dynamic> map) {
    return Country(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
    );
  }

  static List<Country> fromJsonList(List list) {
    return list.map((e) => Country.fromMap(e)).toList();
  }

  final String id;
  final String name;

  @override
  List<Object> get props => [id, name];

  @override
  String toString() => 'Country(id: $id, name: $name)';

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }

  String toJson() => json.encode(toMap());

  ///custom comparing function to check if two users are equal
  bool isEqual(Country model) {
    return id == model.id;
  }

  ///this method will prevent the override of toString
  // String userAsString() {
  //   return '#${id} ${name}';
  // }

  // @override
  // String toString() => name;
}

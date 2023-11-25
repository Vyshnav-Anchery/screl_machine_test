// import 'package:freezed_annotation/freezed_annotation.dart';
// import 'package:hive_flutter/hive_flutter.dart';

// part 'user_model.freezed.dart';
// part 'user_model.g.dart';

// @HiveType(typeId: 1)
// @freezed
// class UserModel with _$UserModel {
//   factory UserModel({
//     @HiveField(0) required int id,
//     @HiveField(1) required String name,
//     @HiveField(2) required String email,
//     @HiveField(3) required String address,
//     @HiveField(4) required String createdAt,
//   }) = _UserModel;
// }

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'user_model.g.dart';

@HiveType(typeId: 1)
class UserModel extends HiveObject {
  @HiveField(0)
  int id;
  @HiveField(1)
  String name;
  @HiveField(2)
  String email;
  @HiveField(3)
  String? address;
  @HiveField(4)
  String createdAt;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.address,
    required this.createdAt,
  });
}

// import 'package:flutter/foundation.dart';
// import 'package:freezed_annotation/freezed_annotation.dart';
// import 'package:hive_flutter/hive_flutter.dart';

// part 'user_model.freezed.dart';
// // part 'user_model.g.dart';

// @freezed
// abstract class UserModel extends HiveObject with _$UserModel {
//   UserModel._();

//   @HiveType(typeId: 1)
//   factory UserModel(
//       {@HiveField(0) required int id,
//       @HiveField(1) required String userName,
//       @HiveField(2) required String email,
//       @HiveField(3) required String address}) = _UserModel;
// }

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@HiveType(typeId: 1)
@freezed
class UserModel with _$UserModel {
  factory UserModel({
    @HiveField(0) required int id,
    @HiveField(1) required String name,
    @HiveField(2) required String email,
    @HiveField(3) required String address,
    @HiveField(4) required String createdAt,
  }) = _UserModel;
}

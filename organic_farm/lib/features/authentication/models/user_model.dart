// user_model.dart
// 1. import freezed_annotation
import 'package:freezed_annotation/freezed_annotation.dart';

// 2. add 'part' files
part 'user_model.freezed.dart';
part 'user_model.g.dart';

// 3. add @freezed annotation
@freezed
// 4. define a class with a mixin
class UserModel with _$UserModel {
  // 5. define a factory constructor
  factory UserModel({
    // 6. list all the arguments/properties
    String? id,
    String? name,
    String? email,
    String? avatar,
    String? phoneNumber,
    // 7. assign it with the `_UserModel` class constructor
  }) = _UserModel;

  // 8. define another factory constructor to parse from json
  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
}

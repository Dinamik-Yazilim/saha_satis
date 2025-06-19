import 'package:core/core.dart';

/// An example user model.
class UserModel extends BaseModel {
  String name;
  int age;
  String email;
  bool isActive;
  String? gender; // Newly added

  UserModel({
    super.id,
    required this.name,
    required this.age,
    required this.email,
    this.isActive = true,
    this.gender = 'unknown', // Newly added, default value
  });

  /// Creates a UserModel from a Map.
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] as String?,
      name: map['name'] as String,
      age: map['age'] as int,
      email: map['email'] as String,
      isActive: (map['isActive'] as int) == 1,
      gender: map['gender'] as String? ?? 'unknown', // Newly added, null-safe
    );
  }

  /// Converts the UserModel to a Map.
  @override
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'age': age,
      'email': email,
      'isActive': isActive ? 1 : 0,
      'gender': gender, // Newly added
    };
  }

  // tableName is now a static getter
  static String get staticTableName => 'users';

  @override
  String get tableName => staticTableName; // Implements the abstract getter in BaseModel

  @override
  UserModel fromMap(Map<String, dynamic> map) {
    // Implements the abstract method in BaseModel
    return UserModel.fromMap(map);
  }
}

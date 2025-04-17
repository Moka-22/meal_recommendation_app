import 'package:meals_recommendation/features/auth/signin_and_signup/domain/entities/user_entity.dart';

class UserModel extends UserEntity{
  const UserModel({
    required super.name,
    required super.email,
    required super.password,
  });
  factory UserModel.fromEntity(UserEntity userEntity) {
    return UserModel(
      name: userEntity.name,
      email: userEntity.email,
      password: userEntity.password,
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'password': password,
    };
  }
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
    );
  }
}
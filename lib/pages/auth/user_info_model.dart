import 'dart:convert';

class UserInfoModel {
  String username;
  String email;
  String firstName;
  String lastName;
  String accessToken;
  UserInfoModel({
    required this.username,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.accessToken,
  });



  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'username': username,
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
      'accessToken': accessToken,
    };
  }

  factory UserInfoModel.fromMap(Map<String, dynamic> map) {
    return UserInfoModel(
      username: map['username'] as String,
      email: map['email'] as String,
      firstName: map['firstName'] as String,
      lastName: map['lastName'] as String,
      accessToken: map['accessToken'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserInfoModel.fromJson(String source) => UserInfoModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserInfoModel(username: $username, email: $email, firstName: $firstName, lastName: $lastName, accessToken: $accessToken)';
  }
}

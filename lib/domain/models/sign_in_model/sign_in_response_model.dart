class SignInResponseModel {
  SignInResponseModel({
    this.message = '',
    this.data,
  });

  String message;
  UserSignInData? data;

  factory SignInResponseModel.fromMap(Map<String, dynamic> json) =>
      SignInResponseModel(
        message: json['message'] ?? '',
        data:
            json['data'] == null ? null : UserSignInData.fromMap(json['data']),
      );

  Map<String, dynamic> toMap() => <String, dynamic>{
        'message': message,
        'data': data?.toMap(),
      };
}

class UserSignInData {
  UserSignInData({
    this.id = '',
    this.username = '',
    this.email = '',
    this.name = '',
    this.roles = '',
    this.userToken = '',
  });

  String id;
  String username;
  String email;
  String name;
  String roles;
  String userToken;

  factory UserSignInData.fromMap(Map<String, dynamic> json) => UserSignInData(
        id: json['id'] ?? '',
        username: json['username'] ?? '',
        email: json['email'] ?? '',
        name: json['name'] ?? '',
        roles: json['roles'] ?? '',
        userToken: json['userToken'] ?? '',
      );

  Map<String, dynamic> toMap() => <String, dynamic>{
        'id': id,
        'username': username,
        'email': email,
        'name': name,
        'roles': roles,
        'userToken': userToken,
      };
}

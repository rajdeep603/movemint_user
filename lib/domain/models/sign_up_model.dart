class SignUpModel {
  SignUpModel({
    required this.firstName,
    required this.lastname,
    required this.username,
    required this.name,
    required this.email,
    required this.password,
    required this.firebaseAuthId,
    required this.phoneNo,
  });

  String firstName;
  String lastname;
  String username;
  String name;
  String email;
  String password;
  String firebaseAuthId;
  String phoneNo;

  factory SignUpModel.fromMap(Map<String, dynamic> json) => SignUpModel(
        firstName: json['firstName'] ?? '',
        username: json['username'] ?? '',
        lastname: json['lastname'] ?? '',
        name: json['name'] ?? '',
        email: json['email'] ?? '',
        password: json['password'] ?? '',
        firebaseAuthId: json['firebaseAuthID'] ?? '',
        phoneNo: json['phoneNo'] ?? '',
      );

  Map<String, dynamic> toMap() => <String, dynamic>{
        'firstName': firstName,
        'lastname': lastname,
        'username': username,
        'name': name,
        'email': email,
        'password': password,
        'firebaseAuthID': firebaseAuthId,
        'phoneNo': phoneNo,
      };
}

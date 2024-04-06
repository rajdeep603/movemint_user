class SignInModel {
  SignInModel({
    required this.phoneNo,
    required this.role,
  });

  String phoneNo;
  String role;

  factory SignInModel.fromMap(Map<String, dynamic> json) => SignInModel(
        phoneNo: json['phoneNo'] ?? '',
        role: json['role'] ?? '',
      );

  Map<String, dynamic> toMap() => <String, dynamic>{
        'phoneNo': phoneNo,
        'role': role,
      };
}

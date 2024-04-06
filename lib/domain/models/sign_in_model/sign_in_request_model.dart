class SignInRequestModel {
  SignInRequestModel({
    required this.phoneNo,
    required this.role,
  });

  String phoneNo;
  String role;

  factory SignInRequestModel.fromMap(Map<String, dynamic> json) => SignInRequestModel(
        phoneNo: json['phoneNo'] ?? '',
        role: json['role'] ?? '',
      );

  Map<String, dynamic> toMap() => <String, dynamic>{
        'phoneNo': phoneNo,
        'role': role,
      };
}

class AuthenticationModel {
  final String status, message;
  int? verificationCode;

  AuthenticationModel({
    required this.status,
    required this.message,
    this.verificationCode,
  });
  factory AuthenticationModel.fromJson(jsonData) {
    return AuthenticationModel(
        status: jsonData['status'],
        message: jsonData['message'],
        verificationCode: jsonData['verification_code'],
        );
    }
}
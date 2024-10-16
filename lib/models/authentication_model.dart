class AuthenticationModel {
  final String status, message;

  AuthenticationModel({
    required this.status,
    required this.message,
  });
  factory AuthenticationModel.fromJson(jsonData) {
    return AuthenticationModel(
      status: jsonData['status'],
      message: jsonData['message'],
    );
  }
}

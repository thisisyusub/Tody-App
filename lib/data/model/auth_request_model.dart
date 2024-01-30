import 'package:equatable/equatable.dart';

class AuthRequestModel extends Equatable {
  const AuthRequestModel({
    required this.username,
    required this.password,
  });

  final String username;
  final String password;

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'password': password,
    };
  }

  @override
  List<Object?> get props => [username, password];
}

class RegisterRequestModel extends AuthRequestModel {
  const RegisterRequestModel({
    required super.username,
    required super.password,
    required this.fullName,
  });

  final String fullName;

  @override
  Map<String, dynamic> toJson() {
    final superMap = super.toJson();
    superMap['fullName'] = fullName;
    return superMap;
  }

  @override
  List<Object?> get props => [super.props, fullName];
}

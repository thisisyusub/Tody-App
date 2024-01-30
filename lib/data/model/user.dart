import 'package:equatable/equatable.dart';

class User extends Equatable {
  const User({
    required this.id,
    required this.username,
    required this.fullName,
    this.avatarLabel,
  });

  final int id;
  final String username;
  final String fullName;
  final String? avatarLabel;

  User copyWith({
    final String? avatarLabel,
  }) {
    return User(
      id: id,
      username: username,
      fullName: fullName,
      avatarLabel: avatarLabel ?? this.avatarLabel,
    );
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as int,
      username: json['username'] as String,
      fullName: json['fullName'] as String,
    );
  }

  @override
  List<Object?> get props => [id, username, fullName, avatarLabel];
}

import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'error_response.g.dart';

@JsonSerializable()
class ErrorResponse extends Equatable {
  const ErrorResponse({
    required this.statusCode,
    required this.message,
  });

  factory ErrorResponse.fromJson(Map<String, dynamic> json) =>
      _$ErrorResponseFromJson(json);

  final int statusCode;
  final String message;

  Map<String, dynamic> toJson() => _$ErrorResponseToJson(this);

  @override
  List<Object?> get props => [statusCode, message];
}

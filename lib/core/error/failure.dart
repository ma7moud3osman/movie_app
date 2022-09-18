import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable implements Exception {
  final String message;
  const Failure({
    required this.message,
  });

  @override
  List<Object> get props => [message];
}

class ApiFailure extends Failure {
  final int statusCode;
  const ApiFailure({
    required this.statusCode,
    required super.message,
  });

  @override
  List<Object> get props => [statusCode, message];

  factory ApiFailure.fromMap(Map<String, dynamic> map) {
    return ApiFailure(
      statusCode: map['status_code'] as int,
      message: map['status_message'] as String,
    );
  }
}

class DatabaseFailure extends Failure {
  const DatabaseFailure({
    required super.message,
  });
}

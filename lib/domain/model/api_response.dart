import 'package:json_annotation/json_annotation.dart';

part 'api_response.g.dart';

@JsonSerializable(explicitToJson: true, genericArgumentFactories: true)
class ApiResponse<T> {
  ApiResponse({required this.total, required this.records});

  final int total;
  final List<T> records;

  factory ApiResponse.fromJson(
      Map<String, dynamic> json,
      T Function(Object? json) fromJsonT,
      ) {
    return _$ApiResponseFromJson<T>(json, fromJsonT);
  }

  Map<String, dynamic> toJson(Object? Function(T) toJsonT) =>
      _$ApiResponseToJson<T>(this, toJsonT);
}
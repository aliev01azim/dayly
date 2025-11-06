import 'package:json_annotation/json_annotation.dart';

class DynamicMapConverter
    implements JsonConverter<Map<dynamic, dynamic>, Map<dynamic, dynamic>> {
  const DynamicMapConverter();

  @override
  Map<dynamic, dynamic> fromJson(Map<dynamic, dynamic> json) => json;

  @override
  Map<dynamic, dynamic> toJson(Map<dynamic, dynamic> object) => object;
}
// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Contact _$ContactFromJson(Map<String, dynamic> json) {
  return Contact(
    json['name'] as String,
    json['age'] as String,
    json['job'] as String,
    json['id'] as String,
  );
}

Map<String, dynamic> _$ContactToJson(Contact instance) => <String, dynamic>{
      'name': instance.name,
      'age': instance.age,
      'job': instance.job,
      'id': instance.id,
    };

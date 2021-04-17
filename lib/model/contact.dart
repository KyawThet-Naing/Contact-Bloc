import 'package:json_annotation/json_annotation.dart';

part 'contact.g.dart';

@JsonSerializable()
class Contact {
  String name;
  String age;
  String job;
  String id;

  Contact(this.name, this.age, this.job, this.id);

  factory Contact.fromJson(Map<String, dynamic> json) =>
      _$ContactFromJson(json);

  Map<String, dynamic> toJson() => _$ContactToJson(this);
}

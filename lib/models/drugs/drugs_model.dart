import 'package:json_annotation/json_annotation.dart';

part 'drugs_model.g.dart';

@JsonSerializable()

class DrugsModel {
  @JsonKey(name: "id", defaultValue: 0)
  int? id;

  @JsonKey(name: "name", defaultValue: "")
  String? name;

  @JsonKey(name: "description", defaultValue: "")
  String? description;

  @JsonKey(name: "imageUrl", defaultValue: "")
  String? imageUrl;

  @JsonKey(name: "price", defaultValue: 0)
  int? price;

  @JsonKey(name: "quantity", defaultValue: 0)
  int? quantity;


  DrugsModel({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.price,
    required this.quantity,
  });

  factory DrugsModel.fromJson(Map<String, dynamic> json) => _$DrugsModelFromJson(json);

  Map<String, dynamic> toJson() => _$DrugsModelToJson(this);
}
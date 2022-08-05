import 'package:flutter_network_request/model/picture_model.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:flutter_network_request/model/name_model.dart';
part 'person_model.g.dart';

@JsonSerializable()
class PersonModel {
  NameModel? name;
  String? phone;
  PictureModel? picture;
  String? gender;
  String? email;
  factory PersonModel.fromJson(Map<String, dynamic> json) =>
      _$PersonModelFromJson(json);

  Map<String, dynamic> tojson() => _$PersonModelToJson(this);
  PersonModel({this.name, this.phone, this.picture, this.gender});

  //manual process of serialization of object
  /* PersonModel.fromJson(Map<String, dynamic> json)
      : name =
            "${json["name"]["title"]} ${json["name"]["first"]}${json["name"]["last"]}",
        phone = json["phone"],
        picture = json["picture"]["thumbnail"],
        gender = json["gender"],
        email = json["email"];*/
}

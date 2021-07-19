import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'social_user_model.g.dart';

@JsonSerializable()
class SocialUser extends INetworkModel {
  @JsonKey(name: "id")
  String? id;
  String? name;
  String? company;
  String? image;

  SocialUser({this.id, this.name, this.company, this.image});

  SocialUser.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    company = json['company'];
    image = json['image'];
  }

  @override
  Map<String, dynamic?> toJson() {
    return _$SocialUserToJson(this);
  }

  @override
  fromJson(Map<String, Object?> json) {
    return _$SocialUserFromJson(json);
  }
}

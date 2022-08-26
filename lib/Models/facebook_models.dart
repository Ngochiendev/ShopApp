// ignore_for_file: public_member_api_docs, sort_constructors_first
class FacebookModels {
  final String? name;
  final String? email;
  final String? id;
  final FacebookPhotoModels? facebookPhotoModels;

  FacebookModels({this.name, this.email, this.id, this.facebookPhotoModels});
  factory FacebookModels.fromJson(Map<String, dynamic> json) => FacebookModels(
        name: json['name'],
        email: json['email'],
        id: json['id'],
        facebookPhotoModels: FacebookPhotoModels.fromJson(json['picture']['data']),
      );
}

class FacebookPhotoModels {
  final String? url;
  final int? height;
  final int? width;
  FacebookPhotoModels({this.url, this.height, this.width});
  factory FacebookPhotoModels.fromJson(Map<String, dynamic> json) =>
      FacebookPhotoModels(
        url: json['url'],
        width: json['width'],
        height: json['height'],
      );
}

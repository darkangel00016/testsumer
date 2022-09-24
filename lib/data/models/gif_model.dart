import 'package:test_sumer/domain/entities/gif_entity.dart';

class GifModel extends GifEntity {
  GifModel({required super.id,required super.title, required super.height, required super.width, required super.url});

  factory GifModel.fromJson(dynamic json) {
    var image = json['images']['original'];
    return GifModel(
      id: json['id'],
      title: json['title'],
      height: image['height'],
      width: image['width'],
      url: image['url'],
    );
  }

  static List<GifModel> fromJsonResponse(List<dynamic> jsonResponse) {
    return jsonResponse.map((json) => GifModel.fromJson(json)).toList();
  }

}
import 'package:thimar_app/models/base.dart';

class CategoryModel extends Model {
  late final String name;
  late final String description;
  late final String media;

  CategoryModel.fromJson(Map<String, dynamic> json) {
    id = stringFromJson(json, 'id');
    name = stringFromJson(json, 'name');
    description = stringFromJson(json, 'description');
    media = stringFromJson(json, 'media');
  }
}




class CategoryModel {
  late final int id;
  late final String name;
  late final String description;
  late final String media;

  
  CategoryModel.fromJson(Map<String, dynamic> json){
    id = json['id'] ?? 0;
    name = json['name'] ?? "";
    description = json['description'] ?? "";
    media = json['media'] ?? "";
  }
}
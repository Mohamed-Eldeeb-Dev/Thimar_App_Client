
class SliderModel {
  late final int id;
  late final String media;

  SliderModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    media = json['media'] ?? "";
  }
}

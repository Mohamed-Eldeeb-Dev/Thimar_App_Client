part of 'sliders_cubit.dart';

class SlidersModel {
  late final List<SliderModel> list;

  SlidersModel.fromJson(Map<String, dynamic> json) {
    list = List.from(
      json['data'] ?? [],
    ).map((e) => SliderModel.fromJson(e)).toList();
  }
}

class SliderModel {
  late final int id;
  late final String media;

  SliderModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    media = json['media'] ?? "";
  }
}

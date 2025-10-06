part of 'rate_cubit.dart';
class RateModel {

  late final List<Data> data;
  late final String status;
  late final String message;
  
  RateModel.fromJson(Map<String, dynamic> json){
    data = List.from(json['data'] ?? []).map((e)=>Data.fromJson(e)).toList();
    status = json['status'] ?? '';
    message = json['message'] ?? '';
  }
}

class Data {
  late final int value;
  late final String comment;
  late final String clientName;
  late final String clientImage;
  
  Data.fromJson(Map<String, dynamic> json){
    value = json['value'] ?? 0;
    comment = json['comment'] ?? '';
    clientName = json['client_name'] ?? '';
    clientImage = json['client_image'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['value'] = value;
    _data['comment'] = comment;
    _data['client_name'] = clientName;
    _data['client_image'] = clientImage;
    return _data;
  }
}





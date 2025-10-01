part of 'login_cubit.dart';

class LoginModel {
  late final Data data;
  late final String status;
  late final String message;
  
  LoginModel.fromJson(Map<String, dynamic> json){
    data = Data.fromJson(json['data']);
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['data'] = data.toJson();
    _data['status'] = status;
    _data['message'] = message;
    return _data;
  }
}

class Data {
  late final int id;
  late final String fullname;
  late final String phone;
  late final String email;
  late final String image;
  late final int isBan;
  late final bool isActive;
  late final int unreadNotifications;
  late final String userType;
  late final String token;
  late final Null country;
  late final Null city;
  late final Null identityNumber;
  late final int userCartCount;
  
  Data.fromJson(Map<String, dynamic> json){
    id = json['id'] ?? 0;
    fullname = json['fullname'] ?? '';
    phone = json['phone'] ?? '';
    email = json['email'] ?? '';
    image = json['image'] ?? '';
    isBan = json['is_ban'] ?? 0;
    isActive = json['is_active'] ?? false;
    unreadNotifications = json['unread_notifications'] ?? 0;
    userType = json['user_type'] ?? '';
    token = json['token'] ?? '';
    country = null;
    city = null;
    identityNumber = null;
    userCartCount = json['user_cart_count'] ?? 0;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['fullname'] = fullname;
    _data['phone'] = phone;
    _data['email'] = email;
    _data['image'] = image;
    _data['is_ban'] = isBan;
    _data['is_active'] = isActive;
    _data['unread_notifications'] = unreadNotifications;
    _data['user_type'] = userType;
    _data['token'] = token;
    _data['country'] = country;
    _data['city'] = city;
    _data['identity_number'] = identityNumber;
    _data['user_cart_count'] = userCartCount;
    return _data;
  }
}
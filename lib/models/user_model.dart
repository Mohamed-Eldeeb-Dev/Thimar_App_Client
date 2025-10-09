import 'dart:convert';

import '../main.dart';
import 'base.dart';

class UserModel extends Model {
  UserModel._();

  static UserModel i = UserModel._();

  ///String
  late String fullname, phone, email, image, userType, token;
  late int unreadNotifications, userCartCount;

  late bool isBan, isActive;

  bool get isAuth => token.isNotEmpty;

  fromJson([Map<String, dynamic>? json]) {
    ///string
    id = stringFromJson(json, 'id');
    fullname = stringFromJson(json, 'fullname');
    phone = stringFromJson(json, 'phone');
    email = stringFromJson(json, 'email');
    image = stringFromJson(json, 'image');

    userType = stringFromJson(json, 'user_type');
    token = stringFromJson(json, 'token');

    ///int
    unreadNotifications = intFromJson(json, 'unread_notifications');
    userCartCount = intFromJson(json, 'user_cart_count');

    ///bool
    isBan = boolFromJson(json, 'is_ban');
    isActive = boolFromJson(json, 'is_active');

    ///Model
    // city = CityModel.fromJson(json?['city'] ?? {});
    // settings = SettingsModel.fromJson(json?['settings'] ?? {});
  }

  save() {
    Prefs.setString('user', jsonEncode(toJson()));
  }

  clear() {
    Prefs.remove('user');
    fromJson();
  }

  get() {
    try {
      String user = Prefs.getString('user') ?? '{}';
      fromJson(jsonDecode(user));
    } catch (e) {
      clear();
    }
  }

  @override
  Map<String, dynamic> toJson() => {
    ///String
    "id": id,
    "fullname": fullname,
    "phone": phone,
    "email": email,
    "image": image,
    "userType": userType,
    "token": token,

    //int
    "unread_notifications": unreadNotifications,
    "user_cart_count": userCartCount,

    ///bool
    "is_ban": isBan,
    "is_active": isActive,

    ///Model
    // "city": city.toJson(),
    // "settings": settings.toJson(),
  };
}

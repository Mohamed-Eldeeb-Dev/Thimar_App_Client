class LoginModel {
  LoginModel({required this.data, required this.status, required this.message});

  final Data? data;
  final String? status;
  final String? message;

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      data: json["data"] == null ? null : Data.fromJson(json["data"]),
      status: json["status"],
      message: json["message"],
    );
  }
}

class Data {
  Data({
    required this.id,
    required this.fullname,
    required this.phone,
    required this.email,
    required this.image,
    required this.isBan,
    required this.isActive,
    required this.unreadNotifications,
    required this.userType,
    required this.token,
    required this.country,
    required this.city,
    required this.identityNumber,
    required this.userCartCount,
  });

  final int? id;
  final String? fullname;
  final String? phone;
  final String? email;
  final String? image;
  final int? isBan;
  final bool? isActive;
  final int? unreadNotifications;
  final String? userType;
  final String? token;
  final dynamic country;
  final dynamic city;
  final dynamic identityNumber;
  final int? userCartCount;

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      id: json["id"] ?? 0,
      fullname: json["fullname"] ?? "",
      phone: json["phone"] ?? "",
      email: json["email"] ?? "",
      image: json["image"] ?? "",
      isBan: json["is_ban"] ?? 0,
      isActive: json["is_active"] ?? false,
      unreadNotifications: json["unread_notifications"] ?? 0,
      userType: json["user_type"] ?? "",
      token: json["token"] ?? "",
      country: json["country"] ?? "",
      city: json["city"] ?? "",
      identityNumber: json["identity_number"] ?? "",
      userCartCount: json["user_cart_count"] ?? 0,
    );
  }
}

import 'package:thimar_app/models/base.dart';

class ProductModel {
  late final List<Product> products;
  late final int userCartCount;
  late final num maxPrice;
  late final double minPrice;

  ProductModel.fromJson(Map<String, dynamic> json) {
    products = List.from(json['data']).map((e) => Product.fromJson(e)).toList();
    userCartCount = json['user_cart_count'] ?? 0;
    maxPrice = json['max_price'] ?? 0;
    minPrice = json['min_price'] ?? 0.0;
  }
}

class Product extends Model {
  late final int categoryId;

  late final String title;
  late final String description;
  late final String code;
  late final double priceBeforeDiscount;
  late final double price;
  late final double discount;
  late final double amount;
  late final int isActive;
  late final bool isFavorite;
  late final Unit unit;
  late final List<Images> images;
  late final String mainImage;
  late final String createdAt;

  Product.fromJson(Map<String, dynamic> json) {
    id = stringFromJson(json, 'id');
    categoryId = intFromJson(json, 'category_id');
    title = stringFromJson(json, 'title');
    description = stringFromJson(json, 'description');
    code = stringFromJson(json, 'code');
    priceBeforeDiscount = doubleFromJson(json, 'price_before_discount');
    price = doubleFromJson(json, 'price');
    discount = doubleFromJson(json, 'discount');
    amount = doubleFromJson(json, 'amount');
    isActive = intFromJson(json, 'is_active');
    isFavorite = boolFromJson(json, 'is_favorite');
    unit = Unit.fromJson(json['unit'] ?? {});
    images = listFromJson(json, 'images', callback: Images.fromJson);
    mainImage = stringFromJson(json, 'main_image');
    createdAt = stringFromJson(json, 'created_at');
  }
}

class Unit extends Model {
  late final String name;
  late final String type;
  late final String createdAt;
  late final String updatedAt;

  Unit.fromJson(Map<String, dynamic> json) {
    id = stringFromJson(json, 'id');
    name = stringFromJson(json, 'name');
    type = stringFromJson(json, 'type');
    createdAt = stringFromJson(json, 'created_at');
    updatedAt = stringFromJson(json, 'updated_at');
  }
}

class Images {
  late final String name;
  late final String url;

  Images.fromJson(Map<String, dynamic> json) {
    name = json['name'] ?? "";
    url = json['url'] ?? "";
  }
}

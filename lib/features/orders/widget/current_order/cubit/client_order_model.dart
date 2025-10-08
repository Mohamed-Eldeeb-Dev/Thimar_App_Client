part of 'client_order_cubit.dart';
class ClientOrderModel {
  late final List<OrderModel> data;
  late final Links links;
  late final Meta meta;
  late final String status;
  late final String message;
  
  ClientOrderModel.fromJson(Map<String, dynamic> json){
    data = List.from(json['data']).map((e)=>OrderModel.fromJson(e)).toList();
    links = Links.fromJson(json['links']);
    meta = Meta.fromJson(json['meta']);
    status = json['status'];
    message = json['message'];
  }
}

class OrderModel {
  late final int id;
  late final String status;
  late final String date;
  late final String time;
  late final double orderPrice;
  late final double deliveryPrice;
  late final double totalPrice;
  late final String clientName;
  late final String phone;
  late final String location;
  late final String deliveryPayer;
  late final List<Products> products;
  late final String payType;
  late final String note;
  late final int isVip;
  late final int vipDiscountPercentage;
  
  OrderModel.fromJson(Map<String, dynamic> json){
    id = json['id'] ?? 0;
    status = json['status'] ?? '';
    date = json['date'] ?? '';
    time = json['time'] ?? '';
    orderPrice = json['order_price'] ?? 0.0;
    deliveryPrice = json['delivery_price'] ?? 0.0;
    totalPrice = json['total_price'] ?? 0.0;
    clientName = json['client_name'] ?? '';
    phone = json['phone'] ?? '';
    location = json['location'] ?? '';
    deliveryPayer = json['delivery_payer'] ?? '';
    products = List.from(json['products']??[]).map((e)=>Products.fromJson(e)).toList();
    payType = json['pay_type'] ?? '';
    note = json['note'] ?? '';
    isVip = json['is_vip'] ?? 0;
    vipDiscountPercentage = json['vip_discount_percentage'] ?? 0;
  }
}

class Products {
  late final String name;
  late final String url;
  
  Products.fromJson(Map<String, dynamic> json){
    name = json['name'];
    url = json['url'];
  }
}

class Links {
  late final String first;
  late final String last;
  late final Null prev;
  late final Null next;
  
  Links.fromJson(Map<String, dynamic> json){
    first = json['first'];
    last = json['last'];
    prev = null;
    next = null;
  }
}

class Meta {
  late final int currentPage;
  late final Null from;
  late final int lastPage;
  late final List<Links> links;
  late final String path;
  late final int perPage;
  late final Null to;
  late final int total;
  
  Meta.fromJson(Map<String, dynamic> json){
    currentPage = json['current_page'];
    from = null;
    lastPage = json['last_page'];
    links = List.from(json['links']).map((e)=>Links.fromJson(e)).toList();
    path = json['path'];
    perPage = json['per_page'];
    to = null;
    total = json['total'];
  }
}
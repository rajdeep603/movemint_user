// To parse this JSON data, do
//
//     final getItemDataResponseModel = getItemDataResponseModelFromMap(jsonString);

import 'dart:convert';

GetOrdersModel getItemDataResponseModelFromMap(String str) =>
    GetOrdersModel.fromMap(json.decode(str));

String getItemDataResponseModelToMap(GetOrdersModel data) =>
    json.encode(data.toMap());

class GetOrdersModel {
  bool? success;
  List<Order>? orders;

  GetOrdersModel({
    this.success,
    this.orders,
  });

  factory GetOrdersModel.fromMap(Map<String, dynamic> json) => GetOrdersModel(
        success: json["success"],
        orders: json["orders"] == null
            ? []
            : List<Order>.from(json["orders"]!.map((x) => Order.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "success": success,
        "orders": orders == null
            ? []
            : List<dynamic>.from(orders!.map((x) => x.toMap())),
      };
}

class Order {
  String? id;
  String? userId;
  DateTime? datetime;
  String? from;
  String? to;
  String? city;
  String? vehicle;
  String? driver;
  int? total;
  String? status;
  List<Datum>? data;
  Payment? payment;
  int? orderId;

  Order({
    this.id,
    this.userId,
    this.datetime,
    this.from,
    this.to,
    this.city,
    this.vehicle,
    this.driver,
    this.total,
    this.status,
    this.data,
    this.payment,
    this.orderId,
  });

  factory Order.fromMap(Map<String, dynamic> json) => Order(
        id: json["_id"],
        userId: json["userId"],
        datetime:
            json["datetime"] == null ? null : DateTime.parse(json["datetime"]),
        from: json["from"],
        to: json["to"],
        city: json["city"],
        vehicle: json["vehicle"],
        driver: json["driver"],
        total: json["total"],
        status: json["status"],
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromMap(x))),
        payment:
            json["payment"] == null ? null : Payment.fromMap(json["payment"]),
        orderId: json["orderId"],
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "userId": userId,
        "datetime": datetime?.toIso8601String(),
        "from": from,
        "to": to,
        "city": city,
        "vehicle": vehicle,
        "driver": driver,
        "total": total,
        "status": status,
        "data":
            data == null ? [] : List<dynamic>.from(data!.map((x) => x.toMap())),
        "payment": payment?.toMap(),
        "orderId": orderId,
      };
}

class Datum {
  String? categoryId;
  String? subcategoryId;
  List<Item>? items;
  String? id;

  Datum({
    this.categoryId,
    this.subcategoryId,
    this.items,
    this.id,
  });

  factory Datum.fromMap(Map<String, dynamic> json) => Datum(
        categoryId: json["category_id"],
        subcategoryId: json["subcategory_id"],
        items: json["items"] == null
            ? []
            : List<Item>.from(json["items"]!.map((x) => Item.fromMap(x))),
        id: json["_id"],
      );

  Map<String, dynamic> toMap() => {
        "category_id": categoryId,
        "subcategory_id": subcategoryId,
        "items": items == null
            ? []
            : List<dynamic>.from(items!.map((x) => x.toMap())),
        "_id": id,
      };
}

class Item {
  String? item;
  int? qty;
  String? id;

  Item({
    this.item,
    this.qty,
    this.id,
  });

  factory Item.fromMap(Map<String, dynamic> json) => Item(
        item: json["item"],
        qty: json["qty"],
        id: json["_id"],
      );

  Map<String, dynamic> toMap() => {
        "item": item,
        "qty": qty,
        "_id": id,
      };
}

class Payment {
  String? paymentType;
  String? paymentId;
  String? id;

  Payment({
    this.paymentType,
    this.paymentId,
    this.id,
  });

  factory Payment.fromMap(Map<String, dynamic> json) => Payment(
        paymentType: json["paymentType"],
        paymentId: json["paymentId"],
        id: json["_id"],
      );

  Map<String, dynamic> toMap() => {
        "paymentType": paymentType,
        "paymentId": paymentId,
        "_id": id,
      };
}

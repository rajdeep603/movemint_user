// To parse this JSON data, do
//
//     final createOrderRequestModel = createOrderRequestModelFromMap(jsonString);

import 'dart:convert';

CreateOrderRequestModel createOrderRequestModelFromMap(String str) =>
    CreateOrderRequestModel.fromMap(json.decode(str));

String createOrderRequestModelToMap(CreateOrderRequestModel data) =>
    json.encode(data.toMap());

class CreateOrderRequestModel {
  DateTime? datetime;
  String? from;
  String? to;
  String? city;
  List<ProductDetail>? data;
  String? total;
  String? pickLat;
  String? pickLng;
  String? dropLat;
  String? dropLng;

  CreateOrderRequestModel({
    this.datetime,
    this.from,
    this.to,
    this.city,
    this.data,
    this.total,
    this.pickLat,
    this.pickLng,
    this.dropLat,
    this.dropLng,
  });

  factory CreateOrderRequestModel.fromMap(Map<String, dynamic> json) =>
      CreateOrderRequestModel(
        datetime:
            json["datetime"] == null ? null : DateTime.parse(json["datetime"]),
        from: json["from"],
        to: json["to"],
        city: json["city"],
        data: json["data"] == null
            ? []
            : List<ProductDetail>.from(
                json["data"]!.map((x) => ProductDetail.fromMap(x))),
        total: json["total"],
        pickLat: json["pick_lat"],
        pickLng: json["pick_lng"],
        dropLat: json["drop_lat"],
        dropLng: json["drop_lng"],
      );

  Map<String, dynamic> toMap() => {
        "datetime":
            "${datetime!.year.toString().padLeft(4, '0')}-${datetime!.month.toString().padLeft(2, '0')}-${datetime!.day.toString().padLeft(2, '0')}",
        "from": from,
        "to": to,
        "city": city,
        "data":
            data == null ? [] : List<dynamic>.from(data!.map((x) => x.toMap())),
        "total": total,
        "pick_lat": pickLat,
        "pick_lng": pickLng,
        "drop_lat": dropLat,
        "drop_lng": dropLng,
      };
}

class ProductDetail {
  String? categoryName;
  String? categoryId;
  String? subcategoryId;
  List<ItemData>? items;
  bool? doesItemsHaveQty;

  ProductDetail({
    this.categoryName,
    this.categoryId,
    this.subcategoryId,
    this.items,
    this.doesItemsHaveQty,
  });

  factory ProductDetail.fromMap(Map<String, dynamic> json) => ProductDetail(
        categoryName: json["category_name"],
        categoryId: json["category_id"],
        subcategoryId: json["subcategory_id"],
        items: json["items"] == null
            ? []
            : List<ItemData>.from(
                json["items"]!.map((x) => DataItem.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "category_name": categoryName,
        "category_id": categoryId,
        "subcategory_id": subcategoryId,
        "items": items == null
            ? []
            : List<dynamic>.from(items!.map((x) => x.toMap())),
      };
}

class DataItem {
  String? subcategoryName;
  String? subcategoryId;
  List<ItemData>? items;

  DataItem({
    this.subcategoryName,
    this.subcategoryId,
    this.items,
  });

  factory DataItem.fromMap(Map<String, dynamic> json) => DataItem(
        subcategoryName: json["subcategory_name"],
        subcategoryId: json["subcategory_id"],
        items: json["items"] == null
            ? []
            : List<ItemData>.from(
                json["items"]!.map((x) => ItemData.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "subcategory_name": subcategoryName,
        "subcategory_id": subcategoryId,
        "items": items == null
            ? []
            : List<dynamic>.from(items!.map((x) => x.toMap())),
      };
}

class ItemData {
  String? id;
  String? name;
  String? pricePerKm;
  int? qty;

  ItemData({
    this.id,
    this.name,
    this.pricePerKm,
    this.qty,
  });

  factory ItemData.fromMap(Map<String, dynamic> json) => ItemData(
        id: json["_id"],
        name: json["name"],
        pricePerKm: json["price_per_km"],
        qty: json["qty"],
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "name": name,
        "price_per_km": pricePerKm,
        "qty": qty,
      };
}

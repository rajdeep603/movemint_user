import 'dart:convert';

GetItemDataResponseModel getItemDataResponseModelFromMap(String str) =>
    GetItemDataResponseModel.fromMap(json.decode(str));

String getItemDataResponseModelToMap(GetItemDataResponseModel data) =>
    json.encode(data.toMap());

class GetItemDataResponseModel {
  bool? success;
  String? message;
  List<ItemData>? data;

  GetItemDataResponseModel({
    this.success,
    this.message,
    this.data,
  });

  factory GetItemDataResponseModel.fromMap(Map<String, dynamic> json) =>
      GetItemDataResponseModel(
        success: json["success"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<ItemData>.from(
                json["data"]!.map((x) => ItemData.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "success": success,
        "message": message,
        "data":
            data == null ? [] : List<dynamic>.from(data!.map((x) => x.toMap())),
      };
}

class ItemData {
  String? categoryName;
  String? categoryId;
  List<DatumItem>? items;
  bool? doesItemsHaveQty;

  ItemData(
      {this.categoryName, this.categoryId, this.items, this.doesItemsHaveQty});

  factory ItemData.fromMap(Map<String, dynamic> json) => ItemData(
        categoryName: json["category_name"],
        categoryId: json["category_id"],
        items: json["items"] == null
            ? []
            : List<DatumItem>.from(
                json["items"]!.map((x) => DatumItem.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "category_name": categoryName,
        "category_id": categoryId,
        "items": items == null
            ? []
            : List<dynamic>.from(items!.map((x) => x.toMap())),
      };
}

class DatumItem {
  String? subcategoryName;
  String? subcategoryId;
  List<ItemItem>? items;

  DatumItem({
    this.subcategoryName,
    this.subcategoryId,
    this.items,
  });

  factory DatumItem.fromMap(Map<String, dynamic> json) => DatumItem(
        subcategoryName: json["subcategory_name"],
        subcategoryId: json["subcategory_id"],
        items: json["items"] == null
            ? []
            : List<ItemItem>.from(
                json["items"]!.map((x) => ItemItem.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "subcategory_name": subcategoryName,
        "subcategory_id": subcategoryId,
        "items": items == null
            ? []
            : List<dynamic>.from(items!.map((x) => x.toMap())),
      };
}

// class ItemItem {
//   String? id;
//   String? name;
//   String? pricePerKm;
//
//   ItemItem({
//     this.id,
//     this.name,
//     this.pricePerKm,
//   });
//
//   factory ItemItem.fromMap(Map<String, dynamic> json) => ItemItem(
//         id: json["_id"],
//         name: json["name"],
//         pricePerKm: json["price_per_km"],
//       );
//
//   Map<String, dynamic> toMap() => {
//         "_id": id,
//         "name": name,
//         "price_per_km": pricePerKm,
//       };
// }
class ItemItem {
  String? id;
  String? name;
  String? pricePerKm;
  int? qty;

  ItemItem({
    this.id,
    this.name,
    this.pricePerKm,
    this.qty,
  });

  factory ItemItem.fromMap(Map<String, dynamic> json) => ItemItem(
        id: json["_id"],
        name: json["name"],
        pricePerKm: json["price_per_km"],
        qty: json["qty"] != null ? int.tryParse(json["qty"].toString()) : null,
      );

  Map<String, dynamic> toMap() => {
        "_id": id,
        "name": name,
        "price_per_km": pricePerKm,
        "qty": qty,
      };
}

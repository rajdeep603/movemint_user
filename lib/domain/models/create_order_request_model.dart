class CreateOrderModel {
  CreateOrderModel({
    required this.datetime,
    required this.from,
    required this.to,
    required this.city,
    required this.productDetail,
    required this.totalPrice,
    required this.pickLat,
    required this.pickLng,
    required this.dropLat,
    required this.dropLng,
  });

  DateTime? datetime;
  String from;
  String to;
  String city;
  List<ProductDetailModel> productDetail;
  String totalPrice;
  String pickLat;
  String pickLng;
  String dropLat;
  String dropLng;

  factory CreateOrderModel.fromMap(Map<String, dynamic> json) =>
      CreateOrderModel(
        datetime:
            json['datetime'] == null ? null : DateTime.parse(json['datetime']),
        from: json['from'] ?? '',
        to: json['to'] ?? '',
        city: json['city'] ?? '',
        productDetail: json['data'] == null
            ? <ProductDetailModel>[]
            : List<ProductDetailModel>.from(
                json['data']!.map((x) => ProductDetailModel.fromMap(x))),
        totalPrice: json['total_price'] ?? '',
        pickLat: json['pick_lat'] ?? '',
        pickLng: json['pick_lng'] ?? '',
        dropLat: json['drop_lat'] ?? '',
        dropLng: json['drop_lng'] ?? '',
      );

  Map<String, dynamic> toMap() => <String, dynamic>{
        'datetime':
            "${datetime!.year.toString().padLeft(4, '0')}-${datetime!.month.toString().padLeft(2, '0')}-${datetime!.day.toString().padLeft(2, '0')}",
        'from': from,
        'to': to,
        'city': city,
        'data': List<dynamic>.from(
            productDetail.map((ProductDetailModel x) => x.toMap())),
        'total_price': totalPrice,
        'pick_lat': pickLat,
        'pick_lng': pickLng,
        'drop_lat': dropLat,
        'drop_lng': dropLng
      };
}

class ProductDetailModel {
  ProductDetailModel({
    required this.name,
    required this.items,
    this.doesItemsHaveQty = false,
  });

  String name;
  List<ItemModel> items;
  bool doesItemsHaveQty;

  factory ProductDetailModel.fromMap(Map<String, dynamic> json) =>
      ProductDetailModel(
        name: json['name'] ?? '',
        items: json['items'] == null
            ? <ItemModel>[]
            : List<ItemModel>.from(
                json['items']!.map((x) => ItemModel.fromMap(x))),
      );

  Map<String, dynamic> toMap() => <String, dynamic>{
        'name': name,
        'items': List<dynamic>.from(items.map((ItemModel x) => x.toMap())),
      };
}

class ItemModel {
  ItemModel({
    required this.name,
    required this.qty,
  });

  String name;
  int qty;

  factory ItemModel.fromMap(Map<String, dynamic> json) => ItemModel(
        name: json['name'] ?? '',
        qty: json['qty'] ?? 0,
      );

  Map<String, dynamic> toMap() => <String, dynamic>{
        'name': name,
        'qty': qty,
      };
}

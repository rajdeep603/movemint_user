class CreateOrderModel {
  CreateOrderModel({
    required this.datetime,
    required this.from,
    required this.to,
    required this.city,
    required this.productDetail,
    required this.totalPrice,
  });

  DateTime? datetime;
  String from;
  String to;
  String city;
  List<ProductDetailModel> productDetail;
  String totalPrice;

  factory CreateOrderModel.fromMap(Map<String, dynamic> json) =>
      CreateOrderModel(
        datetime:
            json['datetime'] == null ? null : DateTime.parse(json['datetime']),
        from: json['from'] ?? '',
        to: json['to'] ?? '',
        city: json['city'] ?? '',
        productDetail: json['data'] == null
            ? <ProductDetailModel>[]
            : List<ProductDetailModel>.from(json['data']!.map((x) => ProductDetailModel.fromMap(x))),
        totalPrice: json['total_price'] ?? '',
      );

  Map<String, dynamic> toMap() => <String, dynamic>{
        'datetime':
            "${datetime!.year.toString().padLeft(4, '0')}-${datetime!.month.toString().padLeft(2, '0')}-${datetime!.day.toString().padLeft(2, '0')}",
        'from': from,
        'to': to,
        'city': city,
        'data': List<dynamic>.from(productDetail.map((ProductDetailModel x) => x.toMap())),
        'total_price': totalPrice,
      };
}

class ProductDetailModel {
  ProductDetailModel({
    required this.name,
    required this.items,
  });

  String name;
  List<ItemModel> items;

  factory ProductDetailModel.fromMap(Map<String, dynamic> json) => ProductDetailModel(
        name: json['name'],
        items: json['items'] == null
            ? <ItemModel>[]
            : List<ItemModel>.from(json['items']!.map((x) => ItemModel.fromMap(x))),
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

class GetOrdersModel {
  bool? success;
  List<Order> orders;

  GetOrdersModel({
    this.success,
    this.orders = const [],
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
  int? orderId;
  DateTime? datetime;
  String? from;
  String? to;
  String? city;
  List<Datum>? data;
  int? totalPrice;
  int? v;
  String? status;

  Order({
    this.id,
    this.userId,
    this.orderId,
    this.datetime,
    this.from,
    this.to,
    this.city,
    this.data,
    this.totalPrice,
    this.v,
    this.status,
  });

  factory Order.fromMap(Map<String, dynamic> json) => Order(
      id: json["_id"],
      userId: json["userId"],
      orderId: json["orderId"],
      datetime:
          json["datetime"] == null ? null : DateTime.parse(json["datetime"]),
      from: json["from"],
      to: json["to"],
      city: json["city"],
      data: json["data"] == null
          ? []
          : List<Datum>.from(json["data"]!.map((x) => Datum.fromMap(x))),
      totalPrice: json["total_price"],
      v: json["__v"],
      status: json["status"]);

  Map<String, dynamic> toMap() => {
        "_id": id,
        "userId": userId,
        "orderId": orderId,
        "datetime": datetime?.toIso8601String(),
        "from": from,
        "to": to,
        "city": city,
        "data":
            data == null ? [] : List<dynamic>.from(data!.map((x) => x.toMap())),
        "total_price": totalPrice,
        "__v": v,
        "status": status,
      };
}

class Datum {
  String? name;
  List<Item>? items;
  String? id;

  Datum({
    this.name,
    this.items,
    this.id,
  });

  factory Datum.fromMap(Map<String, dynamic> json) => Datum(
        name: json["name"],
        items: json["items"] == null
            ? []
            : List<Item>.from(json["items"]!.map((x) => Item.fromMap(x))),
        id: json["_id"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "items": items == null
            ? []
            : List<dynamic>.from(items!.map((x) => x.toMap())),
        "_id": id,
      };
}

class Item {
  String? name;
  int? qty;
  String? id;

  Item({
    this.name,
    this.qty,
    this.id,
  });

  factory Item.fromMap(Map<String, dynamic> json) => Item(
        name: json["name"],
        qty: json["qty"],
        id: json["_id"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "qty": qty,
        "_id": id,
      };
}

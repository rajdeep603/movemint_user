// ignore_for_file: sort_constructors_first, avoid_dynamic_calls

class CreateOrderRazorPayResponseModel {
  CreateOrderRazorPayResponseModel({
    this.orderId,
    this.entity,
    this.amount,
    this.amountPaid,
    this.amountDue,
    this.currency,
    this.receipt,
    this.offerId,
    this.status,
    this.attempts,
    this.notes,
    this.createdAt,
  });

  String? orderId;
  String? entity;
  int? amount;
  int? amountPaid;
  int? amountDue;
  String? currency;
  String? receipt;
  dynamic offerId;
  String? status;
  int? attempts;
  List<dynamic>? notes;
  int? createdAt;

  factory CreateOrderRazorPayResponseModel.fromMap(Map<String, dynamic> json) =>
      CreateOrderRazorPayResponseModel(
        orderId: json['id'],
        entity: json['entity'],
        amount: json['amount'],
        amountPaid: json['amount_paid'],
        amountDue: json['amount_due'],
        currency: json['currency'],
        receipt: json['receipt'],
        offerId: json['offer_id'],
        status: json['status'],
        attempts: json['attempts'],
        notes: json['notes'] == null
            ? <dynamic>[]
            : List<dynamic>.from(json['notes']!.map((dynamic x) => x)),
        createdAt: json['created_at'],
      );

  Map<String, dynamic> toMap() => <String, dynamic>{
        'id': orderId,
        'entity': entity,
        'amount': amount,
        'amount_paid': amountPaid,
        'amount_due': amountDue,
        'currency': currency,
        'receipt': receipt,
        'offer_id': offerId,
        'status': status,
        'attempts': attempts,
        'notes': notes == null
            ? <dynamic>[]
            : List<dynamic>.from(notes!.map((dynamic x) => x)),
        'created_at': createdAt,
      };
}

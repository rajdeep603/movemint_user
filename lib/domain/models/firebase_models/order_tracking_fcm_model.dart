class OrderTrackingFcmModel {
  OrderTrackingFcmModel({
    this.latitude,
    this.longitude,
    this.orderId,
  });

  final double? latitude;
  final double? longitude;
  final String? orderId;

  static OrderTrackingFcmModel fromMap(Map<String, dynamic> map) {
    return OrderTrackingFcmModel(
      latitude: map['latitude'],
      longitude: map['longitude'],
      orderId: map['orderId'],
    );
  }

  // Convert VideoConsultationEndModel to Map
  Map<String, dynamic> toMap() => <String, dynamic>{
        if (latitude != null) 'latitude': latitude,
        if (longitude != null) 'longitude': longitude,
        if (orderId != null) 'orderId': orderId,
      };
}

import 'package:cloud_firestore/cloud_firestore.dart';

import '../../core/utils/logger.dart';
import '../models/firebase_models/order_tracking_fcm_model.dart';

class FireStoreServices {
  factory FireStoreServices() {
    return _singleton;
  }

  FireStoreServices._internal();

  static final FireStoreServices _singleton = FireStoreServices._internal();

  static const String _orderTrackingCollection = 'order_tracking';

  Stream<OrderTrackingFcmModel?>? getOrderTrackingStream(String orderId) {
    try {
      final DocumentReference<Map<String, dynamic>> appointmentRef =
          FirebaseFirestore.instance
              .collection(_orderTrackingCollection)
              .doc(orderId);

      return appointmentRef
          .snapshots()
          .map((DocumentSnapshot<Map<String, dynamic>> snapshot) {
        if (snapshot.exists && snapshot.data() != null) {
          return OrderTrackingFcmModel.fromMap(snapshot.data()!);
        } else {
          return null;
        }
      });
    } on Exception catch (e) {
      Logger.logError(e);
      return null;
    }
  }
}

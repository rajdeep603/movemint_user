// ignore_for_file: avoid_dynamic_calls
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

import '../../core/utils/logger.dart';
import 'api_services.dart';
import 'common_api_call.dart';

class RazorpayService {
  late Razorpay _razorpay;

  final String razorPayKey = dotenv.get('RAZOR_KEY');
  final String razorPaySecret = dotenv.get('RAZOR_SECRET');

  void initializeRazorpay({
    required void Function(PaymentSuccessResponse response)
        handlePaymentSuccess,
    required void Function(PaymentFailureResponse response) handlePaymentError,
    required void Function(ExternalWalletResponse response)
        handleExternalWallet,
  }) {
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handleExternalWallet);
  }

  Future<void> startPayment({
    required double amount,
    required String description,
    required String orderId,
  }) async {
    late Map<String, dynamic> options;
    try {
      options = <String, dynamic>{
        'key': razorPayKey,
        'amount': amount * 100,
        // Amount is in currency subunits (i.e., paisa)
        'name': 'Medica',
        'description': description,
        'order_id': orderId,
        'timeout': 120,
        // in seconds
        'prefill': <String, String>{
          'contact': '9012965839',
          'email': 'himanshubora98@gmail.com'
        },
        'external': <String, List<String>>{
          'wallets': <String>[],
        },
        'checkout': <String, Map<String, int>>{
          'method': <String, int>{
            'netbanking': 1,
            'card': 1,
            'upi': 0,
            'wallet': 0
          }
        }
      };
    } catch (e) {
      Logger.log('Error starting Razorpay payment: $e');
    }
    try {
      _razorpay.open(options);
    } catch (e) {
      Logger.log('Error _razorpay.open: $e');
    }
  }

  Future<CustomResponse> createOrder({
    required num amount,
  }) async {
    final CustomResponse customResponse =
        await ApiServices().razorPayApi(amount, 'rcp_id_1');
    return customResponse;
  }

  void dispose() {
    _razorpay.clear(); // Clear listeners and dispose of the Razorpay instance
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class RazorpayService {
  late Razorpay _razorpay;
  final BuildContext context;

  RazorpayService({required this.context}) {
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  void startPayment(int amount) {
    final razorPayApiKey = dotenv.env['RAZORPAY_API_KEY'];
    if (razorPayApiKey == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Payment Error: API key not found')),
      );
      return;
    }

    var options = {
      'key': razorPayApiKey,
      'amount': amount * 100,
      'name': 'Kicks',
      'description': 'Order Payment',
      'prefill': {
        'contact': '9876543210',
        'email': 'test@razorpay.com',
      },
      'method': {
        'upi': true,
        'card': true,
        'netbanking': true,
        'wallet': false,
      }
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      debugPrint('Error in Razorpay: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    }
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Payment Successful: ${response.paymentId}")),
    );
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Payment Failed: ${response.code} - ${response.message}")),
    );
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("External Wallet: ${response.walletName}")),
    );
  }

  void dispose() {
    _razorpay.clear();
  }
}

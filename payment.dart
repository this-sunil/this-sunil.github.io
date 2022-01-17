import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class Payment extends StatefulWidget {
  const Payment({Key? key}) : super(key: key);

  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  TextEditingController controller = TextEditingController();
  var razor = Razorpay();
  String? res, payid, ne;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    setState(() {
      razor = Razorpay();
      razor.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
      razor.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
      razor.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    });
  }

  void dispose() {
    super.dispose();
    razor.clear();
  }

  void openPay(int amount) async {
    var options = {
      'key': 'rzp_test_YumDpT3oLYCOLx',
      'amount': amount * 100,
      'name': 'Acme Corp.',
      'description': 'Fine T-Shirt',
      'prefill': {'contact': '9762673744', 'email': 'test@razorpay.com'}
    };
    razor.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);

    try {
      razor.open(options);
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Payment Integration"),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(15),
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                  hintText: 'Amount',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20))),
            ),
          ),
          ElevatedButton(
              onPressed: () {
                openPay(int.parse(controller.text));
                print(res.toString());
              },
              child: Text("PAY"))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            razor.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
            print("respinse for signture " + res.toString());
            print("payment ID" + ne.toString());
            print("order ID " + payid.toString());
          });
        },
      ),
    );
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    // Do something when payment succeeds'
    res = response.signature.toString();
    payid = response.orderId.toString();
    ne = response.paymentId.toString();
    print("Payment Done");
    print(response.paymentId);
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    // Do something when payment fails
    print("payment error");
    print(response.code.toString());
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // Do something when an external wallet was selected
    print("error");

    print(response.walletName);
  }
}

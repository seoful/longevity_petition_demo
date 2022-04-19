import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:in_time_petition_demo/components/animated_button.dart';
import 'package:in_time_petition_demo/core/routes/donate_routes.dart';

import '../../../core/utils.dart';

class CreditCardPaymentSubScreen extends StatefulWidget {
  CreditCardPaymentSubScreen({Key? key}) : super(key: key);

  @override
  State<CreditCardPaymentSubScreen> createState() =>
      _CreditCardPaymentSubScreenState();
}

class _CreditCardPaymentSubScreenState
    extends State<CreditCardPaymentSubScreen> {
  final _formKey = GlobalKey<FormState>();

  String _cardNumber = '';
  String _expiryDate = '';
  String _cardHolderName = '';
  String _cvvCode = '';
  InputBorder? border;

  @override
  void initState() {
    border = UnderlineInputBorder(
      borderSide: BorderSide(
        color: Colors.grey.withOpacity(0.7),
        width: 2.0,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      children: [
        const Text(
          "Pay with Credit Card",
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 21,
            // letterSpacing: 1,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        CreditCardForm(
          cardNumber: _cardNumber,
          expiryDate: _expiryDate,
          cvvCode: _cvvCode,
          cardHolderName: _cardHolderName,
          themeColor: Colors.black,
          formKey: _formKey,
          cardNumberDecoration: InputDecoration(
            labelText: 'Number',
            hintText: '**** **** **** ****',
            hintStyle: const TextStyle(color: Colors.black),
            labelStyle: const TextStyle(color: Colors.black),
            focusedBorder: border,
            enabledBorder: border,
          ),
          expiryDateDecoration: InputDecoration(
            hintStyle: const TextStyle(color: Colors.black),
            labelStyle: const TextStyle(color: Colors.black),
            focusedBorder: border,
            enabledBorder: border,
            labelText: 'Expired Date',
            hintText: '**/**',
          ),
          cvvCodeDecoration: InputDecoration(
            hintStyle: const TextStyle(color: Colors.black),
            labelStyle: const TextStyle(color: Colors.black),
            focusedBorder: border,
            enabledBorder: border,
            labelText: 'CVV',
            hintText: '***',
          ),
          cardHolderDecoration: InputDecoration(
            hintStyle: const TextStyle(color: Colors.black),
            labelStyle: const TextStyle(color: Colors.black),
            focusedBorder: border,
            enabledBorder: border,
            labelText: 'Card Holder',
          ),
          onCreditCardModelChange: _onCreditCardModelChange,
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            AnimatedButton(
              onTap: () {
                Utils.donateNavigatorKey.currentState?.pop();
              },
              child: Container(
                padding: const EdgeInsets.all(10),
                width: 70,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.white,
                  border: Border.all(color: Utils.accentColor, width: 1),
                  // boxShadow: [
                  //   BoxShadow(
                  //     color: Colors.grey.withOpacity(0.3),
                  //     spreadRadius: 3,
                  //     blurRadius: 10,
                  //   ),
                  // ],
                ),
                child: const Center(
                  child: Text(
                    "Back",
                    style: TextStyle(
                        color: Utils.accentColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 16),
                  ),
                ),
              ),
            ),
            AnimatedButton(
              onTap: () {
                if (_formKey.currentState?.validate() ?? false) {
                  Utils.donateNavigatorKey.currentState
                      ?.pushNamed(DonateRoutes.paymentDone);
                }
              },
              child: Container(
                width: 70,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Utils.accentColor,
                  // boxShadow: [
                  //   BoxShadow(
                  //     color: Colors.grey.withOpacity(0.3),
                  //     spreadRadius: 3,
                  //     blurRadius: 10,
                  //   ),
                  // ],
                ),
                child: const Center(
                  child: Text(
                    "Ok",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 16),
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }

  void _onCreditCardModelChange(CreditCardModel? creditCardModel) {
    setState(() {
      _cardNumber = creditCardModel!.cardNumber;
      _expiryDate = creditCardModel.expiryDate;
      _cardHolderName = creditCardModel.cardHolderName;
      _cvvCode = creditCardModel.cvvCode;
    });
  }
}

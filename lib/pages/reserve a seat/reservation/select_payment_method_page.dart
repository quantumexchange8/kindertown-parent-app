// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:kindertown_parent_app/component/primary_appbar.dart';
import 'package:kindertown_parent_app/helper/text_styles.dart';
import 'package:kindertown_parent_app/models/credit_card.dart';
import 'package:kindertown_parent_app/pages/reserve%20a%20seat/reservation/widgets/show_select_form_column.dart';

final List<CreditCard> creditCardList = [
  CreditCard(
      id: 1,
      bankName: 'PUBLIC BANK BERHAD',
      cardType: 'visa',
      cardNo: '1231 3233 7657 3331')
];

const onlineBankingList = [
  {'logo': 'assets/icons/bank_logo/maybank.png', 'name': 'Maybank2u'},
  {'logo': 'assets/icons/bank_logo/cimb.png', 'name': 'CIMB Clicks'},
  {'logo': 'assets/icons/bank_logo/public_bank.png', 'name': 'Public Bank'},
  {'logo': 'assets/icons/bank_logo/ambank.png', 'name': 'Ambank'},
  {'logo': 'assets/icons/bank_logo/rhb_now.png', 'name': 'RHB Now'},
  {'logo': 'assets/icons/bank_logo/mybsn.png', 'name': 'MyBSN'},
  {'logo': 'assets/icons/bank_logo/uob.png', 'name': 'UOB'},
  {'logo': 'assets/icons/bank_logo/affin_bank.png', 'name': 'Affin Bank'},
  {'logo': 'assets/icons/bank_logo/hsbc_online.png', 'name': 'HSBC Online'},
  {
    'logo': 'assets/icons/bank_logo/standard_chartered_bank.png',
    'name': 'Standard Chartered Bank'
  },
  {
    'logo': 'assets/icons/bank_logo/hong_leong_bank.png',
    'name': 'Hong Leong Connect'
  },
  {'logo': 'assets/icons/bank_logo/ocbc_online.png', 'name': 'OCBC Online'},
  {'logo': 'assets/icons/bank_logo/bank_rakyat.png', 'name': 'Bank Rakyat'},
];

const ewalletList = [
  {'logo': 'assets/icons/e_wallet/tng.png', 'name': 'Touch ‘n Go'},
  {'logo': 'assets/icons/e_wallet/boost.png', 'name': 'Boost'},
  {'logo': 'assets/icons/e_wallet/grab_pay.png', 'name': 'GrabPay'},
  {'logo': 'assets/icons/e_wallet/shopee_pay.png', 'name': 'Shopee Pay'},
  {'logo': 'assets/icons/e_wallet/mae.png', 'name': 'MAE by Maybank'},
  {'logo': 'assets/icons/e_wallet/wechat_pay_my.png', 'name': 'Wechat Pay MY'},
  {'logo': 'assets/icons/e_wallet/favepay.png', 'name': 'FavePay'},
  {'logo': 'assets/icons/e_wallet/alipay.png', 'name': 'Alipay'},
  {
    'logo': 'assets/icons/bank_logo/standard_chartered_bank.png',
    'name': 'Standard Chartered Bank'
  },
  {
    'logo': 'assets/icons/bank_logo/hong_leong_bank.png',
    'name': 'Hong Leong Connect'
  },
  {'logo': 'assets/icons/bank_logo/ocbc_online.png', 'name': 'OCBC Online'},
  {'logo': 'assets/icons/bank_logo/bank_rakyat.png', 'name': 'Bank Rakyat'},
];

class PaymentMethod {
  int id;
  String method;
  PaymentMethod({
    required this.id,
    required this.method,
  });
}

class SelectPaymentMethodPage extends StatefulWidget {
  const SelectPaymentMethodPage({super.key});

  @override
  State<SelectPaymentMethodPage> createState() =>
      _SelectPaymentMethodPageState();
}

class _SelectPaymentMethodPageState extends State<SelectPaymentMethodPage> {
  PaymentMethod? selectedPaymentMethod;

  @override
  Widget build(BuildContext context) {
    final List<PaymentMethod> paymentMethodList = [];
    final creditCardLength = creditCardList.length;
    for (var i = 1; i <= creditCardLength; i++) {
      paymentMethodList.add(PaymentMethod(id: i, method: 'credit_card'));
    }
    for (var i = creditCardList.length;
        i <= (creditCardLength + onlineBankingList.length);
        i++) {
      paymentMethodList.add(PaymentMethod(id: i, method: 'online_banking'));
    }
    for (var i = (creditCardLength + onlineBankingList.length);
        i <= (creditCardLength + onlineBankingList.length + ewalletList.length);
        i++) {
      paymentMethodList.add(PaymentMethod(id: i, method: 'e_wallet'));
    }

    final paymentMethod = {
      'Credit / Debit card': creditCardList,
      'Online banking': onlineBankingList,
      'E-wallets': ewalletList,
    };

    return Scaffold(
      appBar: primaryAppbar(
          title: Text(
        'Select payment method',
        style: textLg.copyWith(fontWeight: FontWeight.w700),
      )),
      body: ListView(
        children: [
          ShowSelectFormColumn(
              onTapContainer: () {},
              formContainer: Container(),
              onTick: () {},
              subtitle: 'Credit',
              isTick: false),
        ],
      ),
    );
  }
}

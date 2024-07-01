// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:kindertown_parent_app/component/primary_appbar.dart';
import 'package:kindertown_parent_app/component/primary_container.dart';
import 'package:kindertown_parent_app/component/primary_textbutton.dart';
import 'package:kindertown_parent_app/helper/color_pallete.dart';
import 'package:kindertown_parent_app/helper/dimensions.dart';
import 'package:kindertown_parent_app/helper/text_styles.dart';
import 'package:kindertown_parent_app/models/credit_card.dart';
import 'package:kindertown_parent_app/pages/homepage/navigation_bar_page/payment/add_new_card_page.dart';
import 'package:kindertown_parent_app/pages/reserve%20a%20seat/reservation/payment_status_page.dart';
import 'package:kindertown_parent_app/pages/reserve%20a%20seat/reservation/widgets/payment_method_list_container.dart';
import 'package:kindertown_parent_app/pages/reserve%20a%20seat/reservation/widgets/show_select_form_column.dart';

final List<CreditCard> creditCardList = [
  CreditCard(
      id: 1,
      bankName: 'PUBLIC BANK BERHAD',
      cardType: 'visa',
      cardNo: '1231 3233 7657 3331')
];

const onlineBankingList = [
  {'logo': 'assets/icons/bank_logo/maybank2u.png', 'name': 'Maybank2u'},
  {'logo': 'assets/icons/bank_logo/cimb_clicks.png', 'name': 'CIMB Clicks'},
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
    'logo': 'assets/icons/bank_logo/hong_leong_connect.png',
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
  {'logo': 'assets/icons/e_wallet/fave_pay.png', 'name': 'FavePay'},
  {'logo': 'assets/icons/e_wallet/alipay.png', 'name': 'Alipay'},
];

class SelectPaymentMethodPage extends StatefulWidget {
  const SelectPaymentMethodPage({super.key});

  @override
  State<SelectPaymentMethodPage> createState() =>
      _SelectPaymentMethodPageState();
}

class _SelectPaymentMethodPageState extends State<SelectPaymentMethodPage> {
  int selectedIndex = -1;
  bool showCreditCardForm = false;
  bool showOnlineBankingForm = false;
  bool showEWalletForm = false;

  @override
  Widget build(BuildContext context) {
    final creditCardLength = creditCardList.length;
    final onlineBankingLength = onlineBankingList.length;
    final eWalletLength = ewalletList.length;

    void onTapContainer(bool showContainer) {
      setState(() {
        showContainer = !showContainer;
      });
    }

    void onTapCard(int index) {
      setState(() {
        selectedIndex = index;
      });
    }

    void onTapOnlineBankingItem(int index) {
      setState(() {
        selectedIndex = creditCardLength + index;
      });
    }

    void onTapEWalletItem(int index) {
      setState(() {
        selectedIndex = creditCardLength + onlineBankingLength + index;
      });
    }

    void onTapNewCard() {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const AddNewCardPage(),
          ));
    }

    void onPressedPay() {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const PaymentStatusPage(status: 'success'),
          ));
    }

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: primaryAppbar(
          title: Text(
        'Select payment method',
        style: textLg.copyWith(fontWeight: FontWeight.w700),
      )),
      body: ListView(
          padding:
              EdgeInsets.symmetric(vertical: height31, horizontal: width24),
          children: [
            ShowSelectFormColumn(
                onTapContainer: () {
                  onTapContainer(showCreditCardForm);
                },
                onTick: () {},
                isVisibleForm: showCreditCardForm,
                subtitle: 'Credit / Debit card',
                isTick: selectedIndex >= 0 && selectedIndex < creditCardLength,
                formContainer: _creditCardListContainer(
                  onTapNewCard: onTapNewCard,
                  selectedIndex: selectedIndex,
                  onTapCard: onTapCard,
                  creditCardList: creditCardList,
                )),
            Padding(
              padding: EdgeInsets.symmetric(vertical: height31),
              child: ShowSelectFormColumn(
                  onTapContainer: () {
                    onTapContainer(showOnlineBankingForm);
                  },
                  onTick: () {},
                  isVisibleForm: showOnlineBankingForm,
                  subtitle: 'Online banking',
                  isTick: selectedIndex >= creditCardLength &&
                      selectedIndex < creditCardLength + onlineBankingLength,
                  formContainer: PaymentMethodListContainer(
                    selectedIndex: selectedIndex - creditCardLength,
                    datas: onlineBankingList,
                    onTapData: onTapOnlineBankingItem,
                  )),
            ),
            ShowSelectFormColumn(
                onTapContainer: () {
                  onTapContainer(showEWalletForm);
                },
                onTick: () {},
                isVisibleForm: showEWalletForm,
                subtitle: 'E-wallets',
                isTick: selectedIndex >=
                        creditCardLength + onlineBankingLength &&
                    selectedIndex <
                        creditCardLength + onlineBankingLength + eWalletLength,
                formContainer: PaymentMethodListContainer(
                  selectedIndex:
                      selectedIndex - creditCardLength - onlineBankingLength,
                  datas: ewalletList,
                  onTapData: onTapEWalletItem,
                )),
            SizedBox(
              height: height10 * 8,
            ),
            Align(
              alignment: Alignment.centerRight,
              child:
                  PrimaryTextButton(onPressed: onPressedPay, buttonText: 'Pay'),
            )
          ]),
    );
  }
}

Widget _creditCardListContainer(
    {void Function()? onTapNewCard,
    required void Function(int index) onTapCard,
    required int selectedIndex,
    required List<CreditCard> creditCardList}) {
  return PrimaryContainer(
    color: Colors.white,
    padding: EdgeInsets.all(height08),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (creditCardList.isEmpty)
          Container(
            width: double.infinity,
            height: height20 * 2,
            decoration: ShapeDecoration(
              color: const Color(0xFFEBEBEB),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            child: Center(
              child: Text(
                'You don’t have any cards.',
                textAlign: TextAlign.center,
                style: textMd.copyWith(
                  color: const Color(0xFFBBBBBB),
                  fontWeight: FontWeight.w700,
                  height: 0,
                ),
              ),
            ),
          ),
        ...creditCardList.mapIndexed(
          (i, e) {
            String? creditCardTypeLogo;
            switch (e.cardType) {
              case 'visa':
                creditCardTypeLogo = 'assets/icons/bank_logo/visa_logo.png';
              case 'mastercard':
                creditCardTypeLogo =
                    'assets/icons/bank_logo/mastercard_logo.png';

                break;
            }
            return InkWell(
              onTap: () {
                onTapCard(i);
              },
              child: Container(
                padding: EdgeInsets.all(height15),
                decoration: BoxDecoration(
                    color: selectedIndex == i
                        ? const Color(0xFFAF00D3).withOpacity(0.06)
                        : const Color(0xFFFFF8EC)),
                child: Row(
                  children: [
                    if (creditCardTypeLogo != null)
                      Image.asset(
                        creditCardTypeLogo,
                        width: width30,
                        fit: BoxFit.fitWidth,
                      ),
                    SizedBox(
                      width: width10,
                    ),
                    Expanded(
                      child: Text(
                        e.bankName,
                        style: textMd.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    Text(
                      '*${e.cardNo.substring(e.cardNo.length - 5, e.cardNo.length)}',
                      style: textMd.copyWith(
                        color: const Color(0xFFBBBBBB),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
        Padding(
          padding: EdgeInsets.all(height15),
          child: InkWell(
            onTap: onTapNewCard,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/icons/plus_icon.png',
                  height: height20,
                ),
                SizedBox(width: width08 / 2),
                Text(
                  'Add new card',
                  textAlign: TextAlign.center,
                  style: textMd.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

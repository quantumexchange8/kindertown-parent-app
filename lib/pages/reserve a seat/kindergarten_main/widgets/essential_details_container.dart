import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kindertown_parent_app/component/primary_container.dart';
import 'package:kindertown_parent_app/helper/dimensions.dart';
import 'package:kindertown_parent_app/helper/methods.dart';
import 'package:kindertown_parent_app/helper/text_styles.dart';
import 'package:kindertown_parent_app/models/kindergarten.dart';

class EssentialDetailsContainer extends StatelessWidget {
  final Kindergarten kindergarten;
  const EssentialDetailsContainer({super.key, required this.kindergarten});

  @override
  Widget build(BuildContext context) {
    const iconAddressPath = 'assets/icons/kindergarten';
    final normalTextStyle = textXS.copyWith(fontWeight: FontWeight.w500);
    final boldTextStyle = textXS.copyWith(fontWeight: FontWeight.w700);

    return PrimaryContainer(
      padding:
          EdgeInsets.symmetric(vertical: height10, horizontal: width24 / 2),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Expanded(
                child: _detailsContainer(
                  iconAddress: '$iconAddressPath/total_children.png',
                  details: Text(
                    kindergarten.maxStudent.toString(),
                    style: normalTextStyle,
                  ),
                ),
              ),
              SizedBox(width: width24 / 4),
              Expanded(
                child: _detailsContainer(
                  iconAddress: '$iconAddressPath/teacher.png',
                  details: Text(
                    kindergarten.teacherList.length.toString(),
                    style: normalTextStyle,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: height24 / 4),
          _detailsContainer(
            iconAddress: '$iconAddressPath/age_icon.png',
            details: Text(
              '${kindergarten.minAge} - ${kindergarten.maxAge} years old',
              style: normalTextStyle,
            ),
          ),
          SizedBox(height: height24 / 4),
          _detailsContainer(
            iconAddress: '$iconAddressPath/menu.png',
            details: RichText(
              text: TextSpan(
                children: kindergarten.classList.entries
                    .map((e) =>
                        TextSpan(text: e.key, style: boldTextStyle, children: [
                          TextSpan(
                            text: ' (${e.value}), ',
                            style: normalTextStyle,
                          )
                        ]))
                    .toList(),
              ),
            ),
          ),
          SizedBox(height: height24 / 4),
          _detailsContainer(
            iconAddress: '$iconAddressPath/phone.png',
            details: Text(
              kindergarten.phoneNumber,
              style: normalTextStyle,
            ),
          ),
          SizedBox(height: height24 / 4),
          _detailsContainer(
            iconAddress: '$iconAddressPath/clock.png',
            details: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ...kindergarten.operationHour.entries.mapIndexed(
                  (i, e) => Padding(
                    padding: EdgeInsets.only(
                        bottom:
                            isLast(i, kindergarten.operationHour.entries.length)
                                ? 0
                                : height08 / 4),
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: '${e.key}:',
                            style: boldTextStyle,
                          ),
                          TextSpan(
                            text: ' ${e.value}',
                            style: normalTextStyle,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: height24 / 4),
          _detailsContainer(
            iconAddress: '$iconAddressPath/toddler.png',
            details: Text(
              '${kindergarten.activities.map((e) => '$e, ')}...',
              style: normalTextStyle,
            ),
          ),
          SizedBox(height: height24 / 4),
          _detailsContainer(
            iconAddress: '$iconAddressPath/horse.png',
            details: Text(
              '${kindergarten.serviceList.map((e) => '$e, ')}...',
              style: normalTextStyle,
            ),
          ),
          SizedBox(height: height24 / 4),
          _detailsContainer(
            iconAddress: '$iconAddressPath/hand_money.png.png',
            details: Text(
              'RM${kindergarten.feePerMonth} /month',
              style: normalTextStyle,
            ),
          ),
          SizedBox(height: height24 / 4),
          _detailsContainer(
            iconAddress: '$iconAddressPath/address_icon.png',
            details: Text(
              kindergarten.address,
              style: normalTextStyle,
            ),
          ),
          SizedBox(height: height24 / 4),
          _detailsContainer(
            iconAddress: '$iconAddressPath/mail.png',
            details: Text(
              kindergarten.email,
              style: normalTextStyle,
            ),
          ),
        ],
      ),
    );
  }
}

Container _detailsContainer(
    {required String iconAddress, required Widget details}) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: width24 / 2, vertical: height08),
    decoration: BoxDecoration(
      color: const Color(0xFFFAF0FC),
      borderRadius: BorderRadius.circular(10),
    ),
    child: Row(
      children: [
        Image.asset(
          iconAddress,
          height: height24,
          fit: BoxFit.fitHeight,
        ),
        SizedBox(width: width20),
        details,
      ],
    ),
  );
}

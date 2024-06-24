import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:kindertown_parent_app/component/primary_appbar.dart';
import 'package:kindertown_parent_app/component/primary_container.dart';
import 'package:kindertown_parent_app/helper/color_pallete.dart';
import 'package:kindertown_parent_app/helper/dimensions.dart';
import 'package:kindertown_parent_app/helper/text_styles.dart';
import 'package:kindertown_parent_app/models/happening_now.dart';

class DetailNoticePage extends StatelessWidget {
  final HappeningNow happeningNow;
  const DetailNoticePage({super.key, required this.happeningNow});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: primaryAppbar(
          title: Text(
        'Detail',
        textAlign: TextAlign.center,
        style: textLg.copyWith(
          fontWeight: FontWeight.w700,
        ),
      )),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: width20, vertical: height30),
        child: PrimaryContainer(
          padding: EdgeInsets.symmetric(horizontal: width24 / 4),
          child: Column(
            children: [
              SizedBox(height: height24 / 2),
              Container(
                width: width100 * 3.62,
                height: height100 * 2.1,
                decoration: ShapeDecoration(
                  image: DecorationImage(
                    image: AssetImage(happeningNow.image),
                    fit: BoxFit.cover,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width24 / 2),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: height20 * 2),
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: width08 * 2, vertical: height05),
                      decoration: ShapeDecoration(
                        color: yellowPrimary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: Text(
                        DateFormat('dd MMMM yyyy')
                            .format(happeningNow.startDate),
                        style: textXS.copyWith(
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.60,
                        ),
                      ),
                    ),
                    SizedBox(height: height24 / 2),
                    Text(
                      happeningNow.title,
                      style: textXL.copyWith(
                        fontWeight: FontWeight.w700,
                        letterSpacing: 1.20,
                      ),
                    ),
                    SizedBox(height: height30),
                    Text(
                      happeningNow.description,
                      style: textSm.copyWith(
                        fontWeight: FontWeight.w500,
                        letterSpacing: 0.70,
                      ),
                    ),
                    SizedBox(height: height45)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

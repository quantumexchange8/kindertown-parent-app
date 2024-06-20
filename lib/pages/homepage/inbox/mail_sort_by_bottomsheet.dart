import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:kindertown_parent_app/helper/color_pallete.dart';
import 'package:kindertown_parent_app/helper/dimensions.dart';
import 'package:kindertown_parent_app/helper/text_styles.dart';

class MailSortByBottomsheet extends StatefulWidget {
  final String? filter;
  const MailSortByBottomsheet({super.key, required this.filter});

  @override
  State<MailSortByBottomsheet> createState() => _MailSortByBottomsheetState();
}

class _MailSortByBottomsheetState extends State<MailSortByBottomsheet> {
  String? filter;

  @override
  void initState() {
    super.initState();
    filter = widget.filter;
  }

  @override
  Widget build(BuildContext context) {
    Widget filterContainer(
        {required bool selected,
        required String text,
        void Function()? onTap}) {
      if (selected) {
        return _selectedContainer(text);
      } else {
        return InkWell(onTap: onTap, child: _sortContainer(text));
      }
    }

    return BottomSheet(
      backgroundColor: backgroundColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      onClosing: () {},
      builder: (context) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: height20),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: width24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Sort by:',
                      style: textLg.copyWith(
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    TextButton(
                      onPressed: filter != null
                          ? () {
                              Navigator.pop(context, filter);
                            }
                          : null,
                      child: Text(
                        'DONE',
                        textAlign: TextAlign.center,
                        style: textXS.copyWith(
                          color: filter == null
                              ? const Color(0xFFBBBBBB)
                              : orangePrimary,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: height30,
              ),
              filterContainer(
                  onTap: () {
                    setState(() {
                      filter = 'kindergarten';
                    });
                  },
                  selected: filter == 'kindergarten',
                  text: 'Only see the message from kindergarten'),
              SizedBox(
                height: height15,
              ),
              filterContainer(
                  onTap: () {
                    setState(() {
                      filter = 'kindertown';
                    });
                  },
                  selected: filter == 'kindertown',
                  text: 'Only see the message from KinderTown'),
              SizedBox(
                height: height20 * 2,
              ),
              TextButton(
                onPressed: filter != null
                    ? () {
                        setState(() {
                          filter = null;
                        });
                      }
                    : null,
                child: Text(
                  'Reset',
                  textAlign: TextAlign.center,
                  style: textMd.copyWith(
                      color: filter == null
                          ? const Color(0xFFBBBBBB)
                          : orangePrimary,
                      fontWeight: FontWeight.w700,
                      decoration: TextDecoration.underline,
                      decorationColor: filter == null
                          ? const Color(0xFFBBBBBB)
                          : orangePrimary),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

Widget _sortContainer(String text) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: width30, vertical: height08),
    decoration: ShapeDecoration(
      color: yellowPrimary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
    ),
    child: Text(
      text,
      textAlign: TextAlign.center,
      style: textMd.copyWith(
        fontFamily: 'Inter',
        fontWeight: FontWeight.w700,
      ),
    ),
  );
}

Widget _selectedContainer(String text) {
  return SizedBox(
    width: width100 * 3.65,
    height: height10 * 4,
    child: Stack(
      alignment: Alignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
              color: const Color(0xFFFCBF4A),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.white)),
          child: DottedBorder(
            borderType: BorderType.RRect,
            radius: const Radius.circular(20),
            color: orangePrimary,
            strokeWidth: 3,
            dashPattern: const [4, 4],
            borderPadding: const EdgeInsets.all(2),
            padding: EdgeInsets.symmetric(
                vertical: height08 / 2, horizontal: width20),
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: textMd.copyWith(
                fontFamily: 'Inter',
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: Container(
            height: height24,
            width: height24,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: orangePrimary,
            ),
            child: Icon(
              Icons.check_circle_outline,
              color: Colors.white,
              size: height24,
            ),
          ),
        )
      ],
    ),
  );
}
